---
layout:
  width: wide
---

# Runbook Release Notes

Stay up to date with the latest changes to the RealmJoin Runbooks. Runbook updates are typically published here in monthly release cycles.

## v2026.07

> This release strengthens device security and Defender for Endpoint integration, automates Autopilot cleanup, and adds Exchange Online contact management — backed by module updates and improved notification emails.
 
---
 
### Changes
 

<table data-full-width="true"><thead><tr><th width="64">Type</th><th width="82">Domain</th><th width="127">Subcategory</th><th width="176">Runbook</th><th>Details</th></tr></thead><tbody><tr><td>➕</td><td>device</td><td>security</td><td>Check Defender Status</td><td>Compares a device between Entra ID and Microsoft Defender for Endpoint using its Entra device ID.<br>Reports whether the device is present in both systems, its onboarding and health state, and its Defender risk score.</td></tr><tr><td>➕</td><td>org</td><td>devices</td><td>Cleanup Autopilot Devices (Scheduled)</td><td>Identifies and removes orphaned or never-enrolled Autopilot devices based on configurable criteria, with optional email reporting of the results.<br>Can optionally also delete the matching Entra ID device objects to keep the directory clean.<br>Supports filtering by <code>Manufacturer</code> and <code>Model</code> to target specific device types.<br>Designed to run on a schedule for ongoing inventory maintenance.</td></tr><tr><td>➕</td><td>org</td><td>mail</td><td>Add Exchange Online Mail Contact</td><td>Creates an Exchange Online external mail contact, validating the email address format and checking for duplicate contacts, aliases, and display names before creation.<br>Optionally sets first name, last name, and alias, and can hide the contact from the Global Address List.</td></tr><tr><td>✏️</td><td>device</td><td>general</td><td>Wipe Device</td><td>Adds an optional <code>skipWipeIfAtRisk</code> setting (off by default): when enabled, the wipe only runs if the device's Microsoft Defender for Endpoint risk score is not Medium or High.<br>This protects forensic data (e.g. logs) on devices potentially involved in a security incident from being destroyed.<br>Requires the new Defender for Endpoint permission <code>Machine.Read.All</code>.</td></tr><tr><td>✏️</td><td>org</td><td>devices</td><td>Report Primary User Mismatch (Scheduled)</td><td>Can now optionally include devices whose Intune primary user has been deleted from Entra ID in the report (off by default).</td></tr><tr><td>✏️</td><td>user</td><td>userinfo</td><td>Add User</td><td>Now supports setting the new user's sponsor during creation.</td></tr></tbody></table>

 
---
 
### General Changes
 
- Updated the `RealmJoin.RunbookHelper` module to **>= 0.8.7** across all runbooks. This version adds new functions for password/key vault handling and further improves the email-sending function, including better Outlook Classic compatibility. Each affected runbook's internal `$Version` was incremented by one patch level.
- Updated the `Microsoft.Graph.Authentication` module to **>= 2.38.0** across all affected runbooks.
- Improved notification emails across all email-sending runbooks: a localized "do not reply" footer was added, plus two optional, hidden-by-default parameters for runbooks that include Service Desk contact information — `ServiceDeskPortalUrl` (sourced from the RJReport tenant setting `RJReport.ServiceDesk_PortalUrl`) and `ServiceDeskTicketUrl` (a direct link to the related ticket). When set, each is rendered as a clickable link. Affected runbooks: **Reset MFA**, **List MFA Methods**, **Set or Remove Mobile Phone MFA**, **Create Temporary Access Pass** (User/Security) and **Notify Users About Stale Devices (Scheduled)** (Org/Devices).

## Previous releases

<details>
<summary><strong>v2026.06.01</strong></summary>

> This patch centers on the reworked `RealmJoin.RunbookHelper` email engine — extensive improvements to report mailing (image embedding and Outlook Classic compatibility) rolled out across all runbooks — plus a fix for out-of-memory failures on large Intune tenants.
 
### Changes
 

