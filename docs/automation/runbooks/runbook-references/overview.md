---
title: Runbook Overview
layout:
  width: wide
---

This document provides a comprehensive overview of all runbooks currently available in the RealmJoin portal. Each runbook is listed along with a brief description or synopsis to give a clear understanding of its purpose and functionality. The runbook name links to the detailed reference page of the respective runbook.

To ensure easy navigation, the runbooks are categorized into different sections based on their area of application. The following categories are currently available:

- Device
- Group
- Organization
- User

Each category contains multiple runbooks that are further divided into subcategories based on their functionality. The runbooks are listed in alphabetical order within each subcategory.

<a name='device'></a>
## Device
<a name='device-avd'></a>
### AVD
| Runbook Name | Synopsis |
| --- | --- |
| [Restart Host](device/avd/restart-host.md) | Reboots a specific AVD Session Host. |
| [Toggle Drain Mode](device/avd/toggle-drain-mode.md) | Sets Drainmode on true or false for a specific AVD Session Host. |

<a name='device-general'></a>
### General
| Runbook Name | Synopsis |
| --- | --- |
| [Assign Groups By Template](device/general/assign-groups-by-template.md) | Assign cloud-only groups to a device based on a template |
| [Change Grouptag](device/general/change-grouptag.md) | Assign a new AutoPilot GroupTag to this device. |
| [Check Device Compliance](device/general/check-device-compliance.md) | Check the compliance status of a device |
| [Check Updatable Assets](device/general/check-updatable-assets.md) | Check if a device is onboarded to Windows Update for Business |
| [Enroll Updatable Assets](device/general/enroll-updatable-assets.md) | Enroll device into Windows Update for Business |
| [Outphase Device](device/general/outphase-device.md) | Remove/Outphase a windows device |
| [Remove Primary User](device/general/remove-primary-user.md) | Removes the primary user from a device. |
| [Rename Device](device/general/rename-device.md) | Rename a device. |
| [Set Primary User](device/general/set-primary-user.md) | Set a new primary user on a managed Intune device |
| [Unenroll Updatable Assets](device/general/unenroll-updatable-assets.md) | Unenroll device from Windows Update for Business. |
| [Wipe Device](device/general/wipe-device.md) | Wipe a Windows or MacOS device |
| [Wipe Managed App Data](device/general/wipe-managed-app-data.md) | App selective wipe - remove company app data from this MAM device |

<a name='device-security'></a>
### Security
| Runbook Name | Synopsis |
| --- | --- |
| [Check Defender Status](device/security/check-defender-status.md) | Check a device's presence and risk status in Entra ID and Microsoft Defender for Endpoint |
| [Enable Or Disable Device](device/security/enable-or-disable-device.md) | Enable or disable a device in Entra ID |
| [Isolate Or Release Device](device/security/isolate-or-release-device.md) | Isolate this device. |
| [Reset Mobile Device Pin](device/security/reset-mobile-device-pin.md) | Reset a mobile device's password/PIN code. |
| [Restrict Or Release Code Execution](device/security/restrict-or-release-code-execution.md) | Only allow Microsoft-signed code to run on a device, or remove an existing restriction. |
| [Show Bitlocker Recovery Key](device/security/show-bitlocker-recovery-key.md) | Show all BitLocker recovery keys for a device |
| [Show Filevault Recovery Key](device/security/show-filevault-recovery-key.md) | Display macOS FileVault recovery key |
| [Show Laps Password](device/security/show-laps-password.md) | Show a local admin password for a device. |

<a name='group'></a>
## Group
<a name='group-devices'></a>
### Devices
| Runbook Name | Synopsis |
| --- | --- |
| [Check Updatable Assets](group/devices/check-updatable-assets.md) | Check if devices in a group are onboarded to Windows Update for Business. |
| [Unenroll Updatable Assets (Scheduled)](group/devices/unenroll-updatable-assets_scheduled.md) | Unenroll devices from Windows Update for Business. |

