---
title: Report Sharepoint Tenant Storage (Scheduled)
description: Monitor SharePoint storage and alert when limits are exceeded
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Checks the storage of the SharePoint Online tenant on every run: the quota, how much is used, and the site collections that use the most. The full inventory is written to the run output. An alert email is sent only when the free storage drops below the low-storage limit or the licensed but unused storage exceeds the reclaimable limit.

## Common use cases

- Scheduled daily health check of the SharePoint Online tenant storage that alerts only when a threshold is breached.
- Spotting a tenant that approaches its storage quota before users are blocked from saving files.
- Spotting a large amount of unused, potentially reclaimable licensed storage.

## Scheduling and output

A daily schedule is recommended. The storage summary, the result of both threshold checks and the top site collections are written to the **Output Data** tab of the job on every run, regardless of whether a threshold is breached, so the job history stays useful on days without an alert. No report files are created.

## Parameter interactions

- `AlertLowStorageLimitInGB` alerts when the free tenant storage drops below the configured value.
- `AlertUnusedStorageLimitInGB` alerts when the free tenant storage rises above the configured value, an indicator of reclaimable licensed storage. Set it to `0` to disable this check.
- Both checks can fire in the same run only when `AlertLowStorageLimitInGB` is configured higher than `AlertUnusedStorageLimitInGB`; review both values together when tuning the thresholds.
- The alert email is only sent when at least one threshold is breached. A run without a breach completes normally and sends nothing.
- The top site collections list covers SharePoint site collections only. OneDrive for Business sites are excluded because their storage does not count against the tenant storage quota this runbook monitors.

## Setup regarding email sending

Sending the alert email only happens when a storage threshold is breached; it goes to the recipient (`AlertEmailTo`). The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details on all available settings.

### Email branding

The report email honors the optional `RJReport.Branding.*` tenant settings:

- **Header and footer image** – public HTTPS URLs, PNG/JPEG/GIF, max. 200 KB each
- **Footer link** – target of the footer image
- **Accent and text color** – 6-digit hex values, e.g. `#0052cc`

When these settings are not configured, the default RealmJoin graphics and colors are used. An image that cannot be downloaded or validated, or an invalid color value, never prevents the report email – the corresponding default is used instead.

Setup instructions and image requirements: [Email branding](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings#email-branding-optional).

## Limitations

- Enumerating all site collections can take several minutes in tenants with a large number of sites.


## Location
Organization → Collab → Report Sharepoint Tenant Storage (Scheduled)

**Full Runbook name**

rjgit-org_collab_report-sharepoint-tenant-storage_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.5.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>PnP.PowerShell (>= 3.4.1) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Mail.Send
    - *Sends the storage threshold alert email via Send-RjRbReportEmail; this runbook's entire purpose is the alert, so the send is unconditional on a breach, not a toggle*
  - Organization.Read.All
    - *Reads /organization to resolve the tenant display name used in the alert email subject and branding*
  - Sites.Read.All
    - *Reads the tenant root site (/sites/root) to derive the SharePoint admin center URL used by Connect-PnPOnline*
- **Type**: Office 365 SharePoint Online
  - Sites.FullControl.All
    - *This runbook connects with Connect-PnPOnline -ManagedIdentity against the SharePoint admin center URL and calls the tenant-admin cmdlets Get-PnPGeoStorageQuota and Get-PnPTenantSite, which require tenant-wide full control; read-only Sites.Read.All is insufficient for the tenant-admin endpoint*

### Permission notes
SharePoint Online: grant Sites.FullControl.All on the 'Office 365 SharePoint Online' resource (appId 00000003-0000-0ff1-ce00-000000000000) to the Automation Account's managed identity — this app-only grant cannot be made through the standard Entra app-role-assignment flow used for Microsoft Graph and must be assigned manually per tenant.


## Parameters
### AlertLowStorageLimitInGB

Send an alert when the free tenant storage drops below this many gigabytes.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | 200 |
| Type | Int32 |
| Portal display name | Alert when free storage falls below (GB) |

### AlertUnusedStorageLimitInGB

Send an alert when the licensed storage that no site uses exceeds this many gigabytes. That storage could be reclaimed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1024 |
| Type | Int32 |
| Portal display name | Alert when unused storage rises above (GB) |

### TopSiteCount

How many of the largest site collections are listed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 10 |
| Type | Int32 |
| Portal display name | Number of top site collections to report |

### EmailFrom

Sender address of the alert email. Taken from the tenant setting RJReport.EmailSender.

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

### AlertEmailTo

Address the alert goes to when a limit is exceeded.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Alert recipient email address |

### AlertEmailSubject

Subject line of the alert email.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | RealmJoin - SharePoint Online Storage Alert |
| Type | String |
| Portal display name | Alert email subject |



[Back to Runbook Reference overview](../../README.md)

