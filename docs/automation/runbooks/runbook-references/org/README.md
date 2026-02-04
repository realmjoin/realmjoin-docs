---
title: Organization
---

# Organization Runbooks

This folder contains runbooks for organization management and operations.

## Runbooks by Category

### Applications

- [Add Application Registration](applications/add-application-registration.md) - Add an application registration to Azure AD
- [Delete Application Registration](applications/delete-application-registration.md) - Delete an application registration from Azure AD
- [Export Enterprise Application Users](applications/export-enterprise-application-users.md) - Export a CSV of all (enterprise) application owners and users
- [List Inactive Enterprise Applications](applications/list-inactive-enterprise-applications.md) - List application registrations, which had no recent user logons.
- [Report Application Registration](applications/report-application-registration.md) - Generate and email a comprehensive Application Registration report
- [Report Expiring Application Credentials (Scheduled)](applications/report-expiring-application-credentials_scheduled.md) - List expiry date of all Application Registration credentials
- [Update Application Registration](applications/update-application-registration.md) - Update an application registration in Azure AD

### Devices

- [Add Autopilot Device](devices/add-autopilot-device.md) - Import a windows device into Windows Autopilot.
- [Add Device Via Corporate Identifier](devices/add-device-via-corporate-identifier.md) - Import a device into Intune via corporate identifier.
- [Delete Stale Devices (Scheduled)](devices/delete-stale-devices_scheduled.md) - Scheduled deletion of stale devices based on last activity date and platform.
- [Get Bitlocker Recovery Key](devices/get-bitlocker-recovery-key.md) - Get BitLocker recovery key
- [Outphase Devices](devices/outphase-devices.md) - Remove/Outphase multiple devices
- [Report Devices Without Primary User](devices/report-devices-without-primary-user.md) - Reports all managed devices in Intune that do not have a primary user assigned.
- [Report Last Device Contact By Range](devices/report-last-device-contact-by-range.md) - Reports devices with last contact within a specified date range.
- [Report Stale Devices (Scheduled)](devices/report-stale-devices_scheduled.md) - Scheduled report of stale devices based on last activity date and platform.
- [Report Users With More Than 5-Devices](devices/report-users-with-more-than-5-devices.md) - Reports users with more than five registered devices in Entra ID.
- [Sync Device Serialnumbers To Entraid (Scheduled)](devices/sync-device-serialnumbers-to-entraid_scheduled.md) - Syncs serial numbers from Intune devices to Azure AD device extension attributes.

### General

- [Add Devices Of Users To Group (Scheduled)](general/add-devices-of-users-to-group_scheduled.md) - Sync devices of users in a specific group to another device group.
- [Add Management Partner](general/add-management-partner.md) - List or add or Management Partner Links (PAL)
- [Add Microsoft Store App Logos](general/add-microsoft-store-app-logos.md) - Update logos of Microsoft Store Apps (new) in Intune.
- [Add Office365 Group](general/add-office365-group.md) - Create an Office 365 group and SharePoint site, optionally create a (Teams) team.
- [Add Or Remove Safelinks Exclusion](general/add-or-remove-safelinks-exclusion.md) - Add or remove a SafeLinks URL exclusion to/from a given policy.
- [Add Or Remove Smartscreen Exclusion](general/add-or-remove-smartscreen-exclusion.md) - Add/Remove a SmartScreen URL Exception/Rule in MS Security Center Indicators
- [Add Or Remove Trusted Site](general/add-or-remove-trusted-site.md) - Add/Remove an entry to/from the Intune Windows 10 Trusted Sites Policy
- [Add Security Group](general/add-security-group.md) - This runbook creates a Microsoft Entra ID security group with membership type "Assigned".
- [Add User](general/add-user.md) - Create a new user account.
- [Add Viva Engange Community](general/add-viva-engange-community.md) - Creates a Viva Engage (Yammer) community via the Yammer API
- [Assign Groups By Template (Scheduled)](general/assign-groups-by-template_scheduled.md) - Assign cloud-only groups to many users based on a predefined template.
- [Bulk Delete Devices From Autopilot](general/bulk-delete-devices-from-autopilot.md) - Mass-Delete Autopilot objects based on Serial Number.
- [Bulk Retire Devices From Intune](general/bulk-retire-devices-from-intune.md) - Bulk retire devices from Intune using serial numbers
- [Check Aad Sync Status (Scheduled)](general/check-aad-sync-status_scheduled.md) - Check for last Azure AD Connect Sync Cycle.
- [Check Assignments Of Devices](general/check-assignments-of-devices.md) - Check Intune assignments for a given (or multiple) Device Names.
- [Check Assignments Of Groups](general/check-assignments-of-groups.md) - Check Intune assignments for a given (or multiple) Group Names.
- [Check Assignments Of Users](general/check-assignments-of-users.md) - Check Intune assignments for a given (or multiple) User Principal Names (UPNs).
- [Check Autopilot Serialnumbers](general/check-autopilot-serialnumbers.md) - Check if given serial numbers are present in AutoPilot.
- [Check Device Onboarding Exclusion (Scheduled)](general/check-device-onboarding-exclusion_scheduled.md) - Check for Autopilot devices not yet onboarded to Intune. Add these to an exclusion group.
- [Enrolled Devices Report (Scheduled)](general/enrolled-devices-report_scheduled.md) - Show recent first-time device enrollments.
- [Export All Autopilot Devices](general/export-all-autopilot-devices.md) - List/export all AutoPilot devices.
- [Export All Intune Devices](general/export-all-intune-devices.md) - Export a list of all Intune devices and where they are registered.
- [Export Cloudpc Usage (Scheduled)](general/export-cloudpc-usage_scheduled.md) - Write daily Windows 365 Utilization Data to Azure Tables
- [Export Non Compliant Devices](general/export-non-compliant-devices.md) - Report on non-compliant devices and policies
- [Export Policy Report](general/export-policy-report.md) - Create a report of a tenant's polcies from Intune and AAD and write them to a markdown file.
- [Invite External Guest Users](general/invite-external-guest-users.md) - Invites external guest users to the organization using Microsoft Graph.
- [List All Administrative Template Policies](general/list-all-administrative-template-policies.md) - List all Administrative Template policies and their assignments.
- [List Group License Assignment Errors](general/list-group-license-assignment-errors.md) - Report groups that have license assignment errors
- [Office365 License Report](general/office365-license-report.md) - Generate an Office 365 licensing report.
- [Report Apple MDM Cert Expiry (Scheduled)](general/report-apple-mdm-cert-expiry_scheduled.md) - Monitor/Report expiry of Apple device management certificates.
- [Report License Assignment (Scheduled)](general/report-license-assignment_scheduled.md) - Generate and email a license availability report based on configured thresholds
- [Report Pim Activations (Scheduled)](general/report-pim-activations_scheduled.md) - Scheduled Report on PIM Activations.
- [Sync All Devices](general/sync-all-devices.md) - Sync all Intune devices.