<a name='group-general'></a>
### General
| Runbook Name | Synopsis |
| --- | --- |
| [Add Or Remove Nested Group](group/general/add-or-remove-nested-group.md) | Add/remove a nested group to/from a group |
| [Add Or Remove Owner](group/general/add-or-remove-owner.md) | Add or remove a Office 365 group owner |
| [Add Or Remove User](group/general/add-or-remove-user.md) | Add or remove a group member |
| [Change Visibility](group/general/change-visibility.md) | Change a group's visibility |
| [List All Members](group/general/list-all-members.md) | List all members of a group, including members that are part of nested groups |
| [List Owners](group/general/list-owners.md) | List all owners of an Office 365 group. |
| [List User Devices](group/general/list-user-devices.md) | List devices owned by group members. |
| [Remove Group](group/general/remove-group.md) | Remove a group. For Microsoft 365 groups, also the associated resources (Teams, SharePoint site) will be removed. |
| [Rename Group](group/general/rename-group.md) | Rename a group. |

<a name='group-mail'></a>
### Mail
| Runbook Name | Synopsis |
| --- | --- |
| [Enable Or Disable External Mail](group/mail/enable-or-disable-external-mail.md) | Enable or disable external parties to send emails to a Microsoft 365 group |
| [Show Or Hide In Address Book](group/mail/show-or-hide-in-address-book.md) | Show or hide a group in the address book |

<a name='group-teams'></a>
### Teams
| Runbook Name | Synopsis |
| --- | --- |
| [Archive Team](group/teams/archive-team.md) | Archive a team |

<a name='org'></a>
## Organization
<a name='org-applications'></a>
### Applications
| Runbook Name | Synopsis |
| --- | --- |
| [Add Application Registration](org/applications/add-application-registration.md) | Add an application registration to Azure AD |
| [Add GSA Application Registration](org/applications/add-gsa-application-registration.md) | Add a GSA application registration to Azure AD |
| [Delete Application Registration](org/applications/delete-application-registration.md) | Delete an application registration from Azure AD |
| [Delete GSA Application Registration](org/applications/delete-gsa-application-registration.md) | Delete a GSA application registration from Azure AD including associated objects |
| [Export Enterprise Application Users](org/applications/export-enterprise-application-users.md) | Export a report of all (enterprise) application owners and users |
| [List Inactive Enterprise Applications](org/applications/list-inactive-enterprise-applications.md) | List enterprise applications with no recent sign-ins |
| [Report Application Registration](org/applications/report-application-registration.md) | Generate and email a comprehensive Application Registration report |
| [Report Expiring Application Credentials (Scheduled)](org/applications/report-expiring-application-credentials_scheduled.md) | List expiry date of all Application Registration credentials |
| [Update Application Registration](org/applications/update-application-registration.md) | Update an application registration in Azure AD |

<a name='org-devices'></a>
### Devices
| Runbook Name | Synopsis |
| --- | --- |
| [Add Autopilot Device](org/devices/add-autopilot-device.md) | Import a Windows device into Windows Autopilot |
| [Add Device Via Corporate Identifier](org/devices/add-device-via-corporate-identifier.md) | Import a device into Intune via corporate identifier |
| [Auto Approve Driver Updates (Scheduled)](org/devices/auto-approve-driver-updates_scheduled.md) | Auto-approve new driver updates in Intune driver update policies |
| [Cleanup Autopilot Devices (Scheduled)](org/devices/cleanup-autopilot-devices_scheduled.md) | Clean up orphaned and stale Windows Autopilot device registrations |
| [Create Endpoint Analytics Baseline](org/devices/create-endpoint-analytics-baseline.md) | Creates Endpoint Analytics baselines in Microsoft Intune with a specified naming schema. |
| [Dedup Device Names (Scheduled)](org/devices/dedup-device-names_scheduled.md) | Detect and rename duplicate Intune device display names using a prefix and random suffix |
| [Delete Stale Devices (Scheduled)](org/devices/delete-stale-devices_scheduled.md) | Scheduled deletion of stale devices based on last activity date and platform |
| [Get Bitlocker Recovery Key](org/devices/get-bitlocker-recovery-key.md) | Get the BitLocker recovery key |
| [Notify Users About Stale Devices (Scheduled)](org/devices/notify-users-about-stale-devices_scheduled.md) | Notify primary users about their stale devices via email |
| [Outphase Devices](org/devices/outphase-devices.md) | Remove or outphase multiple devices |
| [Report Devices Without Primary User (Scheduled)](org/devices/report-devices-without-primary-user_scheduled.md) | Reports all managed devices in Intune that do not have a primary user assigned. |
| [Report Primary User Mismatch (Scheduled)](org/devices/report-primary-user-mismatch_scheduled.md) | Compare primary user assignments in Intune against RealmJoin for Windows managed devices |
| [Report Stale Devices (Scheduled)](org/devices/report-stale-devices_scheduled.md) | Scheduled report of stale devices based on last activity date and platform. |
| [Report Users With More Than 5-Devices (Scheduled)](org/devices/report-users-with-more-than-5-devices_scheduled.md) | Report users with more than five registered devices |
| [Report Windows Devices Without Autopilot (Scheduled)](org/devices/report-windows-devices-without-autopilot_scheduled.md) | Reports all Windows Entra devices that have no associated Windows Autopilot object. |
| [Sync Device Serialnumbers To Entraid (Scheduled)](org/devices/sync-device-serialnumbers-to-entraid_scheduled.md) | Sync Intune serial numbers to Entra ID extension attributes |

