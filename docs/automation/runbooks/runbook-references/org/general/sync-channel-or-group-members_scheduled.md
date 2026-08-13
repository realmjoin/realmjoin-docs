---
title: Sync Channel Or Group Members (Scheduled)
description: Sync members between a Teams Shared Channel or a group and an Entra security group
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
This scheduled runbook mirrors the membership of a source object into a target object in one
direction per run. It supports syncing Teams Shared Channel members into a security group, syncing
the members of one group into another group (for example a Microsoft 365 group into a security group
or vice versa) and syncing group members into a Teams Shared Channel. Adding missing members is always
performed, while removing members that only exist in the target is optional and controlled by a
parameter. Guest handling and whether channel removals also remove the host team membership are
configurable, and the runbook can optionally send an email report and upload the results as a
time-limited download link. The ReportFileFormat parameter controls which report file formats are
generated and delivered (CSV only, CSV & XLSX, or XLSX only). When the CSV attachment exceeds the
email size limit and "CSV & XLSX" is selected, the email falls back to the Excel workbook alone.

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

- **`SendEmailReport`** sends a RealmJoin-branded email (via `Send-RjReportEmail`) with run statistics and
  a CSV attachment listing every individual change. The sender is taken from the `RJReport.EmailSender`
  setting.
- **`CreateDownloadLink`** uploads the same CSV to a storage account and returns a time-limited SAS
  download link (also embedded into the email when both options are enabled). The target storage account
  is taken from the `RJReport.StorageAccount.*` settings.

The storage upload authenticates with the Automation account's managed identity; that identity needs the
**Storage Blob Data Contributor** RBAC role on the target storage account (this is an Azure RBAC
assignment, not a Graph application permission).

### Scheduling

Designed to run unattended on a schedule. Because the runbook is idempotent, a single recurring schedule
keeps the target in sync with the source as members come and go.


## Location
Organization → General → Sync Channel Or Group Members (Scheduled)

**Full Runbook name**

rjgit-org_general_sync-channel-or-group-members_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>Az.Accounts (>= 5.5.0) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Group.ReadWrite.All
  - GroupMember.ReadWrite.All
  - Channel.ReadBasic.All
  - ChannelMember.ReadWrite.All
  - TeamMember.ReadWrite.All
  - User.Read.All
  - Organization.Read.All
  - Mail.Send


## Parameters
### Direction

Selects what is synced into what. SharedChannelToGroup copies shared channel members into the target
group, GroupToGroup copies the source group members into the target group, and GroupToSharedChannel
copies the source group members into the shared channel.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | What should be synced |

**Portal options**

| Portal option | Value |
| --- | --- |
| Shared Channel members -> security group |  |
| Group members -> group |  |
| Group members -> Shared Channel |  |

### TeamId

Object id of the team that hosts the shared channel. Only used for the shared channel directions.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Team hosting the shared channel |

### ChannelName

Exact display name of the shared channel inside the selected team. Only used for the shared channel
directions.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Shared channel display name |

### SourceGroupId

Object id of the source group whose members are copied. Used for the group source directions.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Source group |
| Hidden in portal | yes (preset via runbook customization) |

### TargetGroupId

Object id of the target security group that receives the members. Used for the group target directions.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Target security group |

### RemoveExtraMembers

When enabled, members that exist only in the target and not in the source are removed so the target
mirrors the source. When disabled (default), the runbook only adds missing members.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Remove members that only exist in the target (mirror source) |

### IncludeGuests

When enabled, guest users are included in the sync and may be added or removed. When disabled (default),
guests are skipped and are never added or removed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include guest users |

### RemoveFromTeam

Only relevant for GroupToSharedChannel. When enabled, removing a member from the shared channel also
removes that user from the host team membership. When disabled (default), only the channel membership
is removed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | On channel removal, also remove the user from the host team |
| Hidden in portal | yes (preset via runbook customization) |

### WhatIfMode

When enabled, the runbook only logs the changes it would make without writing anything.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Dry run (log only, no changes) |

### SendEmailReport

When enabled, a RealmJoin-branded email report is sent via Send-RjReportEmail after the run. Toggling
this on reveals the recipient address and report file format fields.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Send email report |

**Portal options**

| Portal option | Value |
| --- | --- |
| Yes - send the report via email |  |
| No - do not send an email |  |

### EmailTo

Recipient email address(es) for the report (comma-separated). Only used when SendEmailReport is enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Send report to (email address(es)) |
| Hidden in portal | yes (preset via runbook customization) |

### EmailFrom

Sender mailbox for the report. Bound to the org Setting RJReport.EmailSender.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ReportFileFormat

Controls which report file formats are generated and delivered: "CSV only", "CSV & XLSX" (default) or "XLSX only".

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
| CSV & XLSX |  |
| CSV only |  |
| XLSX only |  |

### CreateDownloadLink

When enabled, the report file(s) are uploaded to a storage account and time-limited download links are
returned (and included in the email report if that is also enabled).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Create a report download link (upload report to storage) |

**Portal options**

| Portal option | Value |
| --- | --- |
| Yes - upload report and return a download link |  |
| No - do not create a download link |  |

### ContainerName

Storage container used for the upload. Configured per runbook.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | channel-group-member-sync |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ResourceGroupName

Resource group that contains the storage account. Bound to RJReport.StorageAccount.ResourceGroup.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountName

Storage account used for the upload. Bound to RJReport.StorageAccount.StorageAccountName.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### LinkExpiryDays

Days until the generated download link expires. Bound to RJReport.StorageAccount.LinkExpiryDays.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 6 |
| Type | Int32 |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

