---
title: Report Intune Enrollment Readiness
description: Report which users can enroll devices in Intune
---

## Description
Checks for a set of users, given directly or through a group, whether they can enroll a device in Intune. Each user is reported as Ready, Ready with warnings or Not ready, with the blockers found. The check covers account status, Intune license, enrollment limit, authentication methods and Conditional Access policies that target device registration or enrollment. Nothing is changed. The report can be sent by email or provided as a download link.

## Interpretation notes

- Checks performed per user: account state, Intune license and service plan, tenant MDM authority, device enrollment limit, platform restrictions, registered authentication methods, Conditional Access policies and, optionally, pilot group membership.
- Conditional Access is evaluated as a static "What If" against the enrollment sign-in for each user's `EnrollmentPlatform`; Entra's own What If tool remains the authority.
- Compliant-device requirements on "All resources" policies do not block enrollment (a documented Entra exemption); only policies targeting device registration or the Intune enrollment apps are treated as strict gates.
- Not evaluated statically: named locations, device filters, sign-in frequency and terms of use.
- Expired or already used Temporary Access Passes are not counted as usable methods.

## Prerequisites

At least one of `UserName` or `GroupName` is required; group memberships are resolved transitively.

## Report delivery

Every run writes its results to the Output Data tab of the RealmJoin portal: a summary, the top blocking reasons and one table per readiness status (*Not ready*, *Ready with warnings*, *Ready*). Each table can be exported to Excel there.

Report files are only generated when a delivery method is selected via the **Report delivery** option (email and/or download link). With *Output Data only* selected, the results are read directly in the Output Data tab. Email delivery and download link generation are independent and can be combined.

For the download link, the report files are uploaded to the Azure storage account configured in the `RJReport.StorageAccount.*` tenant settings, and time-limited SAS download links are returned. The storage upload authenticates with the Automation account's managed identity; that identity needs the **Storage Account Contributor** RBAC role on the target storage account (this is an Azure RBAC assignment, not a Graph application permission).

Scheduled runs that were saved with the earlier *Email report* option keep sending their email. When such a schedule is opened for editing, the option shows *Output Data only* although the stored email delivery stays active; select the delivery again before saving so that the dialog matches what the schedule does.

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


## Location
Organization → General → Report Intune Enrollment Readiness

**Full Runbook name**

rjgit-org_general_report-intune-enrollment-readiness

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>Az.Accounts (>= 5.5.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementServiceConfig.Read.All
    - *Reads /deviceManagement/deviceEnrollmentConfigurations?$expand=assignments to evaluate enrollment limit and platform restriction configurations against each target user*
  - Group.Read.All
    - *Resolves the scope group and the optional pilot group via /groups?$filter=displayName eq '...' when a group name is supplied*
  - GroupMember.Read.All
    - *Expands /groups/{id}/transitiveMembers/microsoft.graph.user to enumerate members of the scope group and, when pilot-membership checking is enabled, the pilot group*
  - Organization.Read.All
    - *Reads /organization twice: in Connect Part, GET /v1.0/organization?$select=displayName resolves $tenantDisplayName for report file names and the email subject; in Data Collection, GET /v1.0/organization/{tenantId}?$select=id,displayName,mobileDeviceManagementAuthority determines the tenant's MDM authority, with the tenant ID taken from Get-MgContext as a fast path and falling back to GET /v1.0/organization?$select=id*
  - Policy.Read.All
    - *Reads /identity/conditionalAccess/policies to identify enabled Conditional Access policies that could block device enrollment*
  - RoleManagement.Read.Directory
    - *Populates the roleTemplateId of the directoryRole objects returned by /users/{id}/transitiveMemberOf/microsoft.graph.directoryRole, which Conditional Access includeRoles/excludeRoles scoping is matched against. User.Read.All authorizes the call itself but leaves directoryRole properties null, which would silently make every role-scoped policy appear not to apply*
  - User.Read.All
    - *Reads /users/{id} with accountEnabled, assignedLicenses, usageLocation and department for each selected or group-resolved user, /users/{id}/ownedDevices to count registered devices for the readiness check, /users/{id}/transitiveMemberOf/microsoft.graph.directoryRole to resolve each user's directory roles for Conditional Access includeRoles/excludeRoles scoping, and /subscribedSkus to determine which licenses include an Intune service plan*
  - UserAuthenticationMethod.Read.All
    - *Reads /users/{id}/authentication/methods to check each target user has a registered authentication method before enrollment*
  - Mail.Send *(optional — feature: Email report)*
    - *Sends the readiness report email with its CSV/XLSX attachments via Send-RjRbReportEmail when email delivery is selected*

### Permission notes
Azure Storage Account: 'Storage Account Contributor' role for the Automation Account's managed identity on the target storage account - the upload retrieves the account keys via listKeys (only required for the download link options)


## Parameters
### UserName

Each picked user is checked on its own. Leave empty to check only the members of the group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | @() |
| Type | String[] |
| Portal display name | Users to check |

### GroupName

Group whose members are checked, nested groups included. Can be combined with individual users.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Group to check |

### EnrollmentPlatform

Platform of the device the users want to enroll. Conditional Access policies scoped to other platforms are ignored; All platforms checks every platform and reports each one.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Windows |
| Type | String |
| Portal display name | Platform to enroll |

**Portal options**

| Portal option | Value |
| --- | --- |
| Windows | Windows |
| iOS / iPadOS | iOS |
| Android | Android |
| macOS | macOS |
| All platforms | All |

### CheckPilotGroupMembership

Adds a column with the pilot group membership; non-members are reported as Not ready.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Check pilot group membership? |

### PilotGroupDisplayName

Members of this group count as pilot users. The group is looked up by its display name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | col - All Users - Pilot (users) |
| Type | String |
| Portal display name | Pilot group name |

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
| Default Value | report-intune-enrollment-readiness |
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

