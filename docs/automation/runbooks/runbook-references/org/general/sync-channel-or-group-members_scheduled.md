---
title: Sync Channel Or Group Members (Scheduled)
description: Mirror members between a Teams shared channel and a group
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Copies the members of a source into a target on every run. The source and target can be a shared channel and a security group, two groups, or a group and a shared channel. Missing members are always added; members that exist only in the target are removed only when asked. A dry run shows the changes without applying them, and the report can be sent by email or provided as a download link. Details on the options are in the runbook documentation (docs.realmjoin.com).

## How it works

This scheduled runbook mirrors the membership of a **source** object into a **target** object in a
single direction per run. On each run it:

1. Resolves the source and target objects for the selected direction.
2. Reads the current member set of both sides.
3. Adds every source member that is missing from the target.
4. Optionally removes every target member that does not exist in the source (mirror mode).

### Directions

The `Direction` parameter selects what is synced into what:

- **`SharedChannelToGroup`** - the members of a Teams shared channel are copied into a target security group.
- **`GroupToGroup`** - the members of a source group are copied into a target group (for example a Microsoft 365 group into a security group, or the reverse by swapping source and target).
- **`GroupToSharedChannel`** - the members of a source group are copied into a Teams shared channel.

### Adding and removing

Adding missing members is always performed. Removing members that exist only in the target is **opt-in**
via `RemoveExtraMembers` (default off). With removal enabled, the target is mirrored exactly against the
source; with it disabled, the runbook is add-only.

### Group member expansion

Group members on the source side are resolved **transitively**, so users that are members through nested
groups are included. On the target side only **direct** members are considered, because add and remove
operations act on direct membership.

### Guest handling

`IncludeGuests` (default off) controls whether guest users take part in the sync. When it is off, guests
are skipped on both sides and are never added or removed. Shared channels frequently reject guests, so
this is off by default.

### Shared channel specifics

- When a group is synced **into** a shared channel, team membership is a prerequisite for channel
  membership, so the runbook first ensures the user is a member of the host team and then adds the user
  to the channel.
- When members are **removed** from a shared channel, only the channel membership is removed by default.
  Enable `RemoveFromTeam` to also remove the user from the host team membership.

### Dry run

Set `WhatIfMode` to log what would change without writing anything.

### Reporting (optional, both default off)

- **`SendEmailReport`** sends a RealmJoin-branded email (via `Send-RjRbReportEmail`) with run statistics and
  a CSV attachment listing every individual change. The sender is taken from the `RJReport.EmailSender`
  setting.
- **`CreateDownloadLink`** uploads the same CSV to a storage account and returns a time-limited SAS
  download link (also embedded into the email when both options are enabled). The target storage account
  is taken from the `RJReport.StorageAccount.*` settings.

The storage upload authenticates with the Automation account's managed identity; that identity needs the
**Storage Account Contributor** RBAC role on the target storage account (this is an Azure RBAC
assignment, not a Graph application permission).

### Scheduling

Designed to run unattended on a schedule. Because the runbook is idempotent, a single recurring schedule
keeps the target in sync with the source as members come and go.

## Email branding

The report email honors the optional `RJReport.Branding.*` tenant settings:

- **Header and footer image** – public HTTPS URLs, PNG/JPEG/GIF, max. 200 KB each
- **Footer link** – target of the footer image
- **Accent and text color** – 6-digit hex values, e.g. `#0052cc`

When these settings are not configured, the default RealmJoin graphics and colors are used. An image that cannot be downloaded or validated, or an invalid color value, never prevents the report email – the corresponding default is used instead.

