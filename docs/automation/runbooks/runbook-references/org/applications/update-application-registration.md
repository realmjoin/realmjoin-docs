---
title: Update Application Registration
description: Update an application registration in Azure AD
---

## Description
This script modifies an existing application registration in Azure Active Directory (Entra ID) with comprehensive configuration updates.

The script intelligently determines what changes need to be applied by comparing current settings
with requested parameters, ensuring only necessary updates are performed. It maintains backward
compatibility while supporting modern authentication patterns and security requirements.

## Location
Organization → Applications → Update Application Registration

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Application.ReadWrite.OwnedBy
  - Organization.Read.All
  - Group.ReadWrite.All

### RBAC roles
- Application Developer


## Parameters
### ClientId



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### RedirectURI



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### webRedirectURI

Only for UI used

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### publicClientRedirectURI



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### spaRedirectURI



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### EnableSAML



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### SAMLReplyURL



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLSignOnURL



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLLogoutURL



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLIdentifier



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLRelayState



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLExpiryNotificationEmail



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### isApplicationVisible



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### UserAssignmentRequired



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### groupAssignmentPrefix



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | col - Entra - users - |
| Type | String |

### implicitGrantAccessTokens



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### implicitGrantIDTokens



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### disableImplicitGrant



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

