---
title: Add Devices Of Users To Group (Scheduled)
description: Sync devices of users in a specific group to another device group.
---

## Description
This runbook reads accounts from a specified Users group and adds their devices to a specified Devices group. It ensures new devices are also added.

## Location
Organization → General → Add Devices Of Users To Group_Scheduled

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Group.ReadWrite.All
  - User.Read.All
  - GroupMember.ReadWrite.All


## Parameters
### UserGroup



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### DeviceGroup



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### IncludeWindowsDevice



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### IncludeMacOSDevice



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### IncludeLinuxDevice



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### IncludeAndroidDevice



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### IncludeIOSDevice



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### IncludeIPadOSDevice



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |


[Back to Table of Content](../../README.md)

