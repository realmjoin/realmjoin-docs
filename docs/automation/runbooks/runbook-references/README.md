---
title: Runbook References
---

## Runbook References

This section contains detailed documentation for all available RealmJoin Runbooks.
The runbooks are automatically generated from the [realmjoin-runbooks](https://github.com/realmjoin/realmjoin-runbooks) repository and updated daily.

All runbooks are organized into different folders based on their area of application.

The following categories are currently available:

- device
- group
- org
- user

Each category contains multiple runbooks that are further divided into subcategories based on their functionality. The runbooks are listed in alphabetical order within each subcategory.

## RealmJoin Runbook overview

In the following, each runbook is listed along with a brief description or synopsis to give a clear understanding of its purpose and functionality.
Also the document for each runbook contains information about permissions, where to find, notes, and parameters and further information in general.

### Runbook categorie overview

| Category | Subcategory |
|---|---|
| [Device](device/README.md) | [AVD](device/README.md#device-avd)<br>[General](device/README.md#device-general)<br>[Security](device/README.md#device-security) |
| [Group](group/README.md) | [Devices](group/README.md#group-devices)<br>[General](group/README.md#group-general)<br>[Mail](group/README.md#group-mail)<br>[Teams](group/README.md#group-teams) |
| [Organization](org/README.md) | [Applications](org/README.md#org-applications)<br>[Devices](org/README.md#org-devices)<br>[General](org/README.md#org-general)<br>[Mail](org/README.md#org-mail)<br>[Phone](org/README.md#org-phone)<br>[Security](org/README.md#org-security) |
| [User](user/README.md) | [AVD](user/README.md#user-avd)<br>[General](user/README.md#user-general)<br>[Mail](user/README.md#user-mail)<br>[Phone](user/README.md#user-phone)<br>[Security](user/README.md#user-security)<br>[Userinfo](user/README.md#user-userinfo) |

### Device Runbooks

- [AVD](device/README.md#device-avd)
  - [Restart Host](device/avd/restart-host.md)
  - [Toggle Drain Mode](device/avd/toggle-drain-mode.md)
- [General](device/README.md#device-general)
  - [Change Grouptag](device/general/change-grouptag.md)
  - [Check Updatable Assets](device/general/check-updatable-assets.md)
  - [Enroll Updatable Assets](device/general/enroll-updatable-assets.md)
  - [Outphase Device](device/general/outphase-device.md)
  - [Remove Primary User](device/general/remove-primary-user.md)
  - [Rename Device](device/general/rename-device.md)
  - [Unenroll Updatable Assets](device/general/unenroll-updatable-assets.md)
  - [Wipe Device](device/general/wipe-device.md)
- [Security](device/README.md#device-security)
  - [Enable Or Disable Device](device/security/enable-or-disable-device.md)
  - [Isolate Or Release Device](device/security/isolate-or-release-device.md)
  - [Reset Mobile Device Pin](device/security/reset-mobile-device-pin.md)
  - [Restrict Or Release Code Execution](device/security/restrict-or-release-code-execution.md)
  - [Show Laps Password](device/security/show-laps-password.md)

### Group Runbooks

- [Devices](group/README.md#group-devices)
  - [Check Updatable Assets](group/devices/check-updatable-assets.md)
  - [Unenroll Updatable Assets (Scheduled)](group/devices/unenroll-updatable-assets_scheduled.md)
- [General](group/README.md#group-general)
  - [Add Or Remove Nested Group](group/general/add-or-remove-nested-group.md)
  - [Add Or Remove Owner](group/general/add-or-remove-owner.md)
  - [Add Or Remove User](group/general/add-or-remove-user.md)
  - [Change Visibility](group/general/change-visibility.md)
  - [List All Members](group/general/list-all-members.md)
  - [List Owners](group/general/list-owners.md)
  - [List User Devices](group/general/list-user-devices.md)
  - [Remove Group](group/general/remove-group.md)
  - [Rename Group](group/general/rename-group.md)
- [Mail](group/README.md#group-mail)
  - [Enable Or Disable External Mail](group/mail/enable-or-disable-external-mail.md)
  - [Show Or Hide In Address Book](group/mail/show-or-hide-in-address-book.md)
- [Teams](group/README.md#group-teams)
  - [Archive Team](group/teams/archive-team.md)

### Organization Runbooks

- [Applications](org/README.md#org-applications)
  - [Add Application Registration](org/applications/add-application-registration.md)
  - [Delete Application Registration](org/applications/delete-application-registration.md)
  - [Export Enterprise Application Users](org/applications/export-enterprise-application-users.md)
  - [List Inactive Enterprise Applications](org/applications/list-inactive-enterprise-applications.md)
  - [Report Application Registration](org/applications/report-application-registration.md)
  - [Report Expiring Application Credentials (Scheduled)](org/applications/report-expiring-application-credentials_scheduled.md)
  - [Update Application Registration](org/applications/update-application-registration.md)
- [Devices](org/README.md#org-devices)
  - [Add Autopilot Device](org/devices/add-autopilot-device.md)
  - [Add Device Via Corporate Identifier](org/devices/add-device-via-corporate-identifier.md)
  - [Delete Stale Devices (Scheduled)](org/devices/delete-stale-devices_scheduled.md)
  - [Get Bitlocker Recovery Key](org/devices/get-bitlocker-recovery-key.md)
  - [Notify Users About Stale Devices (Scheduled)](org/devices/notify-users-about-stale-devices_scheduled.md)
  - [Outphase Devices](org/devices/outphase-devices.md)
  - [Report Devices Without Primary User](org/devices/report-devices-without-primary-user.md)
  - [Report Stale Devices (Scheduled)](org/devices/report-stale-devices_scheduled.md)
  - [Report Users With More Than 5-Devices](org/devices/report-users-with-more-than-5-devices.md)
  - [Sync Device Serialnumbers To Entraid (Scheduled)](org/devices/sync-device-serialnumbers-to-entraid_scheduled.md)
- [General](org/README.md#org-general)
  - [Add Devices Of Users To Group (Scheduled)](org/general/add-devices-of-users-to-group_scheduled.md)
  - [Add Management Partner](org/general/add-management-partner.md)
  - [Add Microsoft Store App Logos](org/general/add-microsoft-store-app-logos.md)
  - [Add Office365 Group](org/general/add-office365-group.md)
  - [Add Or Remove Safelinks Exclusion](org/general/add-or-remove-safelinks-exclusion.md)
  - [Add Or Remove Smartscreen Exclusion](org/general/add-or-remove-smartscreen-exclusion.md)
  - [Add Or Remove Trusted Site](org/general/add-or-remove-trusted-site.md)
  - [Add Security Group](org/general/add-security-group.md)
  - [Add User](org/general/add-user.md)
  - [Add Viva Engange Community](org/general/add-viva-engange-community.md)
  - [Assign Groups By Template (Scheduled)](org/general/assign-groups-by-template_scheduled.md)
  - [Bulk Delete Devices From Autopilot](org/general/bulk-delete-devices-from-autopilot.md)
  - [Bulk Retire Devices From Intune](org/general/bulk-retire-devices-from-intune.md)
  - [Check Aad Sync Status (Scheduled)](org/general/check-aad-sync-status_scheduled.md)
  - [Check Assignments Of Devices](org/general/check-assignments-of-devices.md)
  - [Check Assignments Of Groups](org/general/check-assignments-of-groups.md)
  - [Check Assignments Of Users](org/general/check-assignments-of-users.md)
  - [Check Autopilot Serialnumbers](org/general/check-autopilot-serialnumbers.md)
  - [Check Device Onboarding Exclusion (Scheduled)](org/general/check-device-onboarding-exclusion_scheduled.md)
  - [Enrolled Devices Report (Scheduled)](org/general/enrolled-devices-report_scheduled.md)
  - [Export All Autopilot Devices](org/general/export-all-autopilot-devices.md)
  - [Export All Intune Devices](org/general/export-all-intune-devices.md)
  - [Export Cloudpc Usage (Scheduled)](org/general/export-cloudpc-usage_scheduled.md)
  - [Export Non Compliant Devices](org/general/export-non-compliant-devices.md)
  - [Export Policy Report](org/general/export-policy-report.md)
  - [Invite External Guest Users](org/general/invite-external-guest-users.md)
  - [List All Administrative Template Policies](org/general/list-all-administrative-template-policies.md)
  - [List Group License Assignment Errors](org/general/list-group-license-assignment-errors.md)
  - [Office365 License Report](org/general/office365-license-report.md)
  - [Report Apple MDM Cert Expiry (Scheduled)](org/general/report-apple-mdm-cert-expiry_scheduled.md)
  - [Report License Assignment (Scheduled)](org/general/report-license-assignment_scheduled.md)
  - [Report Pim Activations (Scheduled)](org/general/report-pim-activations_scheduled.md)
  - [Sync All Devices](org/general/sync-all-devices.md)
- [Mail](org/README.md#org-mail)
  - [Add Distribution List](org/mail/add-distribution-list.md)
  - [Add Equipment Mailbox](org/mail/add-equipment-mailbox.md)
  - [Add Or Remove Public Folder](org/mail/add-or-remove-public-folder.md)
  - [Add Or Remove Teams Mailcontact](org/mail/add-or-remove-teams-mailcontact.md)
  - [Add Or Remove Tenant Allow Block List](org/mail/add-or-remove-tenant-allow-block-list.md)
  - [Add Room Mailbox](org/mail/add-room-mailbox.md)
  - [Add Shared Mailbox](org/mail/add-shared-mailbox.md)
  - [Hide Mailboxes (Scheduled)](org/mail/hide-mailboxes_scheduled.md)
  - [Set Booking Config](org/mail/set-booking-config.md)
- [Phone](org/README.md#org-phone)
  - [Get Teams Phone Number Assignment](org/phone/get-teams-phone-number-assignment.md)
- [Security](org/README.md#org-security)
  - [Add Defender Indicator](org/security/add-defender-indicator.md)
  - [Backup Conditional Access Policies](org/security/backup-conditional-access-policies.md)
  - [List Admin Users](org/security/list-admin-users.md)
  - [List Expiring Role Assignments](org/security/list-expiring-role-assignments.md)
  - [List Inactive Devices](org/security/list-inactive-devices.md)
  - [List Inactive Users](org/security/list-inactive-users.md)
  - [List Information Protection Labels](org/security/list-information-protection-labels.md)
  - [List Pim Rolegroups Without Owners (Scheduled)](org/security/list-pim-rolegroups-without-owners_scheduled.md)
  - [List Users By MFA Methods Count](org/security/list-users-by-mfa-methods-count.md)
  - [List Vulnerable App Regs](org/security/list-vulnerable-app-regs.md)
  - [Monitor Pending EPM Requests (Scheduled)](org/security/monitor-pending-epm-requests_scheduled.md)
  - [Notify Changed CA Policies](org/security/notify-changed-ca-policies.md)
  - [Report EPM Elevation Requests (Scheduled)](org/security/report-epm-elevation-requests_scheduled.md)

### User Runbooks

- [AVD](user/README.md#user-avd)
  - [User Signout](user/avd/user-signout.md)
- [General](user/README.md#user-general)
  - [Assign Groups By Template](user/general/assign-groups-by-template.md)
  - [Assign Or Unassign License](user/general/assign-or-unassign-license.md)
  - [Assign Windows365](user/general/assign-windows365.md)
  - [List Group Memberships](user/general/list-group-memberships.md)
  - [List Group Ownerships](user/general/list-group-ownerships.md)
  - [List Manager](user/general/list-manager.md)
  - [Offboard User Permanently](user/general/offboard-user-permanently.md)
  - [Offboard User Temporarily](user/general/offboard-user-temporarily.md)
  - [Reprovision Windows365](user/general/reprovision-windows365.md)
  - [Resize Windows365](user/general/resize-windows365.md)
  - [Unassign Windows365](user/general/unassign-windows365.md)
- [Mail](user/README.md#user-mail)
  - [Add Or Remove Email Address](user/mail/add-or-remove-email-address.md)
  - [Assign Owa Mailbox Policy](user/mail/assign-owa-mailbox-policy.md)
  - [Convert To Shared Mailbox](user/mail/convert-to-shared-mailbox.md)
  - [Delegate Full Access](user/mail/delegate-full-access.md)
  - [Delegate Send As](user/mail/delegate-send-as.md)
  - [Delegate Send On Behalf](user/mail/delegate-send-on-behalf.md)
  - [Hide Or Unhide In Addressbook](user/mail/hide-or-unhide-in-addressbook.md)
  - [List Mailbox Permissions](user/mail/list-mailbox-permissions.md)
  - [List Room Mailbox Configuration](user/mail/list-room-mailbox-configuration.md)
  - [Remove Mailbox](user/mail/remove-mailbox.md)
  - [Set Out Of Office](user/mail/set-out-of-office.md)
  - [Set Room Mailbox Configuration](user/mail/set-room-mailbox-configuration.md)
- [Phone](user/README.md#user-phone)
  - [Disable Teams Phone](user/phone/disable-teams-phone.md)
  - [Get Teams User Info](user/phone/get-teams-user-info.md)
  - [Grant Teams User Policies](user/phone/grant-teams-user-policies.md)
  - [Set Teams Permanent Call Forwarding](user/phone/set-teams-permanent-call-forwarding.md)
  - [Set Teams Phone](user/phone/set-teams-phone.md)
- [Security](user/README.md#user-security)
  - [Confirm Or Dismiss Risky User](user/security/confirm-or-dismiss-risky-user.md)
  - [Create Temporary Access Pass](user/security/create-temporary-access-pass.md)
  - [Enable Or Disable Password Expiration](user/security/enable-or-disable-password-expiration.md)
  - [Reset Mfa](user/security/reset-mfa.md)
  - [Reset Password](user/security/reset-password.md)
  - [Revoke Or Restore Access](user/security/revoke-or-restore-access.md)
  - [Set Or Remove Mobile Phone Mfa](user/security/set-or-remove-mobile-phone-mfa.md)
- [Userinfo](user/README.md#user-userinfo)
  - [Rename User](user/userinfo/rename-user.md)
  - [Set Photo](user/userinfo/set-photo.md)
  - [Update User](user/userinfo/update-user.md)

