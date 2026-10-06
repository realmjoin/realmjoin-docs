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
| [Restart Host](device/avd/restart-host.md) | Restart this AVD session host and return it to service |
| [Toggle Drain Mode](device/avd/toggle-drain-mode.md) | Enable or disable drain mode on this AVD session host |

<a name='device-general'></a>
### General
| Runbook Name | Synopsis |
| --- | --- |
| [Assign Groups By Template](device/general/assign-groups-by-template.md) | Add this device to a predefined set of groups |
| [Change Grouptag](device/general/change-grouptag.md) | Assign a new Autopilot group tag to this device |
| [Check Device Compliance](device/general/check-device-compliance.md) | Check the Intune compliance status of this device |
| [Check Updatable Assets](device/general/check-updatable-assets.md) | Check whether this device is enrolled in Windows Update for Business |
| [Enroll Updatable Assets](device/general/enroll-updatable-assets.md) | Enroll this device in Windows Update for Business |
| [Outphase Device](device/general/outphase-device.md) | Wipe this Windows device and clean up Intune, Autopilot and Entra ID |
| [Remove Primary User](device/general/remove-primary-user.md) | Remove the primary user from this device |
| [Rename Device](device/general/rename-device.md) | Rename this device in Intune and Autopilot |
| [Set Primary User](device/general/set-primary-user.md) | Set a new primary user on this device |
| [Unenroll Updatable Assets](device/general/unenroll-updatable-assets.md) | Unenroll this device from Windows Update for Business |
| [Wipe Device](device/general/wipe-device.md) | Wipe this Windows or macOS device and clean up its records |
| [Wipe Managed App Data](device/general/wipe-managed-app-data.md) | Remove company app data from this MAM-managed device |

<a name='device-security'></a>
### Security
| Runbook Name | Synopsis |
| --- | --- |
| [Check Defender Status](device/security/check-defender-status.md) | Check this device in Entra ID and Defender for Endpoint |
| [Enable Or Disable Device](device/security/enable-or-disable-device.md) | Enable or disable this device in Entra ID |
| [Enable Or Disable Lost Mode](device/security/enable-or-disable-lost-mode.md) | Enable or disable Lost Mode on this supervised iOS or iPadOS device |
| [Isolate Or Release Device](device/security/isolate-or-release-device.md) | Isolate this device from the network or release it |
| [Reset Mobile Device Pin](device/security/reset-mobile-device-pin.md) | Reset the passcode of this mobile device |
| [Restrict Or Release Code Execution](device/security/restrict-or-release-code-execution.md) | Restrict this device to Microsoft-signed code or lift the restriction |
| [Show Bitlocker Recovery Key](device/security/show-bitlocker-recovery-key.md) | Show the BitLocker recovery keys of this device |
| [Show Filevault Recovery Key](device/security/show-filevault-recovery-key.md) | Show the FileVault recovery key of this Mac |
| [Show Laps Password](device/security/show-laps-password.md) | Show the local admin password of this device |

<a name='group'></a>
## Group
<a name='group-devices'></a>
### Devices
| Runbook Name | Synopsis |
| --- | --- |
| [Check Updatable Assets](group/devices/check-updatable-assets.md) | Check Windows Update for Business enrollment of this group's devices |
| [Unenroll Updatable Assets (Scheduled)](group/devices/unenroll-updatable-assets_scheduled.md) | Unenroll this group's devices from Windows Update for Business |

<a name='group-general'></a>
### General
| Runbook Name | Synopsis |
| --- | --- |
| [Add Or Remove Nested Group](group/general/add-or-remove-nested-group.md) | Add a nested group to this group or remove it |
| [Add Or Remove Owner](group/general/add-or-remove-owner.md) | Add an owner to this group or remove one |
| [Add Or Remove User](group/general/add-or-remove-user.md) | Add a user to this group or remove one |
| [Change Visibility](group/general/change-visibility.md) | Make this group public or private |
| [List All Members](group/general/list-all-members.md) | List all members of this group, nested groups included |
| [List Owners](group/general/list-owners.md) | List the owners of this group |
| [List User Devices](group/general/list-user-devices.md) | List the devices registered to this group's members |
| [Remove Group](group/general/remove-group.md) | Delete this group and its Microsoft 365 resources |
| [Rename Group](group/general/rename-group.md) | Rename this group or change its description |

