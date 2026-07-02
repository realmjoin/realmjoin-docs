---
title: List MFA Methods
description: List all MFA / authentication methods of a user
---

## Description
Retrieves and displays every Microsoft Entra ID authentication method registered for a target user, including phone numbers for phone-based methods. Phone numbers can optionally be masked, showing only the last four digits. Optionally a notification email can be sent to the user informing them that their MFA methods have been retrieved through this runbook.

## Activate user notification

This runbook can optionally send a notification email to the target user informing them that their MFA methods were retrieved by an administrator. To enable this, you need to activate user notification in the runbook customization.

The json configuration for this is as follows:

```json
"rjgit-user_security_list-mfa-methods": {
    "parameters": {
        "UserName": {
            "Hide": true
        },
        "NotifyUser": {
            "Default": true,
            "Hide": true
        },
        "MaskPhoneNumbers": {
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

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details.


## Location
User → Security → List MFA Methods

**Full Runbook name**

rjgit-user_security_list-MFA-methods

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Mail.Send
  - Organization.Read.All
  - User.Read.All
  - UserAuthenticationMethod.Read.All


## Parameters
### UserName

User Principal Name of the target user. Auto-filled by the RealmJoin portal in the user context.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### NotifyUser

When enabled, sends a notification email to the target user informing them that their MFA methods were retrieved by an administrator. Default is disabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### MaskPhoneNumbers

When enabled, all phone numbers are masked except for the last four digits (for example +491234567890 becomes ********7890). Default is disabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### EmailFrom

Sender email address for the optional notification mail. Sourced from the RealmJoin tenant setting RJReport.EmailSender.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ServiceDeskDisplayName

Service Desk display name for user contact information (optional). Sourced from the RealmJoin tenant setting RJReport.ServiceDesk_DisplayName.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ServiceDeskEmail

Service Desk email address for user contact information (optional). Sourced from the RealmJoin tenant setting RJReport.ServiceDesk_EMail.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ServiceDeskPhone

Service Desk phone number for user contact information (optional). Sourced from the RealmJoin tenant setting RJReport.ServiceDesk_Phone.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ServiceDeskPortalUrl

Service Desk portal URL for user contact information, rendered as a clickable link (optional). Sourced from the RealmJoin tenant setting RJReport.ServiceDesk_PortalUrl.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ServiceDeskTicketUrl

Direct link to the Service Desk ticket related to this request, rendered as a clickable link (optional). Empty by default, so no ticket link is added.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### LanguageOverride

Overrides the language used for the notification email. Accepted values are 'DE' (German) or 'EN' (English). If left empty, the language is determined automatically based on the target user's usage location.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

