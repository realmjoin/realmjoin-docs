---
title: Report Teams Channels (Scheduled)
description: List private and shared channels of all teams with their owners
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Walks through every team in the tenant and lists its private and shared channels with the team they belong to, their owners and, if wanted, their members. Private channels are not visible in the group view of the RealmJoin Portal, so this report shows who owns and who can access them. Channels without any owner are listed separately. The report can be sent by email or provided as a download link.

## How it works

The runbook lists every Microsoft 365 group that is provisioned as a team, optionally narrowed by *Team name prefix*. For each team it reads the channels of the selected types and, for each channel, the member list.

- **Private channels** belong to one team; only their members see them, and they do not appear in the group view of the RealmJoin Portal or in the group membership of the team. This report is the way to see them at a glance.
- **Shared channels** are hosted by one team and can be shared with other teams and with people from other tenants. The report lists the shared channels a team hosts; channels shared into a team from elsewhere are not repeated under that team.

Every row names the team and its visibility, the channel, its type, whether it is archived, the creation date, the number of owners, members and external members, and the owners by name and email. With *List the members too?* set to yes, the members are listed by name as well; leave it off in large tenants to keep the report short.

Channels without any owner are listed in their own table and worksheet. A private or shared channel keeps working without an owner, but nobody can manage its membership from inside Teams, so such channels are the first candidates for cleanup.

### External members

A member whose tenant differs from the home tenant is marked *(external)* and counted in the *ExternalCount* column. Guest accounts of the home tenant are not marked, as they are members of the tenant directory.

### Teams and channels that cannot be read

A team whose channels cannot be read, for example because it was deleted while the report ran or because the team is archived and inaccessible, is listed in the *Teams not readable* table with the reason and does not stop the run. A channel whose member list cannot be read keeps its row with the reason in the *Note* column and is not counted as a channel without owner.

### Runtime

Channels and members are read through Graph batch requests, twenty at a time. A tenant with several thousand teams still takes a while; the job log shows the progress. Use *Team name prefix* to report on a subset.

## Report delivery

The results always appear as named tables in the Output Data tab of the run in the RealmJoin portal. Report files are only generated when the **Report delivery** option includes an email and/or a download link; *Output Data only* creates no report files. Email delivery and download link generation are independent and can be combined.

For the download link, the report files are uploaded to the Azure storage account configured in the `RJReport.StorageAccount.*` tenant settings, and time-limited SAS download links are returned. The storage upload authenticates with the Automation account's managed identity; that identity needs the **Storage Account Contributor** RBAC role on the target storage account (this is an Azure RBAC assignment, not a Graph application permission).

## Setup regarding email sending

Sending an email report is optional and only happens when *Also email the report* or *Also email & download link* is selected as report delivery; a recipient is then required. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details on all available settings.

### Email branding

The report email honors the optional `RJReport.Branding.*` tenant settings:

- **Header and footer image** - public HTTPS URLs, PNG/JPEG/GIF, max. 200 KB each
- **Footer link** - target of the footer image
- **Accent and text color** - 6-digit hex values, e.g. `#0052cc`

When these settings are not configured, the default RealmJoin graphics and colors are used. An image that cannot be downloaded or validated, or an invalid color value, never prevents the report email - the corresponding default is used instead.

Setup instructions and image requirements: [Email branding](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings#email-branding-optional).

## Notes and limitations

- The report is read-only. Owners and members of private and shared channels are changed in the Teams admin center or in Teams itself; the runbooks **Sync Channel Or Group Members (Scheduled)** and **Sync Shared Channel Owners (Scheduled)** cover the automated cases for shared channels.
- Standard channels are not listed; their membership equals the team membership, which the RealmJoin Portal shows.
- The member list of a shared channel contains its direct members. People who reach a shared channel through another team that the channel is shared with are not listed.


## Location
Organization → Collab → Report Teams Channels (Scheduled)

**Full Runbook name**

rjgit-org_collab_report-teams-channels_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>Az.Accounts (>= 5.5.2) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Channel.ReadBasic.All
    - *Lists the private and shared channels of every team via /teams/{id}/channels*
  - ChannelMember.Read.All
    - *Reads the members of every listed channel to tell owners, members and external members apart*
  - Group.Read.All
    - *Lists the Microsoft 365 groups that are provisioned as teams with their name and visibility*
  - Mail.Send *(optional — feature: Email report)*
    - *Sends the report email via Send-RjRbReportEmail when email delivery is selected*
  - Organization.Read.All *(optional — feature: Email report)*
    - *Reads the tenant display name for the email subject, the email body and the report file names*

### Permission notes
Azure Storage Account: 'Storage Account Contributor' role for the Automation Account's managed identity on the target storage account - the upload retrieves the account keys via listKeys (only required for the download link options)


## Parameters
### IncludePrivateChannels

Lists the private channels hosted by each team.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Include private channels? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Yes | true |
| No | false |

### IncludeSharedChannels

Lists the shared channels hosted by each team. Members from other tenants are marked as external.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Include shared channels? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Yes | true |
| No | false |

### IncludeMembers

Also lists the members of each channel by name. Off lists the owners only, which keeps the report short in large tenants.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | List the members too? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Yes, owners and members | true |
| No, owners only | false |

### TeamNamePrefix

Only teams whose name starts with this text. Leave empty for all teams.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Team name prefix |

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

### SendEmailReport

Send the report to the recipient email address.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### EmailTo

Send the report to these addresses. Separate several with commas; each recipient gets a separate email.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Recipient email address(es) |
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
| Hidden in portal | yes (preset via runbook customization) |

### ContainerName

Storage container the report files are uploaded to. Set per runbook.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | report-teams-channels |
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

