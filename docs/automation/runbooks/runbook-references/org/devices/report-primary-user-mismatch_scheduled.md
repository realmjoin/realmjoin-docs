---
title: Report Primary User Mismatch (Scheduled)
description: Compare primary user assignments in Intune against RealmJoin for Windows managed devices
---

## Description
For Windows managed devices, this scheduled report compares the primary user recorded in Intune against the primary user recorded in the RealmJoin customer API. It correlates the two datasets per device, flags any device where the primary user differs, and emails the differences with a CSV attachment.

## Setup regarding email sending

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

This process is described in detail in the [Setup Email Reporting](https://github.com/realmjoin/realmjoin-runbooks/tree/master/docs/general/setup-email-reporting.md) documentation.

## Setup regarding RealmJoin API credentials

This runbook queries the RealmJoin customer API and requires a dedicated credential stored in the Azure Automation Account.

**Step-by-step setup:**

1. **Get API credentials** — If you do not yet have RealmJoin API credentials, request them at support@realmjoin.com
2. **Open the Automation Account** — In the Azure portal, navigate to the Automation Account used for runbooks
3. **Go to Shared Resources > Credentials** — In the left menu under *Shared Resources*, click *Credentials*
4. **Add a new credential** — Click *Add a credential*
5. **Name it exactly `RJAPI`** — The runbook looks up this name; any deviation will cause the credential lookup to fail
6. **Enter the RealmJoin API username and password** — Use the credentials from step 1
7. **Save** — Click *Create* and re-run the runbook


## Location
Organization → Devices → Report Primary User Mismatch (Scheduled)

**Full Runbook name**

rjgit-org_devices_report-primary-user-mismatch_scheduled

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.Read.All
  - Mail.Send
  - Organization.Read.All


## Parameters
### SyncThresholdDays

Number of days to look back for the Intune last-sync filter. Only Windows devices that have synced within this many days are evaluated.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 30 |
| Type | Int32 |

### DeviceNamePrefix

Optional device name prefix to filter the report to a specific subset of devices. Leave blank to include all devices.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### IncludeMismatches

Include devices whose primary user differs between Intune and RealmJoin in the report. Enabled by default.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### IncludeMissingInRealmJoin

Include devices that exist in Intune but have no matching device in RealmJoin in the report. Disabled by default.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### IncludeMissingInIntune

Include devices that exist in RealmJoin but have no matching Intune device in the report. Disabled by default.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### EmailTo

Recipient email address (or multiple comma-separated addresses) that should receive the report.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### EmailFrom

The sender email address. This is configured via the runbook customization setting and hidden in the portal.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