<table data-full-width="true"><thead><tr><th width="62">Type</th><th width="82">Domain</th><th width="127">Subcategory</th><th width="140">Runbook</th><th>Details</th></tr></thead><tbody><tr><td>➕</td><td>org</td><td>devices</td><td>Report Windows Devices Without Autopilot</td><td>Lists all Windows Entra device objects that have no associated Windows Autopilot object, so you can spot devices missing from Autopilot enrollment.<br>Matching is done via the Autopilot object's Azure AD device ID (<code>azureActiveDirectoryDeviceId</code>).</td></tr><tr><td>➕</td><td>org</td><td>devices</td><td>Report Primary User Mismatch (Scheduled)</td><td>Compares the primary user recorded in Intune against the primary user recorded in the RealmJoin customer API for Windows managed devices, flags every device where the two differ, and emails the differences with a CSV attachment on a scheduled basis.</td></tr><tr><td>➕</td><td>org</td><td>general</td><td>Sync Shared Channel Owners (Scheduled)</td><td>Keeps the members of a mapped security group as owners of selected Teams and of every shared channel those teams host (shared channels do not inherit ownership from their parent team).<br>Teams are matched by exact display name; the team-name-to-owner-group mapping is maintained centrally via the <code>SharedChannelOwners.Mapping</code> org setting.<br>Add-only — existing owners and members are never removed — with a <code>WhatIfMode</code> dry run.<br>Optional email report and/or storage download link, each with per-team and per-change CSV output (both off by default).</td></tr><tr><td>✏️</td><td>device</td><td>general</td><td>Outphase Device</td><td>Can now optionally exclude a device from Microsoft Defender for Endpoint remediation by applying a configurable exclusion tag (default <code>ExcludeFromRemediation</code>); opt-in and off by default.<br>Requires the new Defender for Endpoint permissions <code>Machine.Read.All</code> and <code>Machine.ReadWrite.All</code>.</td></tr><tr><td>✏️</td><td>org</td><td>devices</td><td>Outphase Devices</td><td>Adds the same optional Microsoft Defender for Endpoint exclusion tagging as the single-device runbook, applied to every device in the list (opt-in, off by default).<br>Requires the new Defender for Endpoint permissions <code>Machine.Read.All</code> and <code>Machine.ReadWrite.All</code>.</td></tr><tr><td>✏️</td><td>org</td><td>general</td><td>Check Device Onboarding Exclusion (Scheduled)</td><td>Fixes out-of-memory failures on tenants with large Intune inventories — managed devices are now filtered server-side instead of loading the full inventory into memory.<br>Migrated to native Microsoft Graph for better reliability.</td></tr></tbody></table>

 
### General Changes
 
- Updated the `RealmJoin.RunbookHelper` module to **>= 0.8.6** across every runbook that uses it. This version ships an extensive rework of the email-sending function around image embedding and Outlook Classic compatibility. As part of this change, the inline `Publish-RjRbFilesToStorageContainer` helper function was removed from two runbooks (now provided by the module): **Export Enterprise Application Users** (Org/Applications) and **Office 365 License Report** (Org/General).
- Updated the `Microsoft.Graph.Authentication` module to **>= 2.37.0** across all runbooks that use it.

</details>

<details>
<summary><strong>v2026.06</strong></summary>

> This release focuses on user security and MFA management, introducing a new runbook for listing authentication methods and adding optional user notification emails across multiple MFA-related runbooks. Additional improvements cover archive mailbox management, guest user invitations, and several reliability fixes.
 
---
 
### Changes
 

