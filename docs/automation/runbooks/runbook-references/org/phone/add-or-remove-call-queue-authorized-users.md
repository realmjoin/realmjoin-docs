---
title: Add Or Remove Call Queue Authorized Users
description: Add or remove authorized users of a Teams call queue
---

## Description
Adds the selected users to the authorized users of a call queue or removes them. Authorized users can change the queue settings in the Teams app; Microsoft allows 15 of them per call queue. The Teams voice applications policy they need for that can be assigned or removed in the same run. Details on the checks and options are in the runbook documentation (docs.realmjoin.com).

## How it works

The call queue is looked up by its exact name. Upper and lower case do not matter. If no queue matches, the runbook lists similar names it found; if two queues share the same name, it stops and asks for unique names.

Before anything is changed, the runbook prints the current authorized users of the queue with their voice applications policy, then the planned change per selected user. A user who cannot be found in Microsoft Teams, is not a regular user account or is not enabled for Enterprise Voice is skipped with the reason and the remaining users are still processed. Users who are already authorized (when adding) or not authorized at all (when removing) are reported and left alone.

Microsoft allows 15 authorized users per call queue. If the selection would push the queue over that limit, the runbook stops before any change instead of applying part of it.

Call queues also keep a list of hidden authorized users. When an authorized user is removed, the runbook removes them from that list in the same write, so no entry is left dangling.

After the write, the call queue is read again and the resulting list is compared with the expected one. A mismatch is reported as a warning rather than an error, because the service applies the change asynchronously.

## Voice applications policy

Being an authorized user is only half of the permission. To actually change queue settings in the Teams app, the user also needs a Teams voice applications policy that allows call queue management. The Global policy usually does not, which is why the runbook warns about it when it adds an authorized user who has no policy of their own.

The policy field offers three options:

- **Leave the policy unchanged** does not touch any policy assignment.
- **Assign a voice applications policy** grants the named policy to every user that was added or was already authorized. The policy has to exist in the tenant; the name is checked before any change is made. A user who already uses that policy is reported and not touched again.
- **Remove the voice applications policy** resets the per-user assignment of every user that was taken off the list.

Assigning a policy is only offered together with adding users, removing one only together with removing users. The other two combinations are rejected right away, because they would change permissions in the opposite direction of the queue change.

A policy that reaches the user through a group policy assignment cannot be removed per user. The runbook reports the policy and the group instead, so the assignment can be changed where it comes from. If a user has both a direct and a group assignment, removing the direct one lets the group assignment take over; the runbook says so in the output.

Before removing a policy, the runbook scans all other call queues and auto attendants for that user. If the user is still an authorized user somewhere else, the policy is kept and the affected objects are named in a warning. The user is still removed from this call queue.

## Notes and limitations

Authorized users have to be enabled for Enterprise Voice, which in practice means a Teams Phone license. A freshly licensed user can take up to an hour to become visible to Teams PowerShell; until then the runbook reports them as not found.

Greetings and holiday call flows can be changed by authorized users directly in the Teams client. Changing call routing, membership or exception handling and viewing reports requires the Queues app, which needs a Teams Premium license for every user of the app. The runbook only grants the permission and does not check the licensing of the app.

Changes to authorized users and policy assignments are replicated by the service and can take a few minutes to show up in the Teams admin center and in the Teams client.

Whether an authorized user is hidden is only maintained, never changed on purpose. Use the Teams admin center to hide or unhide an authorized user.


## Location
Organization → Phone → Add Or Remove Call Queue Authorized Users

**Full Runbook name**

rjgit-org_phone_add-or-remove-call-queue-authorized-users

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>MicrosoftTeams (>= 7.9.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Organization.Read.All
    - *Required by the app-based Teams PowerShell sign-in (Connect-MicrosoftTeams -Identity) to read tenant info*

### RBAC roles
- Teams Administrator
  - *Required to run Get-CsCallQueue, Set-CsCallQueue, Get-CsAutoAttendant, Get-CsOnlineUser, Get-CsUserPolicyAssignment, Get-CsTeamsVoiceApplicationsPolicy and Grant-CsTeamsVoiceApplicationsPolicy via app-based Teams PowerShell*


## Parameters
### CallQueueName

Exact name of the call queue as it is shown in the Teams admin center. Upper and lower case do not matter.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Call queue name |

### UserIds

Users that are added to or removed from the list of authorized users. Several users can be picked at once; each one needs to be enabled for Teams Phone.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String[] |
| Portal display name | Users |

### Remove

Add users as authorized users puts them on the queue's authorized user list. Remove users as authorized users takes them off it again.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Add users as authorized users | false |
| Remove users as authorized users | true |

### VoiceApplicationsPolicyAction

Leave the policy unchanged touches no policy. Assign a voice applications policy grants the policy entered under "Policy name". Remove the voice applications policy resets a per-user assignment when the users are taken off the list.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | None |
| Type | String |
| Portal display name | Voice applications policy |

**Portal options**

| Portal option | Value |
| --- | --- |
| Leave the policy unchanged | None |
| Assign a voice applications policy | Assign |
| Remove the voice applications policy | Remove |

### VoiceApplicationsPolicyName

Voice applications policy to grant, named exactly as in the Teams admin center. Only used with "Assign a voice applications policy".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Policy name |



[Back to Runbook Reference overview](../../README.md)

