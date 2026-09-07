---
title: Report Intune Enrollment Readiness
description: Report Intune enrollment readiness for a set of users
---

## Description
Analyzes whether each user in a selected user set can enroll a device in Microsoft Intune by checking account status, Intune licensing, device enrollment limits, authentication methods, and Conditional Access policies that explicitly target device registration or Intune enrollment; policies requiring compliant devices via "All resources" are exempted per Microsoft Entra design. Platform-scoped policies and browser-only client-app constraints are evaluated against the selected enrollment platform. Results are exported as CSV and/or XLSX with optional email delivery.

## Setup regarding email sending

Sending an email report is optional and only happens when a recipient (`EmailTo`) is provided. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details on all available settings.

### Email branding

The report email honors the optional `RJReport.Branding.*` tenant settings:

- **Header and footer image** – public HTTPS URLs, PNG/JPEG/GIF, max. 200 KB each
- **Footer link** – target of the footer image
- **Accent and text color** – 6-digit hex values, e.g. `#0052cc`

When these settings are not configured, the default RealmJoin graphics and colors are used. An image that cannot be downloaded or validated, or an invalid color value, never prevents the report email – the corresponding default is used instead.

Setup instructions and image requirements: [Email branding](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings#email-branding-optional).


## Location
Organization → General → Report Intune Enrollment Readiness

**Full Runbook name**

rjgit-org_general_report-intune-enrollment-readiness

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Notes
Interpretation notes:
- Checks performed per user: account state, Intune license and service plan, tenant MDM authority,
  device enrollment limit, platform restrictions, registered authentication methods, Conditional
  Access policies, and optionally pilot group membership.
- Conditional Access is evaluated as a static "What If" against the enrollment sign-in for each
  user's EnrollmentPlatform; Entra's own What If tool remains the authority.
- Compliant-device requirements on "All resources" policies do not block enrollment (documented
  Entra exemption); only policies targeting device registration or the Intune enrollment apps are
  treated as strict gates.
- Not evaluated statically: named locations, device filters, sign-in frequency, and terms of use.
- Expired or already-used Temporary Access Passes are not counted as usable methods.

Prerequisites:
- Requires the RJReport.EmailSender setting for email delivery, and at least one of UserName or
  GroupName (memberships resolved transitively).

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
    - *Sends the readiness report email with its CSV/XLSX attachments via Send-RjReportEmail when SendEmailReport is enabled*


## Parameters
### UserName

User principal names of users to check for Intune enrollment readiness. Select one or more users. At least one of UserName or GroupName must be supplied; both may be combined.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | @() |
| Type | String[] |
| Portal display name | Users to check |

### GroupName

Display name of a group whose members to check for Intune enrollment readiness. Group membership is resolved transitively, including nested groups. At least one of UserName or GroupName must be supplied; both may be combined.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Group to check (members) |

### EnrollmentPlatform

Device platform assumed during Conditional Access evaluation. Platform-scoped policies that do not cover this platform are ruled out. When set to 'All', the script evaluates every platform and reports results per platform.

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

If set to true, the report includes a column showing pilot group membership for each user. Users who are not members are marked "Not ready" with the reason "Not a member of the pilot group"; if the group cannot be found or verified, a warning is issued.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Check pilot group membership |

### PilotGroupDisplayName

Display name of the pilot group to check membership against when CheckPilotGroupMembership is enabled. Default is "col - All Users - Pilot (users)". This can be overridden per run or configured via runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | col - All Users - Pilot (users) |
| Type | String |
| Portal display name | Pilot group display name |

### EmailFrom

The sender email address for report delivery. Configured as a tenant setting; leave empty if no email report is requested.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingHeaderImageUrl

URL of a custom header image for report emails. Configured as a tenant setting; leave empty to use the default RealmJoin branding.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterImageUrl

URL of a custom footer image for report emails. Configured as a tenant setting; leave empty to use the default RealmJoin branding.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterLink

Link target applied to the footer image in report emails, for example the company website. Configured as a tenant setting; leave empty to use the default RealmJoin branding.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingAccentColor

Accent color used for headings and highlights in report emails. Configured as a tenant setting; leave empty to use the default RealmJoin branding.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingTextColor

Body text color used in report emails. Configured as a tenant setting; leave empty to use the default RealmJoin branding.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### SendEmailReport

If set to true, the report is sent as an email to the address specified by EmailTo. If false, the report is generated but not emailed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### EmailTo

Recipient email address or multiple comma-separated addresses for the report email. Required when SendEmailReport is set to true. Each recipient receives an individual email for privacy.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ReportFileFormat

File format for the generated report: CSV only, CSV & XLSX (both files), or XLSX only.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | CSV & XLSX |
| Type | String |
| Portal display name | Report file format |

**Portal options**

| Portal option | Value |
| --- | --- |
| CSV & XLSX |  |
| CSV only |  |
| XLSX only |  |



[Back to Runbook Reference overview](../../README.md)