<a name='org-general'></a>
### General
| Runbook Name | Synopsis |
| --- | --- |
| [Add Devices Of Users To Group (Scheduled)](org/general/add-devices-of-users-to-group_scheduled.md) | Sync devices of users in a specific group to another device group |
| [Add Management Partner](org/general/add-management-partner.md) | List or add Management Partner Links (PAL) |
| [Add Microsoft Store App Logos](org/general/add-microsoft-store-app-logos.md) | Update logos of Microsoft Store Apps (new) in Intune |
| [Add Office365 Group](org/general/add-office365-group.md) | Create an Office 365 group and SharePoint site, optionally create a (Teams) team. |
| [Add Or Remove Safelinks Exclusion](org/general/add-or-remove-safelinks-exclusion.md) | Add or remove a SafeLinks URL exclusion from a policy |
| [Add Or Remove Smartscreen Exclusion](org/general/add-or-remove-smartscreen-exclusion.md) | Add or remove a SmartScreen URL indicator in Microsoft Defender |
| [Add Or Remove Trusted Site](org/general/add-or-remove-trusted-site.md) | Add or remove a URL entry in the Intune Trusted Sites policy |
| [Add Primary Users Of Devices To Group (Scheduled)](org/general/add-primary-users-of-devices-to-group_scheduled.md) | Sync primary users of Intune managed devices by platform into an Entra ID group |
| [Add Security Group](org/general/add-security-group.md) | Create a Microsoft Entra ID security group |
| [Add User](org/general/add-user.md) | Create a new user account |
| [Add Viva Engange Community](org/general/add-viva-engange-community.md) | Create a Viva Engage (Yammer) community |
| [Assign Groups By Template (Scheduled)](org/general/assign-groups-by-template_scheduled.md) | Assign cloud-only groups to many users based on a predefined template |
| [Bulk Delete Devices From Autopilot](org/general/bulk-delete-devices-from-autopilot.md) | Bulk delete Autopilot objects by serial number |
| [Bulk Retire Devices From Intune](org/general/bulk-retire-devices-from-intune.md) | Bulk retire devices from Intune using serial numbers |
| [Check Aad Sync Status (Scheduled)](org/general/check-aad-sync-status_scheduled.md) | Check last Azure AD Connect sync status |
| [Check Assignments Of Devices](org/general/check-assignments-of-devices.md) | Check Intune assignments for one or more device names |
| [Check Assignments Of Groups](org/general/check-assignments-of-groups.md) | Check Intune assignments for one or more group names |
| [Check Assignments Of Users](org/general/check-assignments-of-users.md) | Check Intune assignments for one or more user principal names |
| [Check Autopilot Serialnumbers](org/general/check-autopilot-serialnumbers.md) | Check if given serial numbers are present in Autopilot |
| [Check Device Onboarding Exclusion (Scheduled)](org/general/check-device-onboarding-exclusion_scheduled.md) | Add unenrolled Autopilot devices to an exclusion group |
| [Enrolled Devices Report (Scheduled)](org/general/enrolled-devices-report_scheduled.md) | Show recent first-time device enrollments |
| [Export All Autopilot Devices](org/general/export-all-autopilot-devices.md) | List or export all Windows Autopilot devices |
| [Export All Intune Devices](org/general/export-all-intune-devices.md) | Export a list of all Intune devices and where they are registered |
| [Export Cloudpc Usage (Scheduled)](org/general/export-cloudpc-usage_scheduled.md) | Write daily Windows 365 utilization data to Azure Table Storage |
| [Export Non Compliant Devices](org/general/export-non-compliant-devices.md) | Export non-compliant Intune devices and settings |
| [Export Policy Report](org/general/export-policy-report.md) | Create a report of tenant policies from Intune and Entra ID. |
| [Invite External Guest Users](org/general/invite-external-guest-users.md) | Invite external guest users to the organization |
| [List All Administrative Template Policies](org/general/list-all-administrative-template-policies.md) | List all Administrative Template policies and their assignments |
| [List Group License Assignment Errors](org/general/list-group-license-assignment-errors.md) | Report groups that have license assignment errors |
| [Monitor Service Health (Scheduled)](org/general/monitor-service-health_scheduled.md) | Alert by email on newly announced Microsoft 365 Service Health issues |
| [Office365 License Report](org/general/office365-license-report.md) | Generate an Office 365 licensing report |
| [Report Apple MDM Cert Expiry (Scheduled)](org/general/report-apple-mdm-cert-expiry_scheduled.md) | Monitor/Report expiry of Apple device management certificates |
| [Report License Assignment (Scheduled)](org/general/report-license-assignment_scheduled.md) | Generate and email a license availability report based on thresholds |
| [Report Pim Activations (Scheduled)](org/general/report-pim-activations_scheduled.md) | Scheduled report on PIM activations |
| [Sync All Devices](org/general/sync-all-devices.md) | Sync all Intune Windows devices |
| [Sync Apple Tokens](org/general/sync-apple-tokens.md) | Sync Apple Enrollment Program Tokens and VPP Tokens with Intune |
| [Sync Channel Or Group Members (Scheduled)](org/general/sync-channel-or-group-members_scheduled.md) | Sync members between a Teams Shared Channel or a group and an Entra security group |
| [Sync Shared Channel Owners (Scheduled)](org/general/sync-shared-channel-owners_scheduled.md) | Ensure a security group's members are owners of mapped Teams and their shared channels. |

