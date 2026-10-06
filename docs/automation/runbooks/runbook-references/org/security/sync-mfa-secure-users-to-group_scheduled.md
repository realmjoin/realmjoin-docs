---
title: Sync MFA Secure Users To Group (Scheduled)
description: Keep a group filled with users who registered a secure MFA method
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Keeps an Entra ID group in sync with the users who registered at least one secure authentication method, such as a passkey or the Microsoft Authenticator app. Users who lose their secure method are removed. Admins, an exclusion group and individual users can be kept out, for example when the group controls self-service password reset. A dry run only shows the changes, and the report can be sent by email or provided as a download link. Details on the options are in the runbook documentation (docs.realmjoin.com).

## How it works

The runbook reads the Entra ID [authentication methods registration report](https://learn.microsoft.com/en-us/graph/api/authenticationmethodsroot-list-userregistrationdetails) (`userRegistrationDetails`) and mirrors the target group against all **member users** that qualify:

- A user qualifies when at least one of their registered methods is in the configured **secure** set.
- In **strict mode** (`SecureOnly`), a user additionally must not have any method from the **unsecure** set registered — a passkey user who also keeps an SMS factor does not qualify.
- Qualifying users that are not yet group members are added; members that no longer qualify are removed (mirror sync).
- Guest users are never added or removed. Non-user group members (devices, service principals, nested groups) are never touched.

The target group should be managed exclusively by this runbook.

## Secure method groups

Each toggle controls which `methodsRegistered` values count as secure:

| Toggle | Default | Covered values |
| --- | --- | --- |
| Passkeys / FIDO2 security keys | on | `fido2SecurityKey`, `passKeyDeviceBound`, `passKeyDeviceBoundAuthenticator` |
| Platform credentials | on | `windowsHelloForBusiness`, `passKeyDeviceBoundWindowsHello`, `macOsSecureEnclaveKey` |
| Microsoft Authenticator app | on | `microsoftAuthenticatorPush`, `microsoftAuthenticatorPasswordless` |
| Software OTP | off | `softwareOneTimePasscode` |
| Hardware OTP | off | `hardwareOneTimePasscode` |
| Certificate-based authentication | on | `certificateBasedAuthentication` |

## Strict mode (SecureOnly)

With strict mode enabled, users with any of the following built-in unsecure methods never qualify:

`mobilePhone`, `alternateMobilePhone`, `officePhone`, `email`, `securityQuestion`

If a method ends up in both the secure and the unsecure set (only possible via the override parameters), unsecure wins — such users never qualify in strict mode. The runbook warns about this at startup.

## Exclusions

Excluded users never qualify regardless of their registered methods: they are never added to the target group and are removed if they are already members. The per-user report shows the reason in the `ExclusionReason` column.

### Exclude admin users (`ExcludeAdmins`, on by default)

Users holding an Entra ID directory role are excluded. This covers:

- **Active role assignments** (`roleManagement/directory/roleAssignments`)
- **PIM-eligible assignments** (`roleManagement/directory/roleEligibilitySchedules`, requires Entra ID P2 — without P2 the runbook falls back to active assignments and logs a warning)
- **Role-assignable groups**: groups holding a role are expanded to their transitive user members

Background: when the target group drives **SSPR** and the SSPR administrator policy is disabled, admins in the group would still be forced to register a second factor once two SSPR methods are required. Keeping admins out of the group avoids this.

This option requires the additional Graph permission `RoleManagement.Read.Directory` for the managed identity.

### Exclusion group (`ExcludeGroupId`, optional)

Transitive user members of the configured group are excluded — intended for accounts that must never be managed by this sync, such as **break glass accounts** or **service accounts**. Nested groups are honored. The exclusion group must not be the target group itself.

### Individually excluded users (`ExcludeUserIds`, optional)

Individual users can be excluded directly via the multi-user picker — for one-off exclusions where a dedicated exclusion group is not worth maintaining. The list accepts user **object IDs** and **user principal names** (UPNs). Unresolvable entries (e.g. a deleted account) log a warning and are ignored, so a stale entry never breaks a scheduled sync.

### Maintaining exclusions via Runbook Customization (without the pickers)

Both exclusion parameters can be pre-set centrally via [JSON-based Runbook Customization](https://docs.realmjoin.com/automation/runbooks/runbook-customization#json-based-customizing) (RealmJoin portal: **Settings** → **Runbook Customizations**) — useful when the exclusions are fixed for the tenant and should not be picked manually each time the runbook is started or scheduled:

```json
{
    "Runbooks": {
        "rjgit-org_security_sync-mfa-secure-users-to-group_scheduled": {
            "Parameters": {
                "ExcludeGroupId": {
                    "DefaultValue": "00000000-0000-0000-0000-000000000000",
                    "Hide": true
                },
                "ExcludeUserIds": {
                    "DefaultValue": [
                        "11111111-1111-1111-1111-111111111111",
                        "breakglass@contoso.com"
                    ],
                    "Hide": true
                }
            }
        }
    }
}
```

- **ExcludeGroupId** takes a single group **object ID** (GUID) as a plain string — copy it from the group's overview page in the Entra admin center or the RealmJoin portal.
- **ExcludeUserIds** takes a JSON **array of strings**; each entry can be a user **object ID** or a **UPN**. Entries are trimmed and deduplicated; the runbook resolves them at startup.
- **Recommended:** when the exclusions are maintained via Runbook Customization, also set `"Hide": true` on the parameter (as in the example above). This removes it from the start form entirely, so the centrally configured exclusions cannot be overridden in the UI when starting or scheduling the runbook. Without `Hide`, the configured values only appear pre-filled and can still be changed there.

## Method classification reference

Use the exact Graph values from this table when building the comma-separated override strings:

| `methodsRegistered` value | Friendly name | Classification | Covered by toggle (default) |
| --- | --- | --- | --- |
| `fido2SecurityKey` | FIDO2 security key | Secure | Passkeys / FIDO2 (on) |
| `passKeyDeviceBound` | Passkey (device-bound) | Secure | Passkeys / FIDO2 (on) |
| `passKeyDeviceBoundAuthenticator` | Passkey in Microsoft Authenticator | Secure | Passkeys / FIDO2 (on) |
| `windowsHelloForBusiness` | Windows Hello for Business | Secure | Platform credentials (on) |
| `passKeyDeviceBoundWindowsHello` | Passkey in Windows Hello | Secure | Platform credentials (on) |
| `macOsSecureEnclaveKey` | Platform Credential for macOS | Secure | Platform credentials (on) |
| `microsoftAuthenticatorPush` | Microsoft Authenticator (push notification) | Secure | Microsoft Authenticator app (on) |
| `microsoftAuthenticatorPasswordless` | Microsoft Authenticator (passwordless phone sign-in) | Secure | Microsoft Authenticator app (on) |
| `softwareOneTimePasscode` | Software OATH token (TOTP app) | Secure | Software OTP (off) |
| `hardwareOneTimePasscode` | Hardware OATH token | Secure | Hardware OTP (off) |
| `certificateBasedAuthentication` | Certificate-based authentication | Secure | Certificate-based authentication (on) |
| `mobilePhone` | Phone (SMS / voice call) | Unsecure | built-in unsecure list |
| `alternateMobilePhone` | Alternate phone (voice call) | Unsecure | built-in unsecure list |
| `officePhone` | Office phone (voice call) | Unsecure | built-in unsecure list |
| `email` | Email (SSPR only) | Unsecure | built-in unsecure list |
| `securityQuestion` | Security questions (SSPR only) | Unsecure | built-in unsecure list |
| `temporaryAccessPass` | Temporary Access Pass | Neutral | never qualifies, never disqualifies |

Unknown or future Graph values are treated as neutral unless explicitly listed in an override parameter.

## Override parameters

Both override parameters are hidden by default and intended for RealmJoin runbook customization:

- **SecureMethodsOverride** — comma-separated list of `methodsRegistered` values that defines the secure set. When set, **all** method group toggles are ignored. Example: `fido2SecurityKey,passKeyDeviceBound,passKeyDeviceBoundAuthenticator,windowsHelloForBusiness`
- **UnsecureMethodsOverride** — comma-separated list that replaces the built-in unsecure list. Only evaluated in strict mode. Example: `mobilePhone,alternateMobilePhone,officePhone,email,securityQuestion,softwareOneTimePasscode`

Unknown values produce a warning but are still evaluated, so future Graph values can be used before this documentation catches up.

## Email report and download links

Optionally, a detailed report can be delivered - especially useful for reviewing the very first run (ideally combined with the dry run mode):

- **Send report via email** (`SendEmail`, off by default): sends the report to the configured recipient(s). The recipient field only appears when email is enabled. Requires the `RJReport.EmailSender` tenant setting (see the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings)).
- **Create file download links** (`CreateDownloadLink`, off by default): uploads the report files to an Azure Storage Account and returns time-limited download links (uses the `RJReport.StorageAccount.*` tenant settings).

Report files are only generated when at least one of the two options is enabled. The report consists of:

- **mfa-secure-users-group-sync-changes.csv** - all performed (or, in dry run, pending) changes with per-user method details
- **mfa-secure-users-group-sync-all-users.csv** - the evaluation of every member user: registered methods, secure/unsecure classification, qualification, exclusion reason and group membership
- **mfa-secure-users-group-sync-report.xlsx** - the same data as a formatted Excel workbook: an "Info" cover sheet with the chosen parameters and result counts, a "Changes" worksheet (added users highlighted in green, removed in red) and an "All Users" worksheet

In large tenants the raw CSV files can exceed the email attachment size limit (Graph rejects mails at roughly 4 MB total). When the CSV files exceed a 2.5 MB budget, the email is sent with only the Excel workbook attached (which contains the complete data in compressed form) and a note explaining the omission; a failed full-size send is also retried automatically with the workbook only. The download link upload always includes all files regardless of size.

### Email branding

The report email honors the optional `RJReport.Branding.*` tenant settings:

- **Header and footer image** – public HTTPS URLs, PNG/JPEG/GIF, max. 200 KB each
- **Footer link** – target of the footer image
- **Accent and text color** – 6-digit hex values, e.g. `#0052cc`

When these settings are not configured, the default RealmJoin graphics and colors are used. An image that cannot be downloaded or validated, or an invalid color value, never prevents the report email – the corresponding default is used instead.

Setup instructions and image requirements: [Email branding](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings#email-branding-optional).

## Notes and limitations

- The registration report requires an **Entra ID P1 or P2** license.
- PIM-eligible role assignments (admin exclusion) require an **Entra ID P2** license — without it, only active role assignments are excluded.
- The report does not include **disabled** or soft-deleted users — such accounts are removed from the group on the next run.
- Report data can lag behind recent registration changes; a newly registered method may take one sync cycle to be reflected.
- The runbook processes large tenants (20k+ users) via paged report reads and batched group writes with automatic throttling retries.

## Scheduling

The sync is idempotent — a single recurring schedule (e.g. daily) keeps the group up to date, and reruns after partial failures self-heal. Recommendation: run once with **Dry run (WhatIf)** enabled and review the job output before scheduling the runbook in live mode.


## Location
Organization → Security → Sync MFA Secure Users To Group (Scheduled)

**Full Runbook name**

rjgit-org_security_sync-MFA-secure-users-to-group_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.5.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>Az.Accounts (>= 5.5.2) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - AuditLog.Read.All
    - *Reads userRegistrationDetails to evaluate each user's registered MFA methods*
  - Group.Read.All
    - *Reads the target and exclusion groups and their transitive user members*
  - RoleManagement.Read.Directory
    - *Reads role assignments and eligibility schedules to exclude admin users when ExcludeAdmins is enabled*
  - GroupMember.ReadWrite.All
    - *Adds and removes users in the target group via batched /groups/{id}/members/$ref calls*
  - User.Read.All
    - *Resolves admin-role principals and ExcludeUserIds entries to user objects*
  - Organization.Read.All
    - *Reads /organization for the tenant name on the report cover sheet and in the email*
  - Mail.Send *(optional — feature: Email report)*
    - *Sends the report email via Send-RjReportEmail when email reporting is enabled*


## Parameters
### TargetGroupId

Group whose members are managed by this runbook. Members that no longer qualify are removed.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Target group |

### IncludePasskeys

Passkeys and FIDO2 security keys, which are phishing-resistant, count as secure.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Passkeys and FIDO2 keys count as secure? |

### IncludePlatformCredentials

Windows Hello for Business and macOS platform credentials count as secure.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Platform credentials count as secure? |

### IncludeMicrosoftAuthenticator

The Microsoft Authenticator app, with push or passwordless sign-in, counts as secure.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Microsoft Authenticator counts as secure? |

### IncludeSoftwareOtp

Time-based one-time codes from authenticator apps count as secure.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Software OTP counts as secure? |

### IncludeHardwareOtp

Hardware one-time password tokens count as secure.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Hardware OTP tokens count as secure? |

### IncludeCertificateBasedAuth

Sign-in with a certificate, for example from a smart card, counts as secure.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Certificate-based auth counts as secure? |

### SecureOnly

Strict mode: users who also have a phone, email or security question method registered never qualify, even with a secure method.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Strict mode? |

### SecureMethodsOverride

Custom list of method names that count as secure, separated by commas. When set, the individual method switches are ignored. Preset in the runbook customization; the method names are listed in the runbook documentation.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Custom secure methods |
| Hidden in portal | yes (preset via runbook customization) |

### UnsecureMethodsOverride

Custom list of method names that count as unsecure in strict mode, separated by commas. Preset in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Custom unsecure methods |
| Hidden in portal | yes (preset via runbook customization) |

### ExcludeAdmins

Users with an Entra ID directory role, active or eligible, never qualify and are removed from the group. Useful when the group drives self-service password reset.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Exclude admins? |

### ExcludeGroupId

Members of this group, for example break glass or service accounts, never qualify and are removed from the target group. Leave empty for none.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Exclusion group |

### ExcludeUserIds

Users who never qualify and are removed from the target group. Several can be picked.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | @() |
| Type | String[] |
| Portal display name | Excluded users |

### WhatIfMode

Only logs which users would be added or removed without changing the group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Dry run? |

### SendEmail

Send the report by email after the run.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Send report by email? |

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
| Default Value | sync-mfa-secure-users-to-group |
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

