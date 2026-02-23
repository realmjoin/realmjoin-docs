---
title: Add Application Registration
description: Add an application registration to Azure AD
---

## Description
This runbook creates a new application registration in Microsoft Entra ID and optionally configures redirect URIs and SAML settings.
It validates the submitted parameters, prevents duplicate app creation, and writes verbose logs for troubleshooting.
Use it to standardize application registration setup, including visibility and assignment-related options.

## Location
Organization → Applications → Add Application Registration

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Application.ReadWrite.OwnedBy
  - Organization.Read.All
  - Group.ReadWrite.All

### RBAC roles
- Application Developer


## Parameters
### ApplicationName

The display name of the application registration to create.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### RedirectURI

Used for UI selection only. Determines which redirect URI type to configure - None, Web, SPA, or Public Client

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### signInAudience

Specifies who can use the application. Defaults to "AzureADMyOrg" (single tenant).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | AzureADMyOrg |
| Type | String |

### webRedirectURI

Redirect URI or URIs for web applications. Multiple values can be separated by semicolons.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### spaRedirectURI

Redirect URI or URIs for single-page applications. Multiple values can be separated by semicolons.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### publicClientRedirectURI

Redirect URI or URIs for public client/native applications. Multiple values can be separated by semicolons.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### EnableSAML

If set to true, SAML-based authentication is configured for the application. If enabled, additional SAML-related parameters become required.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### SAMLReplyURL

The reply URL for SAML-based authentication

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLSignOnURL

The sign-on URL for SAML authentication.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLLogoutURL

The logout URL for SAML authentication.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLIdentifier

The SAML identifier (Entity ID). If not specified, defaults to "urn:app:{AppId}".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLRelayState

The SAML relay state parameter for maintaining application state during authentication.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLExpiryNotificationEmail

Email address to receive notifications when the SAML token signing certificate is about to expire.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLCertificateLifeYears

Lifetime of the SAML token signing certificate in years. Default is 3 years.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 3 |
| Type | Int32 |

### isApplicationVisible

Determines whether the application is visible in the My Apps portal. Default is true.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### UserAssignmentRequired

Determines whether users must be assigned to the application before accessing it. When enabled, an EntraID group is created for user assignment. Default is false.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### groupAssignmentPrefix

Prefix for the automatically created EntraID group when UserAssignmentRequired is enabled. Default is "col - Entra - users - ".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | col - Entra - users - |
| Type | String |

### implicitGrantAccessTokens

Enable implicit grant flow for access tokens. Default is false.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### implicitGrantIDTokens

Enable implicit grant flow for ID tokens. Default is false.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

