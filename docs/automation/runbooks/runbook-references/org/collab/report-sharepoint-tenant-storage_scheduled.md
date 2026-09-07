---
title: Report Sharepoint Tenant Storage (Scheduled)
description: Monitor SharePoint Online tenant storage and alert when thresholds are exceeded
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Scheduled monitor for SharePoint Online tenant storage capacity and usage. Connects to the SharePoint admin center using managed identity, retrieves the tenant storage quota and the top site collections by consumed storage, and reports the full inventory to the runbook output on every run. An alert email is sent only when free storage falls below the configured low-storage limit or unused licensed storage rises above the configured reclaimable threshold.

## Location
Organization → Collab → Report Sharepoint Tenant Storage (Scheduled)

**Full Runbook name**

rjgit-org_collab_report-sharepoint-tenant-storage_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.2.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>PnP.PowerShell (>= 3.4.1) |
| Schedulable | yes |

## Notes
Common Use Cases:
- Scheduled daily health check of SharePoint Online tenant storage, alerting only when a
  threshold is breached.
- Spotting a tenant approaching its storage quota before users are blocked from saving files.
- Spotting a large amount of unused, potentially reclaimable licensed storage.

Runbook Type: Scheduled (recommended: daily). The storage summary and the top site collections
are written to the runbook output on every run regardless of whether a threshold is breached, so
job history remains useful even on days with no alert.

Parameter Interactions:
- AlertLowStorageLimitInMB alerts when free tenant storage drops below the configured value.
- AlertUnusedStorageLimitInMB alerts when free tenant storage rises above the configured value
  (an indicator of reclaimable licensed storage); set it to 0 to disable this check.
- Both checks can fire in the same run only if AlertLowStorageLimitInMB is configured higher than
  AlertUnusedStorageLimitInMB - review both values together when tuning thresholds.
- The alert email is sent only when at least one threshold is breached; a run with no breach
  completes normally and sends nothing.
- The top site collections list covers SharePoint site collections only; OneDrive for Business
  sites are excluded because their storage does not count against the tenant storage quota this
  runbook monitors.


Notes and Limitations:
- Get-PnPTenantSite does not reliably report a site's creation date on every tenant or module
  version; the report shows "Unknown" for that site when this occurs.
- Enumerating all site collections can take several minutes in tenants with a large number of
  sites.

Requires -Modules @{ModuleName = "RealmJoin.RunbookHelper"; ModuleVersion = "0.8.9" }
Requires -Modules @{ModuleName = "PnP.PowerShell"; ModuleVersion = "3.4.1" }

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Mail.Send
    - *Sends the storage threshold alert email via Send-RjReportEmail; this runbook's entire purpose is the alert, so the send is unconditional on a breach, not a toggle*
  - Organization.Read.All
    - *Reads /organization via Invoke-RjRbRestMethodGraph to resolve the tenant display name used in the alert email subject and branding*
- **Type**: Office 365 SharePoint Online
  - Sites.FullControl.All
    - *This runbook connects with Connect-PnPOnline -ManagedIdentity against the SharePoint admin center URL and calls the tenant-admin cmdlets Get-PnPGeoStorageQuota and Get-PnPTenantSite, which require tenant-wide full control; read-only Sites.Read.All is insufficient for the tenant-admin endpoint*

### Permission notes
SharePoint Online: grant Sites.FullControl.All on the 'Office 365 SharePoint Online' resource (appId 00000003-0000-0ff1-ce00-000000000000) to the Automation Account's managed identity — this app-only grant cannot be made through the standard Entra app-role-assignment flow used for Microsoft Graph and must be assigned manually per tenant.


## Parameters
### AlertLowStorageLimitInMB

Low-storage alert threshold in megabytes. An alert email is sent when free tenant storage falls below this limit.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | 200 |
| Type | Int32 |

### AlertUnusedStorageLimitInMB

Unused-storage alert threshold in megabytes. An alert email is sent when unused licensed storage (storage assigned but not consumed by any site) rises above this limit, indicating storage that could be reclaimed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 1024 |
| Type | Int32 |

### TopSiteCount

Number of site collections to report, ordered by consumed storage. Default is 10.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 10 |
| Type | Int32 |

### EmailFrom

The sender email address. This needs to be configured in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### BrandingHeaderImageUrl

URL of a custom header image for report emails. Configured as a tenant setting; leave empty to use the default RealmJoin branding.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### BrandingFooterImageUrl

URL of a custom footer image for report emails. Configured as a tenant setting; leave empty to use the default RealmJoin branding.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### BrandingFooterLink

Link target applied to the footer image in report emails, for example the company website. Configured as a tenant setting; leave empty to use the default RealmJoin branding.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### BrandingAccentColor

Accent color used for headings and highlights in report emails. Configured as a tenant setting; leave empty to use the default RealmJoin branding.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### BrandingTextColor

Body text color used in report emails. Configured as a tenant setting; leave empty to use the default RealmJoin branding.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### AlertEmailTo

Recipient email address for alert emails. Emails are sent only when storage thresholds are exceeded.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### AlertEmailSubject

Subject line for alert emails.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | RealmJoin - SharePoint Online Storage Alert |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