<table data-full-width="true"><thead><tr><th width="62">Type</th><th width="82">Domain</th><th width="127">Subcategory</th><th width="140">Runbook</th><th>Details</th></tr></thead><tbody><tr><td>➕</td><td>user</td><td>mail</td><td>Manage Archive Mailbox</td><td>Enables, disables, or retrieves the current status of the in-place archive mailbox for an Exchange Online user.<br>When enabling, automatically reconnects a soft-deleted archive mailbox (within the 30-day recovery window) instead of creating a new one.<br>The disable action includes a note confirming that the archive can be recovered within 30 days.</td></tr><tr><td>➕</td><td>user</td><td>security</td><td>List MFA Methods</td><td>Lists all Microsoft Entra ID MFA and authentication methods registered for a target user.<br>Phone numbers can optionally be masked to show only the last 4 digits (default off, setting hidden).<br>Optionally sends a notification email to the user when an administrator retrieves their MFA methods (default off, setting hidden).<br>The notification email language is auto-detected via usage location, with an override parameter to force German or English.</td></tr><tr><td>✏️</td><td>org</td><td>general</td><td>Invite External Guest Users</td><td>Added a sponsor assignment parameter.<br>Manager and sponsor are now shown by UPN instead of object ID in the summary, improving readability.<br>Added support for a customized email invitation message and a configurable invite redirection URL.</td></tr><tr><td>✏️</td><td>org</td><td>general</td><td>Report Apple MDM Cert Expiry (Scheduled)</td><td>Fixed an issue where VPP tokens were silently dropped from the report due to a faulty paged-result check.<br>Applied the same fix to DEP onboarding settings, which used the same faulty check.<br>The email report is now only sent when at least one alert is detected, avoiding unnecessary notifications when everything is in order.</td></tr><tr><td>✏️</td><td>org</td><td>mail</td><td>Add Shared Mailbox</td><td>Added a time zone selection parameter with predefined options and a default value, allowing the shared mailbox time zone to be configured directly during creation.</td></tr><tr><td>✏️</td><td>user</td><td>security</td><td>Reset MFA</td><td>Added an optional <code>NotifyUser</code> parameter that sends a notification email to the target user when an administrator resets their MFA methods (default off, setting hidden).<br>Email configuration (sender address, service desk display name, email, and phone number) is sourced from RJ tenant settings and hidden by default.<br>Email language is auto-detected via usage location, with a <code>LanguageOverride</code> parameter to force German or English.<br>Added a StatusQuo section that resolves the user's display name, primary email, and usage location before execution.</td></tr><tr><td>✏️</td><td>user</td><td>security</td><td>Set Or Remove Mobile Phone MFA</td><td>Added an optional <code>NotifyUser</code> parameter that sends a notification email to the target user when an administrator adds or removes their mobile phone MFA method (default off, setting hidden).<br>Email configuration (sender address, service desk display name, email, and phone number) is sourced from RJ tenant settings and hidden by default.<br>Email language is auto-detected via usage location, with a <code>LanguageOverride</code> parameter to force German or English.<br>The notification email text distinguishes between add and remove actions.</td></tr><tr><td>✏️</td><td>user</td><td>userinfo</td><td>Update User</td><td>Added support for updating the user's manager directly from within the runbook.</td></tr></tbody></table>

 
---
 
### General Changes
 
**PSScriptAnalyzer improvements across 6 runbooks** — Internal code quality fixes with no functional impact for end users. Includes removal of unused parameters, replacement of empty try/catch blocks, and suppression of false positive warnings. Affected runbooks:
 
- `org/applications` — Export Enterprise Application Users
- `org/devices` — Create Endpoint Analytics Baseline (Scheduled)
- `org/general` — Assign Groups By Template (Scheduled), Export Policy Report, Office 365 License Report
- `org/security` — List Admin Users

</details>

<details>
<summary><strong>v2026.05</strong></summary>

> This release introduces automated duplicate device name resolution for Intune environments, alongside targeted improvements to license reporting, guest user invitations, and policy export reliability.
 
---
 
### Changes
 

