---
title: Report Apple MDM Cert Expiry (Scheduled)
description: Monitor/Report expiry of Apple device management certificates
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Monitors expiration dates of Apple Push certificates, VPP tokens, and DEP tokens in Microsoft Intune.
Sends an email report with alerts for certificates/tokens expiring within the specified threshold.

## Setup regarding email sending

Sending an email report is optional and only happens when a recipient (`EmailTo`) is provided. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details.


## Location
Organization → General → Report Apple MDM Cert Expiry (Scheduled)

**Full Runbook name**

rjgit-org_general_report-apple-mdm-cert-expiry_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.6 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.7)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.Read.All
  - DeviceManagementServiceConfig.Read.All
  - DeviceManagementConfiguration.Read.All
  - Mail.Send


## Parameters
### Days

The warning threshold in days. Certificates and tokens expiring within this many days will be
flagged as alerts in the report. Default is 30 days.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 30 |
| Type | Int32 |
| Portal display name | Days Until Expiration Warning |

### EmailTo

Can be a single address or multiple comma-separated addresses (string).
The function sends individual emails to each recipient for privacy reasons.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Recipient Email Address(es) |

### EmailFrom

The sender email address. This needs to be configured in the runbook customization

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