<a name='group-mail'></a>
### Mail
| Runbook Name | Synopsis |
| --- | --- |
| [Enable Or Disable External Mail](group/mail/enable-or-disable-external-mail.md) | Allow or block external senders for this Microsoft 365 group |
| [Show Or Hide In Address Book](group/mail/show-or-hide-in-address-book.md) | Show or hide this group in the address book |

<a name='group-teams'></a>
### Teams
| Runbook Name | Synopsis |
| --- | --- |
| [Archive Team](group/teams/archive-team.md) | Archive the team of this group |

<a name='org'></a>
## Organization
<a name='org-applications'></a>
### Applications
| Runbook Name | Synopsis |
| --- | --- |
| [Add Application Registration](org/applications/add-application-registration.md) | Create an application registration in Entra ID |
| [Add GSA Application Registration](org/applications/add-gsa-application-registration.md) | Create a Global Secure Access application with its access group |
| [Delete Application Registration](org/applications/delete-application-registration.md) | Delete an application registration and its service principal |
| [Delete GSA Application Registration](org/applications/delete-gsa-application-registration.md) | Delete a Global Secure Access application and its access group |
| [Export Enterprise Application Users](org/applications/export-enterprise-application-users.md) | Export the owners and users of all enterprise applications |
| [List Inactive Enterprise Applications](org/applications/list-inactive-enterprise-applications.md) | List enterprise applications with no recent sign-ins |
| [Report Application Registration](org/applications/report-application-registration.md) | Report all application registrations, including deleted ones |
| [Report Expiring Application Credentials (Scheduled)](org/applications/report-expiring-application-credentials_scheduled.md) | Report expiring client secrets and certificates of app registrations |
| [Update Application Registration](org/applications/update-application-registration.md) | Update redirect URIs, SAML and sign-in settings of an app registration |

<a name='org-collab'></a>
### Collab
| Runbook Name | Synopsis |
| --- | --- |
| [Check Onedrive Status](org/collab/check-onedrive-status.md) | Check whether a user's OneDrive is active, locked or deleted |
| [List Sharepoint Sitecollection Permission](org/collab/list-sharepoint-sitecollection-permission.md) | List the administrators and members of a SharePoint site |
| [Report Sharepoint Tenant Storage (Scheduled)](org/collab/report-sharepoint-tenant-storage_scheduled.md) | Monitor SharePoint storage and alert when limits are exceeded |
| [Report Teams Channels (Scheduled)](org/collab/report-teams-channels_scheduled.md) | List private and shared channels of all teams with their owners |

<a name='org-devices'></a>
### Devices
| Runbook Name | Synopsis |
| --- | --- |
| [Add Autopilot Device](org/devices/add-autopilot-device.md) | Register a Windows device in Windows Autopilot |
| [Add Device Via Corporate Identifier](org/devices/add-device-via-corporate-identifier.md) | Register a device in Intune by its corporate identifier |
| [Auto Approve Driver Updates (Scheduled)](org/devices/auto-approve-driver-updates_scheduled.md) | Approve pending driver updates in Intune driver update policies |
| [Cleanup Autopilot Devices (Scheduled)](org/devices/cleanup-autopilot-devices_scheduled.md) | Remove orphaned and never-enrolled Autopilot registrations |
| [Create Endpoint Analytics Baseline](org/devices/create-endpoint-analytics-baseline.md) | Create an Endpoint Analytics baseline with a naming schema |
| [Dedup Device Names (Scheduled)](org/devices/dedup-device-names_scheduled.md) | Rename Intune devices that share a display name |
| [Delete Stale Devices (Scheduled)](org/devices/delete-stale-devices_scheduled.md) | Delete Intune devices that have been inactive for too long |
| [Get Bitlocker Recovery Key](org/devices/get-bitlocker-recovery-key.md) | Look up a BitLocker recovery key by its key ID |
| [List Mobile Devices](org/devices/list-mobile-devices.md) | List managed mobile devices with inventory and network details |
| [Notify Users About Low Diskspace (Scheduled)](org/devices/notify-users-about-low-diskspace_scheduled.md) | Email users whose devices are running out of disk space |
| [Notify Users About Stale Devices (Scheduled)](org/devices/notify-users-about-stale-devices_scheduled.md) | Email users about devices they have not used for a while |
| [Outphase Devices](org/devices/outphase-devices.md) | Wipe and clean up several devices at once |
| [Rename Devices By Group Tag (Scheduled)](org/devices/rename-devices-by-group-tag_scheduled.md) | Name Autopilot devices after their group tag and serial number |
| [Report Devices Low Diskspace (Scheduled)](org/devices/report-devices-low-diskspace_scheduled.md) | Report devices that are running out of disk space |
| [Report Devices Without Primary User (Scheduled)](org/devices/report-devices-without-primary-user_scheduled.md) | Report Intune devices without a primary user |
| [Report Primary User Mismatch (Scheduled)](org/devices/report-primary-user-mismatch_scheduled.md) | Compare primary users and logons between Intune and RealmJoin |
| [Report Realmjoin Agent Contact (Scheduled)](org/devices/report-realmjoin-agent-contact_scheduled.md) | Report devices whose RealmJoin agent stopped reporting |
| [Report Stale Devices (Scheduled)](org/devices/report-stale-devices_scheduled.md) | Report devices that have been inactive for too long |
| [Report Users With More Than 5-Devices (Scheduled)](org/devices/report-users-with-more-than-5-devices_scheduled.md) | Report users with more than five registered devices |
| [Report Windows Devices Without Autopilot (Scheduled)](org/devices/report-windows-devices-without-autopilot_scheduled.md) | Report Windows devices in Entra ID without an Autopilot record |
| [Sync Device Serialnumbers To Entraid (Scheduled)](org/devices/sync-device-serialnumbers-to-entraid_scheduled.md) | Copy Intune serial numbers into an Entra ID extension attribute |

