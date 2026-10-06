---
title: Add Application Registration
description: Create an application registration in Entra ID
---

## Description
Creates a new application registration in Entra ID. Optionally it also configures redirect URIs for web, SPA or public clients, SAML sign-in, visibility in My Apps, user assignment with an access group, and implicit grant. Duplicate names are refused and the inputs are checked before anything is created

## Location
Organization → Applications → Add Application Registration

**Full Runbook name**

rjgit-org_applications_add-application-registration

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Application.ReadWrite.OwnedBy
    - *Creates the app and service principal, patches SAML settings and adds a token signing certificate*
  - Organization.Read.All
    - *Reads /organization to determine the tenant id reported alongside the new AppId*
  - Group.ReadWrite.All
    - *Creates the user-assignment group and assigns it to the app when UserAssignmentRequired is set*

### RBAC roles
- Application Developer
  - *Backs creating and configuring the new app registration and service principal*


## Parameters
### ApplicationName

Display name of the new application registration.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Application name |

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

### signInAudience

Who may sign in to the application. Preset to accounts in this tenant only (AzureADMyOrg).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | AzureADMyOrg |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### webRedirectURI

Redirect URI of a web application, for example https://myapp.com/auth. Separate several with semicolons.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Web redirect URI |

### spaRedirectURI

Redirect URI of a single-page application, for example https://myapp.com. Separate several with semicolons.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | SPA redirect URI |

### publicClientRedirectURI

Redirect URI of a mobile or desktop client, for example myapp://auth. Separate several with semicolons.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Public client redirect URI |

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

### SAMLSignOnURL

URL where users start the sign-in to the application.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLLogoutURL

URL the application uses to sign users out.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLIdentifier

Identifier of the application in SAML (entity ID). Leave empty to use urn:app: followed by the client ID.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLRelayState

Value the application receives back after sign-in, for example to return to a page.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLExpiryNotificationEmail

Email address that is notified before the SAML signing certificate expires.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SAMLCertificateLifeYears

How many years the SAML signing certificate stays valid.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 3 |
| Type | Int32 |

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



[Back to Runbook Reference overview](../../README.md)

