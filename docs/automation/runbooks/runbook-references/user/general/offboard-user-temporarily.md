---
title: Offboard User Temporarily
description: Temporarily offboard a user.
---

## Description
Temporarily offboard a user in cases like parental leaves or sabaticals.

## Location
User → General → Offboard User Temporarily

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - User.ReadWrite.All
  - Group.ReadWrite.All
  - GroupMember.ReadWrite.All

### Permission notes
Azure IaaS: Contributor access on subscription or resource group used for the export

### RBAC roles
- User administrator


## Parameters
### UserName



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### RevokeAccess



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### DisableUser



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### exportResourceGroupName



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### exportStorAccountName



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### exportStorAccountLocation



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### exportStorAccountSKU



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### exportStorContainerGroupMembershipExports



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### exportGroupMemberships



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### ChangeLicensesSelector



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |

### ChangeGroupsSelector

"Change" and "Remove all" will both honour "groupToAdd"

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 0 |
| Type | Int32 |

### GroupToAdd



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### GroupsToRemovePrefix



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### RevokeGroupOwnership



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### ReplacementOwnerName

Who will take over group ownership if the offboarded user is the last remaining group owner? Will only be used if needed.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |


[Back to Table of Content](../../README.md)