<a name='org-general'></a>
### General
| Runbook Name | Synopsis |
| --- | --- |
| [Add Devices Of Users To Group (Scheduled)](org/general/add-devices-of-users-to-group_scheduled.md) | Add the devices of a user group's members to a device group |
| [Add Management Partner](org/general/add-management-partner.md) | List or add a Partner Admin Link (PAL) for the tenant |
| [Add Microsoft Store App Logos](org/general/add-microsoft-store-app-logos.md) | Add missing logos to Microsoft Store apps in Intune |
| [Add Office365 Group](org/general/add-office365-group.md) | Create a Microsoft 365 group, optionally with a team |
| [Add Or Remove Safelinks Exclusion](org/general/add-or-remove-safelinks-exclusion.md) | Allow a URL pattern in a Safe Links policy or remove it |
| [Add Or Remove Smartscreen Exclusion](org/general/add-or-remove-smartscreen-exclusion.md) | Allow, warn or block a URL in Defender SmartScreen |
| [Add Or Remove Trusted Site](org/general/add-or-remove-trusted-site.md) | Add a URL to the Intune trusted sites list or remove it |
| [Add Primary Users Of Devices To Group (Scheduled)](org/general/add-primary-users-of-devices-to-group_scheduled.md) | Keep a group in sync with the primary users of Intune devices |
| [Add Security Group](org/general/add-security-group.md) | Create a security group in Entra ID |
| [Add User](org/general/add-user.md) | Create a new user account in Entra ID |
| [Add Viva Engange Community](org/general/add-viva-engange-community.md) | Create a Viva Engage community with owners |
| [Assign Groups By Template (Scheduled)](org/general/assign-groups-by-template_scheduled.md) | Add the users of a group to a predefined set of groups |
| [Bulk Delete Devices From Autopilot](org/general/bulk-delete-devices-from-autopilot.md) | Delete several Autopilot registrations by serial number |
| [Bulk Retire Devices From Intune](org/general/bulk-retire-devices-from-intune.md) | Retire several Intune devices by serial number |
| [Check Aad Sync Status (Scheduled)](org/general/check-aad-sync-status_scheduled.md) | Check the last Entra Connect sync and alert when it is off |
| [Check Assignments Of Devices](org/general/check-assignments-of-devices.md) | Show which Intune policies and apps target given devices |
| [Check Assignments Of Groups](org/general/check-assignments-of-groups.md) | Show which Intune policies and apps target given groups |
| [Check Assignments Of Users](org/general/check-assignments-of-users.md) | Show which Intune policies and apps target given users |
| [Check Autopilot Serialnumbers](org/general/check-autopilot-serialnumbers.md) | Check which serial numbers are registered in Autopilot |
| [Check Device Onboarding Exclusion (Scheduled)](org/general/check-device-onboarding-exclusion_scheduled.md) | Keep unenrolled Autopilot devices in a compliance exclusion group |
| [Enrolled Devices Report (Scheduled)](org/general/enrolled-devices-report_scheduled.md) | Report first-time device enrollments of the last weeks |
| [Export All Autopilot Devices](org/general/export-all-autopilot-devices.md) | List or export all Windows Autopilot devices |
| [Export All Intune Devices](org/general/export-all-intune-devices.md) | Export all Intune devices with their primary users' usage location |
| [Export Cloudpc Usage (Scheduled)](org/general/export-cloudpc-usage_scheduled.md) | Write daily Windows 365 usage data to an Azure table |
| [Export Non Compliant Devices](org/general/export-non-compliant-devices.md) | Export non-compliant Intune devices with their failing settings |
| [Export Policy Report](org/general/export-policy-report.md) | Export Intune and Entra ID policies as a Markdown report |
| [Invite External Guest Users](org/general/invite-external-guest-users.md) | Invite an external person as a guest user |
| [List All Administrative Template Policies](org/general/list-all-administrative-template-policies.md) | List administrative template policies with their assignments |
| [List Group License Assignment Errors](org/general/list-group-license-assignment-errors.md) | List groups whose license assignments have errors |
| [Monitor Service Health (Scheduled)](org/general/monitor-service-health_scheduled.md) | Alert by email about new Microsoft 365 service health issues |
| [Office365 License Report](org/general/office365-license-report.md) | Report Microsoft 365 license usage and availability |
| [Report Apple MDM Cert Expiry (Scheduled)](org/general/report-apple-mdm-cert-expiry_scheduled.md) | Alert before Apple MDM certificates and tokens expire |
| [Report Intune Enrollment Readiness](org/general/report-intune-enrollment-readiness.md) | Report which users can enroll devices in Intune |
| [Report License Assignment (Scheduled)](org/general/report-license-assignment_scheduled.md) | Alert when license availability crosses thresholds |
| [Report Pim Activations (Scheduled)](org/general/report-pim-activations_scheduled.md) | Report the PIM role activations of the last month by email |
| [Sync All Devices](org/general/sync-all-devices.md) | Trigger an Intune sync on all Windows devices |
| [Sync Apple Tokens](org/general/sync-apple-tokens.md) | Sync Apple enrollment and VPP tokens with Intune |
| [Sync Channel Or Group Members (Scheduled)](org/general/sync-channel-or-group-members_scheduled.md) | Mirror members between a Teams shared channel and a group |
| [Sync Shared Channel Owners (Scheduled)](org/general/sync-shared-channel-owners_scheduled.md) | Make a group's members owners of mapped teams and shared channels |

