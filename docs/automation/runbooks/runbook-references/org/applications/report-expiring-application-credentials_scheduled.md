---
title: Report Expiring Application Credentials (Scheduled)
description: List expiry date of all Application Registration credentials
---

## Description
List the expiry date of all Application Registration credentials, including Client Secrets and Certificates.
Optionally, filter by Application IDs and list only those credentials that are about to expire.

## Setup regarding email sending

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

This process is described in detail in the [Setup Email Reporting](https://github.com/realmjoin/realmjoin-runbooks/tree/master/docs/general/setup-email-reporting.md) documentation.


## Location
Organization → Applications → Report Expiring Application Credentials_Scheduled

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Application.Read.All
  - Mail.Send


## Parameters
### listOnlyExpiring

If set to true, only credentials that are about to expire within the specified number of days will be listed.
If set to false, all credentials will be listed regardless of their expiry date.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### Days

The number of days before a credential expires to consider it "about to expire".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 30 |
| Type | Int32 |

### CredentialType

Filter by credential type: "Both" (default), "ClientSecrets", or "Certificates".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Both |
| Type | String |

### ApplicationIds

Optional - comma-separated list of Application IDs to filter the credentials.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### EmailTo

If specified, an email with the report will be sent to the provided address(es).
Can be a single address or multiple comma-separated addresses (string).
The function sends individual emails to each recipient for privacy reasons.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### EmailFrom

The sender email address. This needs to be configured in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