<table data-full-width="true"><thead><tr><th width="62">Type</th><th width="82">Domain</th><th width="136">Subcategory</th><th width="140">Runbook</th><th>Details</th></tr></thead><tbody><tr><td>➕</td><td>org</td><td>devices</td><td>Dedup Device Names (Scheduled)</td><td>Automatically detects and resolves duplicate device names in Intune on a scheduled basis.<br>The most recently enrolled duplicate is renamed using a configurable prefix and a random digit suffix; resolved names are synced back to Autopilot.<br>Supports an OS filter parameter (All / Windows / macOS / Other) and skips personal-owned devices and unsupported platforms with warnings.<br>Checks for pending rename actions before queuing to avoid issuing duplicate MDM commands.</td></tr><tr><td>✏️</td><td>org</td><td>applications</td><td>Export Enterprise Application Users</td><td>Updated the internal export function to the enhanced version introduced in the <code>Office 365 License Report</code> runbook, aligning export behaviour and capabilities across both runbooks.</td></tr><tr><td>✏️</td><td>device</td><td>general</td><td>Enroll Updatable Assets</td><td>Added an <code>All</code> option to the <code>UpdateCategory</code> parameter, which sequentially enrolls devices into Driver, Feature, and Quality updates in a single run — removing the need to execute the runbook separately for each update category.<br>Script restructured with proper regions and parameter logging for improved maintainability.</td></tr><tr><td>✏️</td><td>org</td><td>general</td><td>Export Policy Report</td><td>Improved pagination handling by replacing static <code>$top=1000</code> Graph API calls with <code>Get-GraphPagedResult</code> to ensure complete results in large tenants.<br>Added logging of the retrieved policy count per policy type for better transparency during execution.</td></tr><tr><td>✏️</td><td>org</td><td>general</td><td>Invite External Guest Users</td><td>Added new parameters: Given Name, Surname, Manager, Usage Location, and Company.<br>Display name is now automatically generated from the given name and surname if no explicit display name is provided, reducing manual input for standard guest invitations.</td></tr><tr><td>✏️</td><td>org</td><td>general</td><td>Office 365 License Report</td><td>Added an <code>includeUserData</code> parameter that optionally includes real user UPNs in Graph activity reports by temporarily disabling the Microsoft 365 report privacy setting during execution.<br>Note: the additional <code>ReportSettings.ReadWrite.All</code> permission is only required when <code>includeUserData</code> is enabled — tenants using this feature should update their permission assignments accordingly.<br>Script fully restructured with proper regions, parameter logging, and enhanced error handling.</td></tr></tbody></table>


</details>

<details>
<summary><strong>v2026.04.01</strong></summary>

> Patch release with three new runbooks for device and endpoint management, significant improvements to phone MFA handling for guest users, targeted bug fixes in the security domain, and a broad internal code quality pass across 25 runbooks.
 
---
 
### Changes
 

<table data-full-width="true"><thead><tr><th width="62">Type</th><th width="82">Domain</th><th width="127">Subcategory</th><th width="140">Runbook</th><th>Details</th></tr></thead><tbody><tr><td>➕</td><td>device</td><td>security</td><td>Show FileVault Recovery Key</td><td>Retrieves and displays the FileVault recovery key for a specified Mac device directly from Intune.<br>Provides a quick lookup for administrators without requiring manual navigation through the Intune portal.</td></tr><tr><td>➕</td><td>device</td><td>general</td><td>Assign Groups By Template</td><td>Adds a device to one or more Entra ID groups using either group object IDs or display names.<br>Enables structured, template-based group assignments for devices without requiring manual portal interaction.</td></tr><tr><td>➕</td><td>org</td><td>devices</td><td>Create Endpoint Analytics Baseline (Scheduled)</td><td>Creates a new Endpoint Analytics Baseline in Microsoft Intune on a scheduled basis.<br>The naming schema is configurable via runbook parameters, e.g. to include a timestamp for better tracking of baseline versions over time.</td></tr><tr><td>✏️</td><td>org</td><td>security</td><td>Find SMS Auth Phone Number</td><td>Added dynamic progress reporting based on total user count, making batch processing output more informative in large tenants.<br>Updated the "not found" message to indicate that soft-deleted user accounts may still hold a phone number reservation — helping administrators investigate cases where no active user is identified.</td></tr><tr><td>✏️</td><td>org</td><td>security</td><td>Add Defender Indicator</td><td>Fixed a logic issue in alert handling that could cause incorrect behavior when processing indicator responses.<br>Fixed the severity parameter not being passed correctly to the Microsoft Defender API.<br>Optimized runbook output to provide clearer information about the created indicator and its current status.</td></tr><tr><td>✏️</td><td>org</td><td>security</td><td>Notify Changed CA Policies</td><td>Optimized runbook output for improved readability and clarity of reported policy changes.</td></tr><tr><td>✏️</td><td>user</td><td>security</td><td>Set Or Remove Mobile Phone MFA</td><td>Switched from UPN-based to Object ID-based user identification, fixing 404 errors that occurred for guest users.<br>The runbook now displays the user's UPN, display name, and guest status after connecting, as well as the current phone number and SMS Sign-In state before any changes are made.<br>Restructured error handling for Graph API 409 Conflict ("phoneNumberNotUnique") errors: the runbook now suppresses the error, waits, verifies the actual MFA assignment state, and reports success with a conflict note if MFA was successfully assigned despite the SMS Sign-In conflict.<br>Added an embedded <code>Find-PhoneNumberOwner</code> function that searches for the user holding a phone number when MFA assignment truly fails, enabling administrators to identify and resolve conflicts directly.</td></tr><tr><td>✏️</td><td>user</td><td>general</td><td>Resize Windows 365</td><td>Fixed an issue where the <code>fromMailAddress</code> parameter was not being passed to the API, which could result in notification emails being sent without a valid sender address.</td></tr></tbody></table>

 
---
 
