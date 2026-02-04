---
title: Assign Windows365
description: Assign/Provision a Windows 365 instance
---

## Description
Assign/Provision a Windows 365 instance for this user.

## Location
User → General → Assign Windows365

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
  - GroupMember.ReadWrite.All
  - Group.ReadWrite.All
  - User.SendMail


## Parameters
### UserName



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### cfgProvisioningGroupName



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - Provisioning - Win11 |
| Type | String |

### cfgUserSettingsGroupName



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | cfg - Windows 365 - User Settings - restore allowed |
| Type | String |

### licWin365GroupName



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | lic - Windows 365 Enterprise - 2 vCPU 4 GB 128 GB |
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

### sendMailWhenProvisioned



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

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

### createTicketOutOfLicenses



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### ticketQueueAddress



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | support@glueckkanja-gab.com |
| Type | String |

### fromMailAddress



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | runbooks@contoso.com |
| Type | String |

### ticketCustomerId



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Contoso |
| Type | String |


[Back to Table of Content](../../README.md)