<a name='org-mail'></a>
### Mail
| Runbook Name | Synopsis |
| --- | --- |
| [Add Distribution List](org/mail/add-distribution-list.md) | Create a classic distribution group |
| [Add Equipment Mailbox](org/mail/add-equipment-mailbox.md) | Create an equipment mailbox |
| [Add Mail Contact](org/mail/add-mail-contact.md) | Create a new Exchange Online mail contact with optional display name and address list settings |
| [Add Or Remove Public Folder](org/mail/add-or-remove-public-folder.md) | Add or remove a public folder |
| [Add Or Remove Teams Mailcontact](org/mail/add-or-remove-teams-mailcontact.md) | Create/Remove a contact, to allow pretty email addresses for Teams channels. |
| [Add Or Remove Tenant Allow Block List](org/mail/add-or-remove-tenant-allow-block-list.md) | Add or remove entries from the Tenant Allow/Block List |
| [Add Room Mailbox](org/mail/add-room-mailbox.md) | Create a room mailbox resource |
| [Add Shared Mailbox](org/mail/add-shared-mailbox.md) | Create a shared mailbox |
| [Hide Mailboxes (Scheduled)](org/mail/hide-mailboxes_scheduled.md) | Hide or unhide special mailboxes in the Global Address List |
| [Set Booking Config](org/mail/set-booking-config.md) | Configure Microsoft Bookings settings for the organization |