Setup instructions and image requirements: [Email branding](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings#email-branding-optional).


## Location
Organization → General → Sync Channel Or Group Members (Scheduled)

**Full Runbook name**

rjgit-org_general_sync-channel-or-group-members_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.3.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>Az.Accounts (>= 5.5.2) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Group.ReadWrite.All
    - *Resolves source/target groups and the host team and writes direct membership via /groups/{id}/members/$ref*
  - GroupMember.ReadWrite.All
    - *Adds and removes direct target-group members during the sync*
  - Channel.ReadBasic.All
    - *Lists /teams/{id}/channels to resolve the shared channel and verify it is a shared channel*
  - ChannelMember.ReadWrite.All
    - *Reads, adds and removes shared channel members via /teams/{id}/channels/{id}/members*
  - TeamMember.ReadWrite.All
    - *Adds/removes host-team membership as prerequisite or cleanup for shared channel members*
  - User.Read.All
    - *Reads member user objects (id, UPN, userType) to detect guests and compute the membership delta*
  - Organization.Read.All
    - *Reads /organization to include the tenant name in the report email*
  - Mail.Send *(optional — feature: Email report)*
    - *Sends the sync report via Send-RjReportEmail when email reporting is enabled*


## Parameters
### Direction

What is copied where: shared channel members into the target group, source group members into the target group, or source group members into the shared channel.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Direction |

**Portal options**

| Portal option | Value |
| --- | --- |
| Shared channel members to security group | SharedChannelToGroup |
| Group members to group | GroupToGroup |
| Group members to shared channel | GroupToSharedChannel |

### TeamId

Team that hosts the shared channel. Needed for the shared channel directions only.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Team hosting the shared channel |

### ChannelName

Exact name of the shared channel in that team. Needed for the shared channel directions only.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Shared channel name |

### SourceGroupId

Group whose members are copied. Needed when the source is a group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Source group |
| Hidden in portal | yes (preset via runbook customization) |

### TargetGroupId

Security group that receives the members. Needed when the target is a group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Target security group |

### RemoveExtraMembers

Also removes members that exist only in the target, so it mirrors the source exactly. Otherwise members are only added.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Remove members missing in the source? |

### IncludeGuests

Also adds and removes guest users. Otherwise guests are left untouched on both sides.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include guest users? |

### RemoveFromTeam

When a member is removed from the shared channel, also removes them from the host team. Only applies when a group is copied into a shared channel.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Also remove from the host team? |
| Hidden in portal | yes (preset via runbook customization) |

### WhatIfMode

Only logs what would change without writing anything.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Dry run? |

### SendEmailReport

Send the report to the recipient email address.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Send email report? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Yes - send the report via email | true |
| No - do not send an email | false |

### EmailTo

Send the report to these addresses. Separate several with commas; each recipient gets a separate email.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Recipient email address(es) |
| Hidden in portal | yes (preset via runbook customization) |

### EmailFrom

Sender address of the report email. Taken from the tenant setting RJReport.EmailSender.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingHeaderImageUrl

Header image of the report email (HTTPS URL, PNG/JPEG/GIF, max 200 KB). Taken from the tenant setting RJReport.Branding.HeaderImageUrl; the default RealmJoin header is used when empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterImageUrl

Footer image of the report email (HTTPS URL, PNG/JPEG/GIF, max 200 KB). Taken from the tenant setting RJReport.Branding.FooterImageUrl; the default RealmJoin footer is used when empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterLink

Link behind the footer image of the report email. Taken from the tenant setting RJReport.Branding.FooterLink; realmjoin.com is used when empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingAccentColor

Accent color of the report email as a 6-digit hex value. Taken from the tenant setting RJReport.Branding.AccentColor; the RealmJoin default is used when empty or invalid.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingTextColor

Text color of the report email as a 6-digit hex value. Taken from the tenant setting RJReport.Branding.TextColor; the RealmJoin default is used when empty or invalid.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ReportFileFormat

Deliver the report as CSV, as an Excel workbook, or both.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | CSV & XLSX |
| Type | String |
| Portal display name | Report file format |
| Hidden in portal | yes (preset via runbook customization) |

**Portal options**

| Portal option | Value |
| --- | --- |
| CSV & XLSX | CSV & XLSX |
| CSV only | CSV only |
| XLSX only | XLSX only |

### CreateDownloadLink

Also upload the report and return a download link that expires after a few days.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Create a download link? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Yes - upload report and return a download link | true |
| No - do not create a download link | false |

### ContainerName

Storage container the report files are uploaded to. Set per runbook.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | channel-group-member-sync |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ResourceGroupName

Resource group of the storage account for report uploads. Taken from the tenant setting RJReport.StorageAccount.ResourceGroup.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountName

Storage account for report uploads. Taken from the tenant setting RJReport.StorageAccount.StorageAccountName.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### LinkExpiryDays

Number of days a download link stays valid. Taken from the tenant setting RJReport.StorageAccount.LinkExpiryDays.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 6 |
| Type | Int32 |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

