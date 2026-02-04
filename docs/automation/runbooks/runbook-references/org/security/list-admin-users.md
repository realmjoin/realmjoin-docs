---
title: List Admin Users
description: List AzureAD role holders and their MFA state.
---

## Description
Will list users and service principals that hold a builtin AzureAD role.
Admins will be queried for valid MFA methods.

## Location
Organization → Security → List Admin Users

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
  - Directory.Read.All
  - RoleManagement.Read.All


## Parameters
### exportToFile



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### pimEligibleUntilInCSV



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### ContainerName



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ResourceGroupName



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountName



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountLocation



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StorageAccountSku



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### QueryMfaState



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### TrustEmailMfa



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### TrustPhoneMfa



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### TrustSoftwareOathMfa



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### TrustWinHelloMFA



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |


[Back to Table of Content](../../README.md)