<a name='org-phone'></a>
### Phone
| Runbook Name | Synopsis |
| --- | --- |
| [Get Teams Phone Number Assignment](org/phone/get-teams-phone-number-assignment.md) | Check whether a phone number is assigned in Microsoft Teams |

<a name='org-security'></a>
### Security
| Runbook Name | Synopsis |
| --- | --- |
| [Add Defender Indicator](org/security/add-defender-indicator.md) | Create a new Microsoft Defender for Endpoint indicator |
| [Backup Conditional Access Policies](org/security/backup-conditional-access-policies.md) | Export Conditional Access policies to an Azure Storage account |
| [Find SMS Auth Phone Number](org/security/find-sms-auth-phone-number.md) | Find the user associated with a specific SMS-based authentication phone number |
| [List Admin Users](org/security/list-admin-users.md) | List Entra ID role holders and optionally evaluate their MFA methods |
| [List Expiring Role Assignments](org/security/list-expiring-role-assignments.md) | List Azure AD role assignments expiring within a given number of days |
| [List Inactive Devices](org/security/list-inactive-devices.md) | List or export inactive devices with no recent logon or Intune sync |
| [List Inactive Users](org/security/list-inactive-users.md) | List users with no recent interactive sign-ins |
| [List Information Protection Labels](org/security/list-information-protection-labels.md) | List Microsoft Information Protection labels |
| [List Pim Rolegroups Without Owners (Scheduled)](org/security/list-pim-rolegroups-without-owners_scheduled.md) | List role-assignable groups with eligible role assignments but without owners |
| [List Users By MFA Methods Count](org/security/list-users-by-mfa-methods-count.md) | Report users by the count of their registered MFA methods |
| [List Vulnerable App Regs](org/security/list-vulnerable-app-regs.md) | List app registrations potentially vulnerable to CVE-2021-42306 |
| [Monitor Pending EPM Requests (Scheduled)](org/security/monitor-pending-epm-requests_scheduled.md) | Monitor and report pending Endpoint Privilege Management (EPM) elevation requests |
| [Notify Changed CA Policies](org/security/notify-changed-ca-policies.md) | Send notification email if Conditional Access policies have been created or modified in the last 24 hours. |
| [Report EPM Elevation Requests (Scheduled)](org/security/report-epm-elevation-requests_scheduled.md) | Generate report for Endpoint Privilege Management (EPM) elevation requests |
| [Sync MFA Secure Users To Group (Scheduled)](org/security/sync-mfa-secure-users-to-group_scheduled.md) | Sync users with secure MFA methods registered into an Entra ID group |

<a name='user'></a>
## User
<a name='user-avd'></a>
### AVD
| Runbook Name | Synopsis |
| --- | --- |
| [User Signout](user/avd/user-signout.md) | Removes (Signs Out) a specific User from their AVD Session. |

<a name='user-general'></a>
### General
| Runbook Name | Synopsis |
| --- | --- |
| [Assign Groups By Template](user/general/assign-groups-by-template.md) | Assign cloud-only groups to a user based on a template |
| [Assign Or Unassign License](user/general/assign-or-unassign-license.md) | Assign or remove a license for a user via group membership |
| [Assign Windows365](user/general/assign-windows365.md) | Assign and provision a Windows 365 Cloud PC for a user |
| [List Group Memberships](user/general/list-group-memberships.md) | List group memberships for this user |
| [List Group Ownerships](user/general/list-group-ownerships.md) | List group ownerships for this user. |
| [List Manager](user/general/list-manager.md) | List manager information for this user |
| [Offboard User Permanently](user/general/offboard-user-permanently.md) | Permanently offboard a user |
| [Offboard User Temporarily](user/general/offboard-user-temporarily.md) | Temporarily offboard a user |
| [Reprovision Windows365](user/general/reprovision-windows365.md) | Reprovision a Windows 365 Cloud PC |
| [Resize Windows365](user/general/resize-windows365.md) | Resize an existing Windows 365 Cloud PC for a user |
| [Unassign Windows365](user/general/unassign-windows365.md) | Remove and deprovision a Windows 365 Cloud PC for a user |

