# Invite External Guest Users

Invites external guest users to the organization using Microsoft Graph.

## Description

This script automates the process of inviting external users as guests to the organization. Optionally, the invited user can be added to a specified group.

## Location

Org &rarr; General &rarr; Invite External Guest Users

## Notes

You need to setup proper RunbookCustomization in the RealmJoin Portal to use this script.
An example would be looking like this:
"rjgit-org_general_invite-external-guest-users": {
    "Parameters": {
        "InvitedUserEmail": {
            "DisplayName": "Invitee's email address",
            "Mandatory": true
        },
        "InvitedUserDisplayName": {
            "DisplayName": "Invitee's display name",
            "Mandatory": true
        },
        "CallerName": {
            "Hide": true
        },
        "GroupId": {
            "Hide": true,
            "DefaultValue": "00000000-0000-0000-0000-000000000000"
        }
    }
}

## Permissions

### API Permissions

**Microsoft Graph**
- User.ReadWrite.All
- Group.ReadWrite.All

## Parameters

### -InvitedUserEmail

**Description:** The email address of the guest user to invite. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -InvitedUserDisplayName

**Description:** The display name for the guest user. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _2_ |

### -GroupId

**Description:** The object ID of the group to add the guest user to.
If not specified, the user will not be added to any group. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _3_ |


