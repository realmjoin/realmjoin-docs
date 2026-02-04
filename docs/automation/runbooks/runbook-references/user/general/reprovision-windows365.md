---
title: Reprovision Windows365
description: Reprovision a Windows 365 Cloud PC
---

## Description
Reprovision an already existing Windows 365 Cloud PC without reassigning a new instance for this user.

## Location
User → General → Reprovision Windows365

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

### licWin365GroupName



| Property | Value |
| --- | --- |
| Required | true |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB |
| Type | String |

### sendMailWhenReprovisioning



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


[Back to Table of Content](../../README.md)