### Mail

- [Add Distribution List](mail/add-distribution-list.md) - Create a classic distribution group.
- [Add Equipment Mailbox](mail/add-equipment-mailbox.md) - Create an equipment mailbox.
- [Add Or Remove Public Folder](mail/add-or-remove-public-folder.md) - Add or remove a public folder.
- [Add Or Remove Teams Mailcontact](mail/add-or-remove-teams-mailcontact.md) - Create/Remove a contact, to allow pretty email addresses for Teams channels.
- [Add Or Remove Tenant Allow Block List](mail/add-or-remove-tenant-allow-block-list.md) - Add or remove entries from the Tenant Allow/Block List.
- [Add Room Mailbox](mail/add-room-mailbox.md) - Create a room resource.
- [Add Shared Mailbox](mail/add-shared-mailbox.md) - Create a shared mailbox.
- [Hide Mailboxes (Scheduled)](mail/hide-mailboxes_scheduled.md) - Hide / Unhide special mailboxes in Global Address Book
- [Set Booking Config](mail/set-booking-config.md) - Configure Microsoft Bookings settings for the organization.

### Phone

- [Get Teams Phone Number Assignment](phone/get-teams-phone-number-assignment.md) - Looks up, if the given phone number is assigned to a user in Microsoft Teams.

### Security

- [Add Defender Indicator](security/add-defender-indicator.md) - Create new Indicator in Defender for Endpoint.
- [Backup Conditional Access Policies](security/backup-conditional-access-policies.md) - Exports the current set of Conditional Access policies to an Azure storage account.
- [List Admin Users](security/list-admin-users.md) - List AzureAD role holders and their MFA state.
- [List Expiring Role Assignments](security/list-expiring-role-assignments.md) - List Azure AD role assignments that will expire before a given number of days.
- [List Inactive Devices](security/list-inactive-devices.md) - List/export inactive devices, which had no recent user logons.
- [List Inactive Users](security/list-inactive-users.md) - List users, that have no recent interactive signins.
- [List Information Protection Labels](security/list-information-protection-labels.md) - Prints a list of all available InformationProtectionPolicy labels.
- [List Pim Rolegroups Without Owners (Scheduled)](security/list-pim-rolegroups-without-owners_scheduled.md) - List role-assignable groups with eligible role assignments but without owners
- [List Users By MFA Methods Count](security/list-users-by-mfa-methods-count.md) - Reports users by the count of their registered MFA methods.
- [List Vulnerable App Regs](security/list-vulnerable-app-regs.md) - List all app registrations that suffer from the CVE-2021-42306 vulnerability.
- [Notify Changed CA Policies](security/notify-changed-ca-policies.md) - Exports the current set of Conditional Access policies to an Azure storage account.

## Summary

Total runbooks in this category: **71**

### Breakdown by Subcategory

- **Applications**: 7 runbooks
- **Devices**: 10 runbooks
- **General**: 33 runbooks
- **Mail**: 9 runbooks
- **Phone**: 1 runbooks
- **Security**: 11 runbooks
