---
title: Set Or Remove Mobile Phone MFA
description: Set or remove the mobile phone MFA method of this user
---

## Description
Adds or updates the mobile phone of this user as an MFA method for calls and text messages, or removes it. Optionally the user gets an email about the change. When the tenant allows SMS sign-in, Microsoft also tries to register the number for it. A number already used by someone else then produces a warning; the MFA method is usually still set, and the runbook checks and reports the real state. Details on that conflict are in the runbook documentation (docs.realmjoin.com).

## Activate user notification

This runbook can optionally send a notification email to the target user informing them that their mobile phone MFA method was added, updated, or removed by an administrator. To enable this, you need to activate user notification in the runbook customization.

The json configuration for this is as follows:

```json
"rjgit-user_security_set-or-remove-mobile-phone-mfa": {
    "parameters": {
        "UserId": {
            "Hide": true
        },
        "NotifyUser": {
            "Default": true,
            "Hide": true
        },
        "EmailFrom": {
            "Hide": true
        },
        "ServiceDeskDisplayName": {
            "Hide": true
        },
        "ServiceDeskEmail": {
            "Hide": true
        },
        "ServiceDeskPhone": {
            "Hide": true
        },
        "ServiceDeskPortalUrl": {
            "Hide": true
        },
        "ServiceDeskTicketUrl": {
            "Hide": true
        },
        "LanguageOverride": {
            "Hide": true
        },
        "CallerName": {
            "Hide": true
        }
    }
}
```

For more information on how to customize runbooks, please refer to the [Runbook Customization Guide](https://docs.realmjoin.com/automation/runbooks/runbook-customization).

## Setup regarding email sending

Sending a notification email is optional and only happens when `NotifyUser` is enabled. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details on all available settings.

### Email branding

The report email honors the optional `RJReport.Branding.*` tenant settings:

- **Header and footer image** – public HTTPS URLs, PNG/JPEG/GIF, max. 200 KB each
- **Footer link** – target of the footer image
- **Accent and text color** – 6-digit hex values, e.g. `#0052cc`

When these settings are not configured, the default RealmJoin graphics and colors are used. An image that cannot be downloaded or validated, or an invalid color value, never prevents the report email – the corresponding default is used instead.

Setup instructions and image requirements: [Email branding](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings#email-branding-optional).

## SMS sign-in conflicts

The Microsoft Graph phone methods API offers no way to add a phone number as an MFA-only method without Microsoft also attempting to register it for SMS sign-in. When the user is enabled for SMS sign-in by the tenant's authentication methods policy, Graph tries that registration right after the phone method is created or updated. If another user already uses the number for SMS sign-in, Graph answers with a `409 Conflict` and the error code `phoneNumberNotUnique`, although the phone method for regular MFA is usually created or updated anyway.

The `smsSignInState` property is read-only and cannot be set in the create or update request; SMS sign-in can only be switched explicitly through the separate `enableSmsSignIn` and `disableSmsSignIn` endpoints. The runbook therefore checks the real state after such an error and reports success with a warning when the MFA method was assigned. If the assignment really failed, it looks up the user who holds the number and names them in the output.


## Location
User → Security → Set Or Remove Mobile Phone MFA

**Full Runbook name**

rjgit-user_security_set-or-remove-mobile-phone-MFA

## Details

| Property | Value |
| --- | --- |
| Version | 2.3.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - AuditLog.Read.All
    - *Queries userRegistrationDetails to find which user holds a conflicting SMS sign-in number*
  - User.Read.All
    - *Resolves the target user and batch-reads other users' phone methods for conflict checks*
  - UserAuthenticationMethod.ReadWrite.All
    - *Sets, updates or removes the user's mobile phone authentication method*
  - Mail.Send *(optional — feature: Email report)*
    - *Mails the user that an admin changed their MFA phone when NotifyUser is enabled*
  - Organization.Read.All *(optional — feature: Email notification)*
    - *Reads the tenant display name for the notification email when NotifyUser is enabled*


## Parameters
### UserId

Object ID of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### phoneNumber

Number in E.164 format such as +491701234567.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Mobile phone number |

### Remove

Add or update stores the number as the MFA method for calls and text messages. Remove deletes it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Action |

**Portal options**

| Portal option | Value |
| --- | --- |
| Add or update this number as MFA method | false |
| Remove the mobile phone MFA method | true |

### NotifyUser

Whether the user is emailed about the change. Preset in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |

### EmailFrom

Sender address of the notification email. Taken from the tenant setting RJReport.EmailSender.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingHeaderImageUrl

Header image of the report email (HTTPS URL, PNG/JPEG/GIF, max 200 KB). Taken from the tenant setting RJReport.Branding.HeaderImageUrl; the default RealmJoin header is used when empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterImageUrl

Footer image of the report email (HTTPS URL, PNG/JPEG/GIF, max 200 KB). Taken from the tenant setting RJReport.Branding.FooterImageUrl; the default RealmJoin footer is used when empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterLink

Link behind the footer image of the report email. Taken from the tenant setting RJReport.Branding.FooterLink; realmjoin.com is used when empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingAccentColor

Accent color of the report email as a 6-digit hex value. Taken from the tenant setting RJReport.Branding.AccentColor; the RealmJoin default is used when empty or invalid.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingTextColor

Text color of the report email as a 6-digit hex value. Taken from the tenant setting RJReport.Branding.TextColor; the RealmJoin default is used when empty or invalid.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ServiceDeskDisplayName

Service desk name shown in the email. Taken from the tenant setting RJReport.ServiceDesk_DisplayName.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ServiceDeskEmail

Service desk email address shown in the email. Taken from the tenant setting RJReport.ServiceDesk_EMail.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ServiceDeskPhone

Service desk phone number shown in the email. Taken from the tenant setting RJReport.ServiceDesk_Phone.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ServiceDeskPortalUrl

Link to the service desk portal shown in the email. Taken from the tenant setting RJReport.ServiceDesk_PortalUrl.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ServiceDeskTicketUrl

Link to the ticket for this request, shown in the email. Preset per run or in the runbook customization; empty means no link.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### LanguageOverride

Forces the email language, DE or EN. Empty picks the language from the user's usage location. Preset in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

