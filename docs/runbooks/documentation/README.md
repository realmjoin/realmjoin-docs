# RealmJoin Runbooks Documentation

The runbooks are organized into different folders based on their area of application.

The following categories are currently available:
- device
- group
- org
- user

Each category contains multiple runbooks that are further divided into subcategories based on their functionality. The runbooks are listed in alphabetical order within each subcategory.

# RealmJoin runbook overview

In the following, each runbook is listed along with a brief description or synopsis to give a clear understanding of its purpose and functionality.
Also the document for each runbook contains information about permissions, where to find, notes, and parameters and further information in general.

## Table of contents

- [Device](device/README.md)

  - [Avd](device/README.md#device-avd)

    - [Restart Host](device/avd/Restart-Host.md)
    - [Toggle Drain Mode](device/avd/Toggle-Drain-Mode.md)

  - [General](device/README.md#device-general)

    - [Change Grouptag](device/general/Change-Grouptag.md)
    - [Check Updatable Assets](device/general/Check-Updatable-Assets.md)
    - [Enroll Updatable Assets](device/general/Enroll-Updatable-Assets.md)
    - [Outphase Device](device/general/Outphase-Device.md)
    - [Remove Primary User](device/general/Remove-Primary-User.md)
    - [Rename Device](device/general/Rename-Device.md)
    - [Unenroll Updatable Assets](device/general/Unenroll-Updatable-Assets.md)
    - [Wipe Device](device/general/Wipe-Device.md)

  - [Security](device/README.md#device-security)

    - [Enable Or Disable Device](device/security/Enable-Or-Disable-Device.md)
    - [Isolate Or Release Device](device/security/Isolate-Or-Release-Device.md)
    - [Reset Mobile Device Pin](device/security/Reset-Mobile-Device-Pin.md)
    - [Restrict Or Release Code Execution](device/security/Restrict-Or-Release-Code-Execution.md)
    - [Show Laps Password](device/security/Show-Laps-Password.md)

- [Group](group/README.md)

  - [Devices](group/README.md#group-devices)

    - [Check Updatable Assets](group/devices/Check-Updatable-Assets.md)
    - [Unenroll Updatable Assets](group/devices/Unenroll-Updatable-Assets.md)

  - [General](group/README.md#group-general)

    - [Add Or Remove Nested Group](group/general/Add-Or-Remove-Nested-Group.md)
    - [Add Or Remove Owner](group/general/Add-Or-Remove-Owner.md)
    - [Add Or Remove User](group/general/Add-Or-Remove-User.md)
    - [Change Visibility](group/general/Change-Visibility.md)
    - [List All Members](group/general/List-All-Members.md)
    - [List Owners](group/general/List-Owners.md)
    - [List User Devices](group/general/List-User-Devices.md)
    - [Remove Group](group/general/Remove-Group.md)
    - [Rename Group](group/general/Rename-Group.md)

  - [Mail](group/README.md#group-mail)

    - [Enable Or Disable External Mail](group/mail/Enable-Or-Disable-External-Mail.md)
    - [Show Or Hide In Address Book](group/mail/Show-Or-Hide-In-Address-Book.md)

  - [Teams](group/README.md#group-teams)

    - [Archive Team](group/teams/Archive-Team.md)

- [Org](org/README.md)

  - [Devices](org/README.md#org-devices)

    - [Delete Stale Devices_Scheduled](org/devices/Delete-Stale-Devices_Scheduled.md)
    - [Get Bitlocker Recovery Key](org/devices/Get-Bitlocker-Recovery-Key.md)
    - [List Stale Devices_Scheduled](org/devices/List-Stale-Devices_Scheduled.md)
    - [Outphase Devices](org/devices/Outphase-Devices.md)
    - [Report Devices Without Primary User](org/devices/Report-Devices-Without-Primary-User.md)
    - [Report Last Device Contact By Range](org/devices/Report-Last-Device-Contact-By-Range.md)
    - [Report Users With More Than 5-Devices](org/devices/Report-Users-With-More-Than-5-Devices.md)
    - [Sync Device Serialnumbers To Entraid_Scheduled](org/devices/Sync-Device-Serialnumbers-To-Entraid_Scheduled.md)

  - [General](org/README.md#org-general)

    - [Add Application Registration](org/general/Add-Application-Registration.md)
    - [Add Autopilot Device](org/general/Add-Autopilot-Device.md)
    - [Add Device Via Corporate Identifier](org/general/Add-Device-Via-Corporate-Identifier.md)
    - [Add Devices Of Users To Group_Scheduled](org/general/Add-Devices-Of-Users-To-Group_Scheduled.md)
    - [Add Management Partner](org/general/Add-Management-Partner.md)
    - [Add Microsoft Store App Logos](org/general/Add-Microsoft-Store-App-Logos.md)
    - [Add Office365 Group](org/general/Add-Office365-Group.md)
    - [Add Or Remove Safelinks Exclusion](org/general/Add-Or-Remove-Safelinks-Exclusion.md)
    - [Add Or Remove Smartscreen Exclusion](org/general/Add-Or-Remove-Smartscreen-Exclusion.md)
    - [Add Or Remove Trusted Site](org/general/Add-Or-Remove-Trusted-Site.md)
    - [Add Security Group](org/general/Add-Security-Group.md)
    - [Add User](org/general/Add-User.md)
    - [Add Viva Engange Community](org/general/Add-Viva-Engange-Community.md)
    - [Assign Groups By Template_Scheduled](org/general/Assign-Groups-By-Template_Scheduled.md)
    - [Bulk Delete Devices From Autopilot](org/general/Bulk-Delete-Devices-From-Autopilot.md)
    - [Bulk Retire Devices From Intune](org/general/Bulk-Retire-Devices-From-Intune.md)
    - [Check Aad Sync Status_Scheduled](org/general/Check-Aad-Sync-Status_Scheduled.md)
    - [Check Assignments Of Devices](org/general/Check-Assignments-Of-Devices.md)
    - [Check Assignments Of Groups](org/general/Check-Assignments-Of-Groups.md)
    - [Check Assignments Of Users](org/general/Check-Assignments-Of-Users.md)
    - [Check Autopilot Serialnumbers](org/general/Check-Autopilot-Serialnumbers.md)
    - [Check Device Onboarding Exclusion_Schedule](org/general/Check-Device-Onboarding-Exclusion_Schedule.md)
    - [Enrolled Devices Report_Scheduled](org/general/Enrolled-Devices-Report_Scheduled.md)
    - [Export All Autopilot Devices](org/general/Export-All-Autopilot-Devices.md)
    - [Export All Intune Devices](org/general/Export-All-Intune-Devices.md)
    - [Export Cloudpc Usage_Scheduled](org/general/Export-Cloudpc-Usage_Scheduled.md)
    - [Export Non Compliant Devices](org/general/Export-Non-Compliant-Devices.md)
    - [Export Policy Report](org/general/Export-Policy-Report.md)
    - [Invite External Guest Users](org/general/Invite-External-Guest-Users.md)
    - [List All Administrative Template Policies](org/general/List-All-Administrative-Template-Policies.md)
    - [List Group License Assignment Errors](org/general/List-Group-License-Assignment-Errors.md)
    - [Office365 License Report](org/general/Office365-License-Report.md)
    - [Report Apple Mdm Cert Expiry_Scheduled](org/general/Report-Apple-Mdm-Cert-Expiry_Scheduled.md)
    - [Report Pim Activations_Scheduled](org/general/Report-Pim-Activations_Scheduled.md)
    - [Sync All Devices](org/general/Sync-All-Devices.md)

  - [Mail](org/README.md#org-mail)

    - [Add Distribution List](org/mail/Add-Distribution-List.md)
    - [Add Equipment Mailbox](org/mail/Add-Equipment-Mailbox.md)
    - [Add Or Remove Public Folder](org/mail/Add-Or-Remove-Public-Folder.md)
    - [Add Or Remove Teams Mailcontact](org/mail/Add-Or-Remove-Teams-Mailcontact.md)
    - [Add Room Mailbox](org/mail/Add-Room-Mailbox.md)
    - [Add Shared Mailbox](org/mail/Add-Shared-Mailbox.md)
    - [Hide Mailboxes_Scheduled](org/mail/Hide-Mailboxes_Scheduled.md)
    - [Set Booking Config](org/mail/Set-Booking-Config.md)

  - [Phone](org/README.md#org-phone)

    - [Get Teams Phone Number Assignment](org/phone/Get-Teams-Phone-Number-Assignment.md)

  - [Security](org/README.md#org-security)

    - [Add Defender Indicator](org/security/Add-Defender-Indicator.md)
    - [Backup Conditional Access Policies](org/security/Backup-Conditional-Access-Policies.md)
    - [Export Enterprise App Users](org/security/Export-Enterprise-App-Users.md)
    - [List Admin Users](org/security/List-Admin-Users.md)
    - [List Application Creds Expiry](org/security/List-Application-Creds-Expiry.md)
    - [List Expiring Role Assignments](org/security/List-Expiring-Role-Assignments.md)
    - [List Inactive Devices](org/security/List-Inactive-Devices.md)
    - [List Inactive Enterprise Apps](org/security/List-Inactive-Enterprise-Apps.md)
    - [List Inactive Users](org/security/List-Inactive-Users.md)
    - [List Information Protection Labels](org/security/List-Information-Protection-Labels.md)
    - [List Pim Rolegroups Without Owners_Scheduled](org/security/List-Pim-Rolegroups-Without-Owners_Scheduled.md)
    - [List Users By MFA Methods Count](org/security/List-Users-By-MFA-Methods-Count.md)
    - [List Vulnerable App Regs](org/security/List-Vulnerable-App-Regs.md)
    - [Notify Changed CA Policies](org/security/Notify-Changed-CA-Policies.md)

- [User](user/README.md)

  - [Avd](user/README.md#user-avd)

    - [User Signout](user/avd/User-Signout.md)

  - [General](user/README.md#user-general)

    - [Assign Groups By Template](user/general/Assign-Groups-By-Template.md)
    - [Assign Or Unassign License](user/general/Assign-Or-Unassign-License.md)
    - [Assign Windows365](user/general/Assign-Windows365.md)
    - [List Group Ownerships](user/general/List-Group-Ownerships.md)
    - [List Manager](user/general/List-Manager.md)
    - [Offboard User Permanently](user/general/Offboard-User-Permanently.md)
    - [Offboard User Temporarily](user/general/Offboard-User-Temporarily.md)
    - [Reprovision Windows365](user/general/Reprovision-Windows365.md)
    - [Resize Windows365](user/general/Resize-Windows365.md)
    - [Unassign Windows365](user/general/Unassign-Windows365.md)

  - [Mail](user/README.md#user-mail)

    - [Add Or Remove Email Address](user/mail/Add-Or-Remove-Email-Address.md)
    - [Assign Owa Mailbox Policy](user/mail/Assign-Owa-Mailbox-Policy.md)
    - [Convert To Shared Mailbox](user/mail/Convert-To-Shared-Mailbox.md)
    - [Delegate Full Access](user/mail/Delegate-Full-Access.md)
    - [Delegate Send As](user/mail/Delegate-Send-As.md)
    - [Delegate Send On Behalf](user/mail/Delegate-Send-On-Behalf.md)
    - [Hide Or Unhide In Addressbook](user/mail/Hide-Or-Unhide-In-Addressbook.md)
    - [List Mailbox Permissions](user/mail/List-Mailbox-Permissions.md)
    - [List Room Mailbox Configuration](user/mail/List-Room-Mailbox-Configuration.md)
    - [Remove Mailbox](user/mail/Remove-Mailbox.md)
    - [Set Out Of Office](user/mail/Set-Out-Of-Office.md)
    - [Set Room Mailbox Configuration](user/mail/Set-Room-Mailbox-Configuration.md)

  - [Phone](user/README.md#user-phone)

    - [Disable Teams Phone](user/phone/Disable-Teams-Phone.md)
    - [Get Teams User Info](user/phone/Get-Teams-User-Info.md)
    - [Grant Teams User Policies](user/phone/Grant-Teams-User-Policies.md)
    - [Set Teams Permanent Call Forwarding](user/phone/Set-Teams-Permanent-Call-Forwarding.md)
    - [Set Teams Phone](user/phone/Set-Teams-Phone.md)

  - [Security](user/README.md#user-security)

    - [Confirm Or Dismiss Risky User](user/security/Confirm-Or-Dismiss-Risky-User.md)
    - [Create Temporary Access Pass](user/security/Create-Temporary-Access-Pass.md)
    - [Enable Or Disable Password Expiration](user/security/Enable-Or-Disable-Password-Expiration.md)
    - [Reset Mfa](user/security/Reset-Mfa.md)
    - [Reset Password](user/security/Reset-Password.md)
    - [Revoke Or Restore Access](user/security/Revoke-Or-Restore-Access.md)
    - [Set Or Remove Mobile Phone Mfa](user/security/Set-Or-Remove-Mobile-Phone-Mfa.md)

  - [Userinfo](user/README.md#user-userinfo)

    - [Rename User](user/userinfo/Rename-User.md)
    - [Set Photo](user/userinfo/Set-Photo.md)
    - [Update User](user/userinfo/Update-User.md)

