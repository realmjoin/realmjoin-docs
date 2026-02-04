---
title: User
---

# User Runbooks

This folder contains runbooks for user management and operations.

## Runbooks by Category

### AVD

- [User Signout](avd/user-signout.md) - Removes (Signs Out) a specific User from their AVD Session.

### General

- [Assign Groups By Template](general/assign-groups-by-template.md) - Assign cloud-only groups to a user based on a predefined template.
- [Assign Or Unassign License](general/assign-or-unassign-license.md) - (Un-)Assign a license to a user via group membership.
- [Assign Windows365](general/assign-windows365.md) - Assign/Provision a Windows 365 instance
- [List Group Memberships](general/list-group-memberships.md) - List group memberships for this user.
- [List Group Ownerships](general/list-group-ownerships.md) - List group ownerships for this user.
- [List Manager](general/list-manager.md) - List manager information for this user.
- [Offboard User Permanently](general/offboard-user-permanently.md) - Permanently offboard a user.
- [Offboard User Temporarily](general/offboard-user-temporarily.md) - Temporarily offboard a user.
- [Reprovision Windows365](general/reprovision-windows365.md) - Reprovision a Windows 365 Cloud PC
- [Resize Windows365](general/resize-windows365.md) - Resize a Windows 365 Cloud PC
- [Unassign Windows365](general/unassign-windows365.md) - Remove/Deprovision a Windows 365 instance

### Mail

- [Add Or Remove Email Address](mail/add-or-remove-email-address.md) - Add/remove eMail address to/from mailbox.
- [Assign Owa Mailbox Policy](mail/assign-owa-mailbox-policy.md) - Assign a given OWA mailbox policy to a user.
- [Convert To Shared Mailbox](mail/convert-to-shared-mailbox.md) - Turn this users mailbox into a shared mailbox.
- [Delegate Full Access](mail/delegate-full-access.md) - Grant another user full access to this mailbox.
- [Delegate Send As](mail/delegate-send-as.md) - Grant another user sendAs permissions on this mailbox.
- [Delegate Send On Behalf](mail/delegate-send-on-behalf.md) - Grant another user sendOnBehalf permissions on this mailbox.
- [Hide Or Unhide In Addressbook](mail/hide-or-unhide-in-addressbook.md) - (Un)Hide this mailbox in address book.
- [List Mailbox Permissions](mail/list-mailbox-permissions.md) - List permissions on a (shared) mailbox.
- [List Room Mailbox Configuration](mail/list-room-mailbox-configuration.md) - List Room configuration.
- [Remove Mailbox](mail/remove-mailbox.md) - Hard delete a shared mailbox, room or bookings calendar.
- [Set Out Of Office](mail/set-out-of-office.md) - En-/Disable Out-of-office-notifications for a user/mailbox.
- [Set Room Mailbox Configuration](mail/set-room-mailbox-configuration.md) - Set room resource policies.

### Phone

- [Disable Teams Phone](phone/disable-teams-phone.md) - Microsoft Teams telephony offboarding
- [Get Teams User Info](phone/get-teams-user-info.md) - Get the status quo of a Microsoft Teams user in terms of phone number, if any, and certain Microsoft Teams policies.
- [Grant Teams User Policies](phone/grant-teams-user-policies.md) - Grant specific Microsoft Teams policies to a Microsoft Teams enabled user.
- [Set Teams Permanent Call Forwarding](phone/set-teams-permanent-call-forwarding.md) - Set up immediate call forwarding for a Microsoft Teams Enterprise Voice user.
- [Set Teams Phone](phone/set-teams-phone.md) - Assign a phone number to a Microsoft Teams enabled user, enable calling and Grant specific Microsoft Teams policies.

### Security

- [Confirm Or Dismiss Risky User](security/confirm-or-dismiss-risky-user.md) - Confirm compromise / Dismiss a "risky user"
- [Create Temporary Access Pass](security/create-temporary-access-pass.md) - Create an AAD temporary access pass for a user.
- [Enable Or Disable Password Expiration](security/enable-or-disable-password-expiration.md) - Set a users password policy to "(Do not) Expire"
- [Reset Mfa](security/reset-mfa.md) - Remove all App- and Mobilephone auth methods for a user.
- [Reset Password](security/reset-password.md) - Reset a user's password.
- [Revoke Or Restore Access](security/revoke-or-restore-access.md) - Revoke user access and all active tokens or re-enable user.
- [Set Or Remove Mobile Phone Mfa](security/set-or-remove-mobile-phone-mfa.md) - Add, update or remove a user's mobile phone MFA information.

### Userinfo

- [Rename User](userinfo/rename-user.md) - Rename a user or mailbox. Will not update metadata like DisplayName, GivenName, Surname.
- [Set Photo](userinfo/set-photo.md) - Set / update the photo / avatar picture of a user.
- [Update User](userinfo/update-user.md) - Update/Finalize an existing user object.

## Summary

Total runbooks in this category: **39**

### Breakdown by Subcategory

- **AVD**: 1 runbooks
- **General**: 11 runbooks
- **Mail**: 12 runbooks
- **Phone**: 5 runbooks
- **Security**: 7 runbooks
- **Userinfo**: 3 runbooks
