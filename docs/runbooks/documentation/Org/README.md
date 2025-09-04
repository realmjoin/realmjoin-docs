# Org Runbooks

This folder contains runbooks for org management and operations.

## Runbooks by Category

### Devices

- [Delete Stale Devices_Scheduled](Devices/Delete-Stale-Devices_Scheduled.md) - Scheduled deletion of stale devices based on last activity date and platform.
- [Get Bitlocker Recovery Key](Devices/Get-Bitlocker-Recovery-Key.md) - Get BitLocker recovery key
- [List Stale Devices_Scheduled](Devices/List-Stale-Devices_Scheduled.md) - Scheduled report of stale devices based on last activity date and platform.
- [Outphase Devices](Devices/Outphase-Devices.md) - Remove/Outphase multiple devices
- [Report Devices Without Primary User](Devices/Report-Devices-Without-Primary-User.md) - Reports all managed devices in Intune that do not have a primary user assigned.
- [Report Last Device Contact By Range](Devices/Report-Last-Device-Contact-By-Range.md) - Reports Windows devices with last device contact within a specified date range.
- [Report Users With More Than 5-Devices](Devices/Report-Users-With-More-Than-5-Devices.md) - Reports users with more than five registered devices in Entra ID.
- [Sync Device Serialnumbers To Entraid_Scheduled](Devices/Sync-Device-Serialnumbers-To-Entraid_Scheduled.md) - Syncs serial numbers from Intune devices to Azure AD device extension attributes.

### General

- [Add Application Registration](General/Add-Application-Registration.md) - Add an application registration to Azure AD
- [Add Autopilot Device](General/Add-Autopilot-Device.md) - Import a windows device into Windows Autopilot.
- [Add Device Via Corporate Identifier](General/Add-Device-Via-Corporate-Identifier.md) - Import a device into Intune via corporate identifier.
- [Add Devices Of Users To Group_Scheduled](General/Add-Devices-Of-Users-To-Group_Scheduled.md) - Sync devices of users in a specific group to another device group.
- [Add Management Partner](General/Add-Management-Partner.md) - List or add or Management Partner Links (PAL)
- [Add Microsoft Store App Logos](General/Add-Microsoft-Store-App-Logos.md) - Update logos of Microsoft Store Apps (new) in Intune.
- [Add Office365 Group](General/Add-Office365-Group.md) - Create an Office 365 group and SharePoint site, optionally create a (Teams) team.
- [Add Or Remove Safelinks Exclusion](General/Add-Or-Remove-Safelinks-Exclusion.md) - Add or remove a SafeLinks URL exclusion to/from a given policy.
- [Add Or Remove Smartscreen Exclusion](General/Add-Or-Remove-Smartscreen-Exclusion.md) - Add/Remove a SmartScreen URL Exception/Rule in MS Security Center Indicators
- [Add Or Remove Trusted Site](General/Add-Or-Remove-Trusted-Site.md) - Add/Remove an entry to/from the Intune Windows 10 Trusted Sites Policy
- [Add Security Group](General/Add-Security-Group.md) - This runbook creates a Microsoft Entra ID security group with membership type "Assigned".
- [Add User](General/Add-User.md) - Create a new user account.
- [Add Viva Engange Community](General/Add-Viva-Engange-Community.md) - Creates a Viva Engage (Yammer) community via the Yammer API
- [Assign Groups By Template_Scheduled](General/Assign-Groups-By-Template_Scheduled.md) - Assign cloud-only groups to many users based on a predefined template.
- [Bulk Delete Devices From Autopilot](General/Bulk-Delete-Devices-From-Autopilot.md) - Mass-Delete Autopilot objects based on Serial Number.
- [Bulk Retire Devices From Intune](General/Bulk-Retire-Devices-From-Intune.md) - Bulk retire devices from Intune using serial numbers
- [Check Aad Sync Status_Scheduled](General/Check-Aad-Sync-Status_Scheduled.md) - Check for last Azure AD Connect Sync Cycle.
- [Check Assignments Of Devices](General/Check-Assignments-Of-Devices.md) - Check Intune assignments for a given (or multiple) Device Names.
- [Check Assignments Of Groups](General/Check-Assignments-Of-Groups.md) - Check Intune assignments for a given (or multiple) Group Names.
- [Check Assignments Of Users](General/Check-Assignments-Of-Users.md) - Check Intune assignments for a given (or multiple) User Principal Names (UPNs).
- [Check Autopilot Serialnumbers](General/Check-Autopilot-Serialnumbers.md) - Check if given serial numbers are present in AutoPilot.
- [Check Device Onboarding Exclusion_Schedule](General/Check-Device-Onboarding-Exclusion_Schedule.md) - Check for Autopilot devices not yet onboarded to Intune. Add these to an exclusion group.
- [Enrolled Devices Report_Scheduled](General/Enrolled-Devices-Report_Scheduled.md) - Show recent first-time device enrollments.
- [Export All Autopilot Devices](General/Export-All-Autopilot-Devices.md) - List/export all AutoPilot devices.
- [Export All Intune Devices](General/Export-All-Intune-Devices.md) - Export a list of all Intune devices and where they are registered.
- [Export Cloudpc Usage_Scheduled](General/Export-Cloudpc-Usage_Scheduled.md) - Write daily Windows 365 Utilization Data to Azure Tables
- [Export Non Compliant Devices](General/Export-Non-Compliant-Devices.md) - Report on non-compliant devices and policies
- [Export Policy Report](General/Export-Policy-Report.md) - Create a report of a tenant's polcies from Intune and AAD and write them to a markdown file.
- [Invite External Guest Users](General/Invite-External-Guest-Users.md) - Invites external guest users to the organization using Microsoft Graph.
- [List All Administrative Template Policies](General/List-All-Administrative-Template-Policies.md) - List all Administrative Template policies and their assignments.
- [List Group License Assignment Errors](General/List-Group-License-Assignment-Errors.md) - Report groups that have license assignment errors
- [Office365 License Report](General/Office365-License-Report.md) - Generate an Office 365 licensing report.
- [Report Apple Mdm Cert Expiry_Scheduled](General/Report-Apple-Mdm-Cert-Expiry_Scheduled.md) - Monitor/Report expiry of Apple device management certificates.
- [Report Pim Activations_Scheduled](General/Report-Pim-Activations_Scheduled.md) - Scheduled Report on PIM Activations.
- [Sync All Devices](General/Sync-All-Devices.md) - Sync all Intune devices.

