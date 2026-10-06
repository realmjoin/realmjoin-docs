---
title: List Sharepoint Sitecollection Permission
description: List the administrators and members of a SharePoint site
---

## Description
Shows who has access to a SharePoint Online site collection: the site collection administrators and the members of the Owners, Members and Visitors groups. Each entry shows its type, such as user, Entra ID group, security group or SharePoint group. Nothing is changed.

## Parameter behaviour

- `SiteUrl` must point at a site collection root (for example `https://contoso.sharepoint.com/sites/marketing`), not at a sub-site. A sub-site URL still returns results, but they describe the parent site collection; the runbook logs a warning when this happens.
- The Owners, Members and Visitors groups are resolved via the site's associated-group properties, not by matching localized group names, so the report is accurate regardless of the tenant language. Any of the three groups may be absent (common on Teams-connected sites) and is then reported as "not configured" instead of causing a failure.


## Location
Organization → Collab → List Sharepoint Sitecollection Permission

**Full Runbook name**

rjgit-org_collab_list-sharepoint-sitecollection-permission

## Details

| Property | Value |
| --- | --- |
| Version | 1.2.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>PnP.PowerShell (>= 3.4.1) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Office 365 SharePoint Online
  - Sites.FullControl.All
    - *Connects via Connect-PnPOnline -ManagedIdentity and calls Get-PnPWeb, Get-PnPSite, Get-PnPSiteCollectionAdmin and Get-PnPGroupMember against the target site collection; Get-PnPSiteCollectionAdmin in particular requires more than read-only site access, so Sites.Read.All is insufficient. Sites.Selected was not used because it would require per-site consent to be pre-granted outside this runbook's control, which this runbook cannot guarantee for an arbitrary $SiteUrl.*

### Permission notes
Grant admin consent for the 'Sites.FullControl.All' application permission on the Office 365 SharePoint Online API (App ID 00000003-0000-0ff1-ce00-000000000000) to the Azure Automation account's system-assigned managed identity; this SharePoint app-only-via-managed-identity consent cannot be assigned through the standard Microsoft Graph app-role automation used for Graph permissions. See the runbook's documentation file for the assignment commands.


## Parameters
### SiteUrl

Full URL of the site, for example https://contoso.sharepoint.com/sites/marketing.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Site collection URL |



[Back to Runbook Reference overview](../../README.md)