<a name='org-mail'></a>
### Mail
| Runbook Name | Synopsis |
| --- | --- |
| [Add Distribution List](org/mail/add-distribution-list.md) | Create a classic Exchange Online distribution group |
| [Add Equipment Mailbox](org/mail/add-equipment-mailbox.md) | Create an equipment mailbox with optional booking delegates |
| [Add Mail Contact](org/mail/add-mail-contact.md) | Create a mail contact for an external address |
| [Add Or Remove Public Folder](org/mail/add-or-remove-public-folder.md) | Create or remove an Exchange Online public folder |
| [Add Or Remove Teams Mailcontact](org/mail/add-or-remove-teams-mailcontact.md) | Give a Teams channel a friendly email address or remove it |
| [Add Or Remove Tenant Allow Block List](org/mail/add-or-remove-tenant-allow-block-list.md) | Add or remove a Tenant Allow/Block List entry |
| [Add Room Mailbox](org/mail/add-room-mailbox.md) | Create a room mailbox with optional booking delegates |
| [Add Shared Mailbox](org/mail/add-shared-mailbox.md) | Create a shared mailbox with optional delegate |
| [Hide Mailboxes (Scheduled)](org/mail/hide-mailboxes_scheduled.md) | Hide or show all Bookings calendars in the address book |
| [Set Booking Config](org/mail/set-booking-config.md) | Configure the Microsoft Bookings settings of the tenant |

