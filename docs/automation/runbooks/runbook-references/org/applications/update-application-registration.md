---
title: Update Application Registration
description: Update an application registration in Azure AD
---

## Description
This runbook updates an existing application registration and its related configuration in Microsoft Entra ID.
It compares the current settings with the requested parameters and applies only the necessary updates.
Use it to manage redirect URIs, SAML settings, visibility, assignment requirements, and token issuance behavior.

## Location
Organization → Applications → Update Application Registration

**Full Runbook name**

rjgit-org_applications_update-application-registration

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Application.ReadWrite.OwnedBy
    - *Reads and patches /applications/{id} and /servicePrincipals/{id} to update redirect URIs, tags and SAML settings*
  - Group.ReadWrite.All
    - *Creates the assignment group and assigns it to the app when UserAssignmentRequired is set*

### RBAC roles
- Application Developer
  - *Allows updating app registrations the runbook's identity does not own*


## Parameters
### ClientId

The application client ID (appId) of the application registration to update.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### RedirectURI

Used for UI selection only. Determines which redirect URI type to configure.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Redirect URI (Optional) |

**Portal options**

| Portal option | Value |
| --- | --- |
| None |  |
| Web |  |
| SAML |  |
| Public client/native (mobile & desktop) |  |
| Single-page application (SPA) |  |

### webRedirectURI

Redirect URI or URIs for web applications. Multiple values can be separated by semicolons.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Web Redirect URI e.g. https://myapp.com/auth (semicolon-separated for multiple) |

### publicClientRedirectURI

Redirect URI or URIs for public client/native applications. Multiple values can be separated by semicolons.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Public client/native Redirect URI e.g. myapp://auth (semicolon-separated for multiple) |

### spaRedirectURI

Redirect URI or URIs for single-page applications. Multiple values can be separated by semicolons.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Single-page application (SPA) Redirect URI e.g. https://myapp.com (semicolon-separated for multiple) |

### EnableSAML

If set to true, SAML-based authentication is configured on the service principal.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### SAMLReplyURL

The SAML reply URL.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLSignOnURL

The SAML sign-on URL.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLLogoutURL

The SAML logout URL.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLIdentifier

The SAML identifier (Entity ID).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLRelayState

The SAML relay state parameter.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLExpiryNotificationEmail

Email address for SAML certificate expiry notifications.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### isApplicationVisible

Determines whether the application is visible in the My Apps portal.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Application visible in My Apps portal |

### UserAssignmentRequired

Determines whether user assignment is required for the application.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | User assignment required |

### groupAssignmentPrefix

Prefix for the automatically created assignment group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | col - Entra - users - |
| Type | String |
| Portal display name | Group assignment prefix (Only necessary when User assignment required) |

### implicitGrantAccessTokens

Enable implicit grant flow for access tokens.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Enable implicit grant for access tokens |

### implicitGrantIDTokens

Enable implicit grant flow for ID tokens.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Enable implicit grant for ID tokens |

### disableImplicitGrant

If set to true, disables implicit grant issuance regardless of other settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