<a name='user-mail'></a>
### Mail
| Runbook Name | Synopsis |
| --- | --- |
| [Add Or Remove Email Address](user/mail/add-or-remove-email-address.md) | Add or remove an email address for a mailbox |
| [Assign Owa Mailbox Policy](user/mail/assign-owa-mailbox-policy.md) | Assign an OWA mailbox policy to a user |
| [Convert To Shared Mailbox](user/mail/convert-to-shared-mailbox.md) | Convert a user mailbox to a shared mailbox and back |
| [Delegate Full Access](user/mail/delegate-full-access.md) | Grant or revoke Exchange Online FullAccess mailbox permission for one or more users |
| [Delegate Send As](user/mail/delegate-send-as.md) | Delegate SendAs permissions for other user on his/her mailbox or remove existing delegation |
| [Delegate Send On Behalf](user/mail/delegate-send-on-behalf.md) | Delegate SendOnBehalf permissions for the user's mailbox |
| [Hide Or Unhide In Addressbook](user/mail/hide-or-unhide-in-addressbook.md) | Hide or unhide a mailbox in the address book |
| [List Mailbox Permissions](user/mail/list-mailbox-permissions.md) | List mailbox permissions for a mailbox |
| [List Room Mailbox Configuration](user/mail/list-room-mailbox-configuration.md) | List room mailbox configuration |
| [Manage Archive Mailbox](user/mail/manage-archive-mailbox.md) | Manage the Exchange Online archive mailbox for a user |
| [Remove Mailbox](user/mail/remove-mailbox.md) | Hard delete a shared mailbox, room or bookings calendar |
| [Set Out Of Office](user/mail/set-out-of-office.md) | Enable or disable mailbox out-of-office notifications |
| [Set Room Mailbox Configuration](user/mail/set-room-mailbox-configuration.md) | Set room mailbox resource policies |

<a name='user-phone'></a>
### Phone
| Runbook Name | Synopsis |
| --- | --- |
| [Disable Teams Phone](user/phone/disable-teams-phone.md) | Microsoft Teams telephony offboarding |
| [Get Teams User Info](user/phone/get-teams-user-info.md) | Get Microsoft Teams voice status for a user |
| [Grant Teams User Policies](user/phone/grant-teams-user-policies.md) | Grant Microsoft Teams policies to a Microsoft Teams enabled user |
| [Set Teams Permanent Call Forwarding](user/phone/set-teams-permanent-call-forwarding.md) | Set immediate call forwarding for a Teams user |
| [Set Teams Phone](user/phone/set-teams-phone.md) | Assign a phone number to a Microsoft Teams enabled user, enable calling and Grant specific Microsoft Teams policies. |

<a name='user-security'></a>
### Security
| Runbook Name | Synopsis |
| --- | --- |
| [Confirm Or Dismiss Risky User](user/security/confirm-or-dismiss-risky-user.md) | Confirm compromise or dismiss a risky user |
| [Create Temporary Access Pass](user/security/create-temporary-access-pass.md) | Create a temporary access pass for a user |
| [Enable Or Disable Password Expiration](user/security/enable-or-disable-password-expiration.md) | Enable or disable password expiration for a user |
| [List MFA Methods](user/security/list-mfa-methods.md) | List all MFA / authentication methods of a user |
| [Reset MFA](user/security/reset-mfa.md) | Remove all App- and Mobilephone auth methods for a user |
| [Reset Password](user/security/reset-password.md) | Reset a user's password |
| [Revoke Or Restore Access](user/security/revoke-or-restore-access.md) | Revoke or restore user access |
| [Set Or Remove Mobile Phone MFA](user/security/set-or-remove-mobile-phone-mfa.md) | Set or remove a user's mobile phone MFA method |

<a name='user-userinfo'></a>
### Userinfo
| Runbook Name | Synopsis |
| --- | --- |
| [Rename User](user/userinfo/rename-user.md) | Rename a user or mailbox |
| [Set Photo](user/userinfo/set-photo.md) | Set the profile photo for a user |
| [Update User](user/userinfo/update-user.md) | Update user metadata and memberships |

