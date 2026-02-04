---
title: Resize Windows365
description: Resize a Windows 365 Cloud PC
---

## Description
Resize an already existing Windows 365 Cloud PC by derpovisioning and assigning a new differently sized license to the user. Warning: All local data will be lost. Proceed with caution.

## Location
User → General → Resize Windows365

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - GroupMember.ReadWrite.All
  - Group.ReadWrite.All
  - Directory.Read.All
  - CloudPC.ReadWrite.All
  - User.Read.All
  - User.SendMail


## Parameters
### UserName



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### currentLicWin365GroupName



| Property | Value |
| --- | --- |
| Required | true |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB |
| Type | String |

### newLicWin365GroupName



| Property | Value |
| --- | --- |
| Required | true |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 256 GB |
| Type | String |

### sendMailWhenDoneResizing



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### fromMailAddress



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | reports@contoso.com |
| Type | String |

### customizeMail



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### customMailMessage



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Insert Custom Message here. (Capped at 3000 characters) |
| Type | String |

### cfgProvisioningGroupPrefix



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - Provisioning - |
| Type | String |

### cfgUserSettingsGroupPrefix



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - User Settings - |
| Type | String |

### unassignRunbook



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | rjgit-user_general_unassign-windows365 |
| Type | String |

### assignRunbook



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | rjgit-user_general_assign-windows365 |
| Type | String |

### skipGracePeriod



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |


[Back to Table of Content](../../README.md)

