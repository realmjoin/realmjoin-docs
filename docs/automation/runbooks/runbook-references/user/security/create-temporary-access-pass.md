---
title: Create Temporary Access Pass
description: Create a temporary access pass for a user
---

## Description
Creates a new Temporary Access Pass (TAP) authentication method for a user in Microsoft Entra ID. Existing TAPs for the user are removed before creating a new one. Optionally sends a notification email to the user's primary email address informing them about the newly created TAP. The email language is automatically determined by the user's usage location.

## Activate user notification

This runbook sends an email to the user with the temporary access pass. To enable this, you need to activate user notification in the runbook customization.

The json configuration for this is as follows:

```json
"rjgit-user_security_create-temporary-access-pass": {
    "parameters": {
        "UserName": {
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
        "CallerName": {
            "Hide": true
        }
    }
}
```

For more information on how to customize runbooks, please refer to the [Runbook Customization Guide](https://docs.realmjoin.com/automation/runbooks/runbook-customization).

## Setup regarding email sending

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

This process is described in detail in the [Setup Email Reporting](https://github.com/realmjoin/realmjoin-runbooks/tree/master/docs/general/setup-email-reporting.md) documentation.


## Location
User → Security → Create Temporary Access Pass

**Full Runbook name**

rjgit-user_security_create-temporary-access-pass

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - UserAuthenticationMethod.ReadWrite.All


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### LifetimeInMinutes

Lifetime of the temporary access pass in minutes. Valid values are between 60 and 480 minutes (1-8 hours).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 240 |
| Type | Int32 |

### OneTimeUseOnly

If set to true, the pass can be used only once.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### NotifyUser

If enabled, sends a notification email to the user's primary email address about the newly created TAP.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### EmailFrom

The sender email address. This needs to be configured in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ServiceDeskDisplayName

Service Desk display name for user contact information (optional).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ServiceDeskEmail

Service Desk email address for user contact information (optional).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ServiceDeskPhone

Service Desk phone number for user contact information (optional).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