### General Changes
 
**Code quality improvements across 25 runbooks** — Internal PSScriptAnalyzer fixes to improve code consistency and static analysis compliance. These changes have no functional impact for end users. Improvements include suppression of false positive warnings, renaming of internal functions to use approved PowerShell verbs, and singular naming corrections. Affected runbooks:
 
- `device/security` — Show LAPS Password
- `device/general` — Enroll Updatable Assets, Unenroll Updatable Assets
- `group/devices` — Unenroll Updatable Assets (Scheduled)
- `org/applications` — Add Application Registration, Report Expiring Application Credentials (Scheduled), Update Application Registration
- `org/devices` — Outphase Devices
- `org/general` — Add Devices Of Users To Group (Scheduled), Add Primary Users Of Devices To Group (Scheduled), Add Security Group, Add Viva Engage Community, Assign Groups By Template (Scheduled), Check Assignments Of Devices, Check Assignments Of Users, Export CloudPC Usage (Scheduled), Export Policy Report, Office365 License Report
- `org/phone` — Get Teams Phone Number Assignment
- `org/security` — Backup Conditional Access Policies
- `user/general` — Assign Groups By Template
- `user/phone` — Disable Teams Phone, Get Teams User Info, Set Teams Permanent Call Forwarding
- `user/userinfo` — Update User
 
**Minor fixes** — Removed an unused parameter from an internal function in `Add Security Group` (org/general); simplified the internal `Save-ToDataTable` function in `Export CloudPC Usage (Scheduled)` (org/general); fixed a typo in `Office 365 License Report` (org/general).

</details>

<details>
<summary><strong>v2026.04</strong></summary>

> This release expands automation coverage with new runbooks for device management, compliance checking, and security, alongside reliability improvements across a broad set of existing runbooks.
 
---
 
### Changes
 

