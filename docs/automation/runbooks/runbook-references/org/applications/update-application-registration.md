---
title: Update Application Registration
description: Update redirect URIs, SAML and sign-in settings of an app registration
---

## Description
Changes the configuration of an existing application registration in Entra ID: redirect URIs, SAML sign-in, visibility in My Apps, user assignment and implicit grant. Only settings that differ from the current ones are written. The application is selected by its client ID.

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

Client ID (appId) of the application registration to update.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### RedirectURI

Type of sign-in to set up: none, a web redirect URI, SAML, a public client (mobile and desktop) or a single-page application. The matching fields appear once you choose.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Sign-in type |

**Portal options**

| Portal option | Value |
| --- | --- |
| None | None |
| Web | Web |
| SAML | SAML |
| Public client/native (mobile & desktop) | PublicClient |
| Single-page application (SPA) | SPA |

### webRedirectURI

Redirect URI of a web application, for example https://myapp.com/auth. Separate several with semicolons.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Web redirect URI |

### publicClientRedirectURI

Redirect URI of a mobile or desktop client, for example myapp://auth. Separate several with semicolons.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Public client redirect URI |

### spaRedirectURI

Redirect URI of a single-page application, for example https://myapp.com. Separate several with semicolons.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | SPA redirect URI |

### EnableSAML

Whether SAML sign-in is configured. Set by the "Redirect URI" choice.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### SAMLReplyURL

Where the SAML response is sent (assertion consumer service URL).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | SAML reply URL |

### SAMLSignOnURL

URL where users start the sign-in to the application.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | SAML sign-on URL |

### SAMLLogoutURL

URL the application uses to sign users out.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | SAML logout URL |

### SAMLIdentifier

Identifier of the application in SAML (entity ID).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | SAML identifier (entity ID) |

### SAMLRelayState

Value the application receives back after sign-in, for example to return to a page.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | SAML relay state |

### SAMLExpiryNotificationEmail

Email address that is notified before the SAML signing certificate expires.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Certificate expiry notification email |

### isApplicationVisible

Lists the application in the users' My Apps portal.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Show in My Apps? |

### UserAssignmentRequired

Only assigned users can use the application. An access group is created for the assignment.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Require user assignment? |

### groupAssignmentPrefix

Text put in front of the access group name. Only used when user assignment is required.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | col - Entra - users - |
| Type | String |
| Portal display name | Access group prefix |

### implicitGrantAccessTokens

Lets the application receive access tokens through the implicit flow. Needed only for older single-page apps.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Implicit grant for access tokens? |

### implicitGrantIDTokens

Lets the application receive ID tokens through the implicit flow.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Implicit grant for ID tokens? |

### disableImplicitGrant

Switches implicit grant off for both token types, regardless of "Implicit grant for access tokens?" and "Implicit grant for ID tokens?".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |



[Back to Runbook Reference overview](../../README.md)