### Mail

- [Add Distribution List](Mail/Add-Distribution-List.md) - Create a classic distribution group.
- [Add Equipment Mailbox](Mail/Add-Equipment-Mailbox.md) - Create an equipment mailbox.
- [Add Or Remove Public Folder](Mail/Add-Or-Remove-Public-Folder.md) - Add or remove a public folder.
- [Add Or Remove Teams Mailcontact](Mail/Add-Or-Remove-Teams-Mailcontact.md) - Create/Remove a contact, to allow pretty email addresses for Teams channels.
- [Add Room Mailbox](Mail/Add-Room-Mailbox.md) - Create a room resource.
- [Add Shared Mailbox](Mail/Add-Shared-Mailbox.md) - Create a shared mailbox.
- [Hide Mailboxes_Scheduled](Mail/Hide-Mailboxes_Scheduled.md) - Hide / Unhide special mailboxes in Global Address Book
- [Set Booking Config](Mail/Set-Booking-Config.md)

### Phone

- [Get Teams Phone Number Assignment](Phone/Get-Teams-Phone-Number-Assignment.md) - Looks up, if the given phone number is assigned to a user in Microsoft Teams.

### Security

- [Add Defender Indicator](Security/Add-Defender-Indicator.md) - Create new Indicator in Defender for Endpoint.
- [Backup Conditional Access Policies](Security/Backup-Conditional-Access-Policies.md) - Exports the current set of Conditional Access policies to an Azure storage account.
- [Export Enterprise App Users](Security/Export-Enterprise-App-Users.md) - Export a CSV of all (entprise) app owners and users
- [List Admin Users](Security/List-Admin-Users.md) - List AzureAD role holders and their MFA state.
- [List Application Creds Expiry](Security/List-Application-Creds-Expiry.md) - List expiry date of all AppRegistration credentials
- [List Expiring Role Assignments](Security/List-Expiring-Role-Assignments.md) - List Azure AD role assignments that will expire before a given number of days.
- [List Inactive Devices](Security/List-Inactive-Devices.md) - List/export inactive evices, which had no recent user logons.
- [List Inactive Enterprise Apps](Security/List-Inactive-Enterprise-Apps.md) - List App registrations, which had no recent user logons.
- [List Inactive Users](Security/List-Inactive-Users.md) - List users, that have no recent interactive signins.
- [List Information Protection Labels](Security/List-Information-Protection-Labels.md) - Prints a list of all available InformationProtectionPolicy labels.
- [List Pim Rolegroups Without Owners_Scheduled](Security/List-Pim-Rolegroups-Without-Owners_Scheduled.md) - List role-assignable groups with eligible role assignments but without owners
- [List Users By MFA Methods Count](Security/List-Users-By-MFA-Methods-Count.md) - Reports users by the count of their registered MFA methods.
- [List Vulnerable App Regs](Security/List-Vulnerable-App-Regs.md) - List all app registrations that suffer from the CVE-2021-42306 vulnerability.
- [Notify Changed CA Policies](Security/Notify-Changed-CA-Policies.md) - Exports the current set of Conditional Access policies to an Azure storage account.

## Summary

Total runbooks in this category: **66**

### Breakdown by Subcategory

- **Devices**: 8 runbooks
- **General**: 35 runbooks
- **Mail**: 8 runbooks
- **Phone**: 1 runbooks
- **Security**: 14 runbooks