<table data-full-width="true"><thead><tr><th width="62">Type</th><th width="82">Domain</th><th width="136">Subcategory</th><th width="140">Runbook</th><th>Details</th></tr></thead><tbody><tr><td>➕</td><td>device</td><td>general</td><td>Set Primary User</td><td>Sets or changes the primary user of a device in Intune.<br>Ensures accurate device ownership for reporting and device management purposes.</td></tr><tr><td>➕</td><td>group</td><td>general</td><td>Add Primary Users Of Devices To Group (Scheduled)</td><td>Automatically adds the primary users of devices to a designated group on a scheduled basis.<br>Devices can be filtered by platform and last activity date to target only relevant devices.</td></tr><tr><td>➕</td><td>org</td><td>devices</td><td>Auto Approve Driver Updates (Scheduled)</td><td>Automatically approves pending driver updates in Intune based on configurable criteria such as device category and driver update class.<br>Reduces manual effort for routine driver update approvals in managed environments.</td></tr><tr><td>➕</td><td>org</td><td>devices</td><td>Check Device Compliance</td><td>Checks the compliance status of devices in Intune and identifies the specific reason for any non-compliant status.<br>Useful for targeted troubleshooting and compliance reporting without requiring manual inspection in the Intune portal.</td></tr><tr><td>➕</td><td>org</td><td>general</td><td>Sync Apple Tokens</td><td>Synchronizes Apple MDM push notification tokens between Intune and the Apple Push Notification Service (APNS).<br>Ensures that managed Apple devices continue to receive timely updates and push notifications.</td></tr><tr><td>➕</td><td>org</td><td>security</td><td>Find SMS Auth Phone Number</td><td>Searches for which user has a specific phone number registered as an SMS Sign-In or phone MFA method in Microsoft Entra ID.<br>Designed to help administrators resolve "phoneNumberNotUnique" errors by identifying the conflicting account.</td></tr><tr><td>✏️</td><td>org</td><td>applications</td><td>Export Enterprise Application Users</td><td>Added a generalized export function for Azure Storage Account.<br>Simplifies configuration when exporting user data to storage and aligns the export logic with other runbooks in this category.</td></tr><tr><td>✏️</td><td>org</td><td>applications</td><td>Update Application Registration</td><td>The updated list of redirect URIs is now included in the runbook output after changes are applied.<br>Provides immediate visibility into the current state of the registration without requiring a separate lookup.</td></tr><tr><td>✏️</td><td>user</td><td>security</td><td>Create Temporary Access Pass</td><td>Added parameter validation to ensure the pass duration falls within acceptable limits before execution.<br>Added optional email notification when a Temporary Access Pass is created, configurable via Runbook Customization parameters.<br>The notification language is automatically selected based on the user's usage location — German for users located in Germany, English otherwise.</td></tr><tr><td>✏️</td><td>user</td><td>security</td><td>Set Or Remove Mobile Phone MFA</td><td>Added detection and reporting for "phoneNumberNotUnique" errors, which occur when the target phone number is already registered for SMS Sign-In by another user.<br>Migrated all API calls to native Microsoft Graph API.<br>Pagination reliability improved as part of the broader Get-GraphPagedResult update (see General Changes).</td></tr></tbody></table>

 
---
 
### General Changes
 
**Pagination fix across 14 runbooks** — Replaced the previous custom pagination function with the simplified `Get-GraphPagedResult` function to improve reliability and consistency when handling large data sets. Without this fix, some runbooks could return incomplete results in large tenants. Affected runbooks:
 
- `org/applications` — Report Application Registration, Report Expiring Application Credentials (Scheduled)
- `org/devices` — Notify Users About Stale Devices (Scheduled), Report Devices Without Primary User, Report Stale Devices (Scheduled), Report Users With More Than 5 Devices
- `org/general` — Add Primary Users Of Devices To Group (Scheduled), Report Apple MDM Cert Expiry (Scheduled), Report License Assignment (Scheduled)
- `org/security` — Find SMS Auth Phone Number, List Admin Users, Monitor Pending EPM Requests (Scheduled), Report EPM Elevation Requests (Scheduled)
- `user/security` — Set Or Remove Mobile Phone MFA

</details>

<details>
<summary><strong>v2026.03</strong></summary>

> This release introduces two new Endpoint Privilege Management runbooks for org/security, expands stale device management with proactive user notifications, and brings significant usability improvements across reporting and assignment runbooks. A complete documentation overhaul across all runbooks improves clarity and onboarding for new administrators.
 
---
 
### Changes
 