<a name='org-phone'></a>
### Phone
| Runbook Name | Synopsis |
| --- | --- |
| [Add Or Remove Call Queue Agents](org/phone/add-or-remove-call-queue-agents.md) | Add or remove agents of a Teams call queue |
| [Add Or Remove Call Queue Authorized Users](org/phone/add-or-remove-call-queue-authorized-users.md) | Add or remove authorized users of a Teams call queue |
| [Get Teams Phone Number Assignment](org/phone/get-teams-phone-number-assignment.md) | Check whether a phone number is assigned in Microsoft Teams |

<a name='org-security'></a>
### Security
| Runbook Name | Synopsis |
| --- | --- |
| [Add Defender Indicator](org/security/add-defender-indicator.md) | Add an allow or block indicator to Defender for Endpoint |
| [Backup Conditional Access Policies](org/security/backup-conditional-access-policies.md) | Back up all Conditional Access policies to Azure Storage |
| [Find SMS Auth Phone Number](org/security/find-sms-auth-phone-number.md) | Find the user who holds an SMS sign-in phone number |
| [List Admin Users](org/security/list-admin-users.md) | List all Entra ID admins and check their MFA methods |
| [List Expiring Role Assignments](org/security/list-expiring-role-assignments.md) | List Entra ID role assignments that expire soon |
| [List Inactive Devices](org/security/list-inactive-devices.md) | List devices with no recent sign-in or Intune sync |
| [List Inactive Users](org/security/list-inactive-users.md) | List users with no recent interactive sign-in |
| [List Information Protection Labels](org/security/list-information-protection-labels.md) | List the sensitivity labels of the tenant with their IDs |
| [List Pim Rolegroups Without Owners (Scheduled)](org/security/list-pim-rolegroups-without-owners_scheduled.md) | Alert on PIM role groups that have no owner |
| [List Users By MFA Methods Count](org/security/list-users-by-mfa-methods-count.md) | List users by how many MFA methods they registered |
| [List Vulnerable App Regs](org/security/list-vulnerable-app-regs.md) | List app registrations possibly affected by CVE-2021-42306 |
| [Monitor Pending EPM Requests (Scheduled)](org/security/monitor-pending-epm-requests_scheduled.md) | Alert by email about pending EPM elevation requests |
| [Notify Changed CA Policies](org/security/notify-changed-ca-policies.md) | Alert by email about Conditional Access policy changes |
| [Report EPM Elevation Requests (Scheduled)](org/security/report-epm-elevation-requests_scheduled.md) | Report EPM elevation requests by status and age |
| [Sync MFA Secure Users To Group (Scheduled)](org/security/sync-mfa-secure-users-to-group_scheduled.md) | Keep a group filled with users who registered a secure MFA method |

<a name='user'></a>
## User
<a name='user-avd'></a>
### AVD
| Runbook Name | Synopsis |
| --- | --- |
| [User Signout](user/avd/user-signout.md) | Sign this user out of their AVD sessions |

<a name='user-collab'></a>
### Collab
| Runbook Name | Synopsis |
| --- | --- |
| [Pre Provision Onedrive](user/collab/pre-provision-onedrive.md) | Pre-provision the OneDrive of a user |

<a name='user-general'></a>
### General
| Runbook Name | Synopsis |
| --- | --- |
| [Assign Groups By Template](user/general/assign-groups-by-template.md) | Add this user to a predefined set of groups |
| [Assign Or Unassign License](user/general/assign-or-unassign-license.md) | Assign or remove a license for this user via a license group |
| [Assign Windows365](user/general/assign-windows365.md) | Provision a Windows 365 Cloud PC for this user |
| [Check Intune Enrollment Readiness](user/general/check-intune-enrollment-readiness.md) | Check whether this user can enroll devices in Intune |
| [List Group Memberships](user/general/list-group-memberships.md) | List the group memberships of this user |
| [List Group Ownerships](user/general/list-group-ownerships.md) | List the groups this user owns |
| [List Manager](user/general/list-manager.md) | Show the manager of this user |
| [Offboard User Permanently](user/general/offboard-user-permanently.md) | Permanently offboard this user |
| [Offboard User Temporarily](user/general/offboard-user-temporarily.md) | Temporarily offboard this user |
| [Reprovision Windows365](user/general/reprovision-windows365.md) | Reprovision the Windows 365 Cloud PC of this user |
| [Resize Windows365](user/general/resize-windows365.md) | Resize the Windows 365 Cloud PC of this user |
| [Unassign Windows365](user/general/unassign-windows365.md) | Remove the Windows 365 Cloud PC of this user |