<table data-full-width="true"><thead><tr><th width="62">Type</th><th width="82">Domain</th><th width="127">Subcategory</th><th width="140">Runbook</th><th>Details</th></tr></thead><tbody><tr><td>➕</td><td>device</td><td>security</td><td>Show Bitlocker Recovery Key</td><td>Retrieves and displays the BitLocker recovery key for a specified device directly from Intune.<br>Provides a quick way to look up recovery keys without navigating through the Intune portal manually.</td></tr><tr><td>➕</td><td>org</td><td>devices</td><td>Notify Users About Stale Devices (Scheduled)</td><td>Sends email notifications to users whose devices have been inactive beyond a configurable threshold, based on last activity date and platform.<br>Supports English, German, and fully customizable mail templates.<br>Complements the existing <code>Report Stale Devices (Scheduled)</code> runbook by proactively notifying users rather than just generating reports for administrators.</td></tr><tr><td>➕</td><td>org</td><td>security</td><td>Monitor Pending EPM Requests (Scheduled)</td><td>Monitors pending Endpoint Privilege Management (EPM) elevation requests that require admin review.<br>Sends email notifications only when pending requests are present, avoiding unnecessary noise.<br>Includes an optional detailed CSV export for audit purposes.</td></tr><tr><td>➕</td><td>org</td><td>security</td><td>Report EPM Elevation Requests (Scheduled)</td><td>Generates reports on EPM elevation requests with flexible filtering by status (Pending, Approved, Denied, Expired, Revoked, Completed) and configurable time range.<br>Designed to support regular EPM audit workflows and compliance reporting.</td></tr><tr><td>✏️</td><td>group</td><td>general</td><td>Unenroll Updatable Assets (Scheduled)</td><td>Renamed from <code>Unenroll Updatable Assets</code> to reflect the scheduled execution model.<br>Added an option to include user-owned devices in the unenrollment process, enabling more comprehensive management of updatable assets beyond corporate-owned devices.</td></tr><tr><td>✏️</td><td>org</td><td>devices</td><td>Export All Intune Devices</td><td>Fixed an issue where devices with missing or incomplete primary user data caused export errors.<br>Added group-based filtering with a group picker, allowing exports to be scoped to members of a specific group — particularly useful in large tenants where exporting all devices is not practical.</td></tr><tr><td>✏️</td><td>org</td><td>devices</td><td>Report Stale Devices (Scheduled)</td><td>Added Include/Exclude User Groups filtering, allowing administrators to focus the report on devices belonging to specific user groups or explicitly exclude certain groups from the results.</td></tr><tr><td>✏️</td><td>org</td><td>general</td><td>Check Assignments Of Groups</td><td>Added a multi-group picker, enabling administrators to process multiple groups in a single run instead of executing the runbook separately for each group.</td></tr><tr><td>✏️</td><td>org</td><td>general</td><td>Check Assignments Of Users</td><td>Added a multi-user picker, enabling administrators to process multiple users in a single run.<br>Added required permissions for app assignment checks to the runbook documentation.</td></tr><tr><td>✏️</td><td>org</td><td>security</td><td>List Admin Users</td><td>The runbook output and CSV export now include PIM role assignment status (permanent vs. eligible) and the expiration date for eligible assignments.<br>Provides a more complete picture of privileged access without requiring a separate PIM report.</td></tr><tr><td>✏️</td><td>user</td><td>mail</td><td>Assign OWA Mailbox Policy</td><td>Added three new policy options to the selection:<br><code>OwaMailboxPolicy-NoSignatures</code> — for users who should not have email signatures in OWA<br><code>BookingsCreators</code> — for users who create Bookings appointments and need the corresponding add-in enabled<br><code>GetCurrent</code> — assigns the currently active policy for the user</td></tr><tr><td>➖</td><td>org</td><td>devices</td><td>Report Last Device Contact by Range</td><td>Removed — functionality is now fully covered by the updated <code>Report Stale Devices (Scheduled)</code> runbook, which includes enhanced filtering options that supersede this runbook's capabilities.</td></tr></tbody></table>

 
---
 
### General Changes
 
**Documentation overhaul across all runbooks** — Comprehensive rewrite of comment-based help in every runbook, including more detailed descriptions of functionality and parameters, clearer instructions for required permissions and setup steps, and improved formatting for better readability. This is particularly relevant for administrators onboarding new runbooks or setting up automation for the first time.
 
**Application Registration runbooks — permission tightening** — The required app role `Application.ReadWrite.All` has been replaced with the more restrictive `Application.ReadWrite.OwnedBy`, and `Directory.ReadWrite.All` has been removed as it is no longer required. Tenants using these runbooks should update their permission assignments accordingly to follow the principle of least privilege.

</details>

***

Prefer a different view? Browse these notes on the [GitHub Releases page](https://github.com/realmjoin/realmjoin-runbooks/releases) of the runbooks repository.

Looking for a more detailed, dated log of every individual runbook change? See the full [changelog](https://github.com/realmjoin/realmjoin-runbooks/blob/production/CHANGELOG.md) in the runbooks repository.