<a name='user-mail'></a>
### Mail
| Runbook Name | Synopsis |
| --- | --- |
| [Add Or Remove Email Address](user/mail/add-or-remove-email-address.md) | Add an email address to this user's mailbox or remove one |
| [Assign Owa Mailbox Policy](user/mail/assign-owa-mailbox-policy.md) | Assign an Outlook on the web policy to this user's mailbox |
| [Convert To Shared Mailbox](user/mail/convert-to-shared-mailbox.md) | Convert this user's mailbox to a shared mailbox or back |
| [Delegate Full Access](user/mail/delegate-full-access.md) | Grant or remove full access to this user's mailbox |
| [Delegate Send As](user/mail/delegate-send-as.md) | Grant or remove Send As permission on this user's mailbox |
| [Delegate Send On Behalf](user/mail/delegate-send-on-behalf.md) | Grant or remove Send on Behalf permission on this user's mailbox |
| [Hide Or Unhide In Addressbook](user/mail/hide-or-unhide-in-addressbook.md) | Hide this user's mailbox in the address book or show it |
| [List Mailbox Permissions](user/mail/list-mailbox-permissions.md) | List who has access to this user's mailbox |
| [List Room Mailbox Configuration](user/mail/list-room-mailbox-configuration.md) | Show the booking configuration of this room mailbox |
| [Manage Archive Mailbox](user/mail/manage-archive-mailbox.md) | Enable, disable or check the archive mailbox of this user |
| [Remove Mailbox](user/mail/remove-mailbox.md) | Permanently delete this shared mailbox, room or Bookings calendar |
| [Set Out Of Office](user/mail/set-out-of-office.md) | Set or remove automatic replies for this user |
| [Set Room Mailbox Configuration](user/mail/set-room-mailbox-configuration.md) | Configure the booking rules and booking delegates of this room mailbox |

<a name='user-phone'></a>
### Phone
| Runbook Name | Synopsis |
| --- | --- |
| [Disable Teams Phone](user/phone/disable-teams-phone.md) | Remove Teams phone number and voice policies from this user |
| [Get Teams User Info](user/phone/get-teams-user-info.md) | Show the Teams voice setup of this user |
| [Grant Teams User Policies](user/phone/grant-teams-user-policies.md) | Assign Teams voice and meeting policies to this user |
| [Set Teams Permanent Call Forwarding](user/phone/set-teams-permanent-call-forwarding.md) | Forward this user's calls immediately or turn forwarding off |
| [Set Teams Phone](user/phone/set-teams-phone.md) | Assign a phone number and voice policies to this user |

<a name='user-security'></a>
### Security
| Runbook Name | Synopsis |
| --- | --- |
| [Confirm Or Dismiss Risky User](user/security/confirm-or-dismiss-risky-user.md) | Confirm this user as compromised or dismiss the risk |
| [Create Temporary Access Pass](user/security/create-temporary-access-pass.md) | Create a Temporary Access Pass for this user |
| [Enable Or Disable Password Expiration](user/security/enable-or-disable-password-expiration.md) | Turn password expiration on or off for this user |
| [List MFA Methods](user/security/list-mfa-methods.md) | List the MFA and authentication methods of this user |
| [List Signin Events](user/security/list-signin-events.md) | Show the recent sign-ins of this user and their failures |
| [Reset MFA](user/security/reset-mfa.md) | Remove this user's app, phone, OATH and FIDO2 MFA methods |
| [Reset Password](user/security/reset-password.md) | Set a new password for this user |
| [Revoke Or Restore Access](user/security/revoke-or-restore-access.md) | Block this user's sign-in and sessions, or restore access |
| [Set Or Remove Mobile Phone MFA](user/security/set-or-remove-mobile-phone-mfa.md) | Set or remove the mobile phone MFA method of this user |

<a name='user-userinfo'></a>
### Userinfo
| Runbook Name | Synopsis |
| --- | --- |
| [Rename User](user/userinfo/rename-user.md) | Change this user's sign-in name (UPN) and mailbox alias |
| [Set Photo](user/userinfo/set-photo.md) | Set the profile photo of this user from a URL |
| [Update User](user/userinfo/update-user.md) | Update profile details, groups and mailbox settings of this user |

