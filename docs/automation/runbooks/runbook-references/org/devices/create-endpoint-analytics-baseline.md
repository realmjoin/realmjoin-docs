---
title: Create Endpoint Analytics Baseline
description: Create an Endpoint Analytics baseline with a naming schema
---

## Description
Creates a new Endpoint Analytics baseline in Intune, named after a schema with placeholders such as the current date, so baselines can be created regularly and compared over time. Intune allows at most 20 baselines; the oldest can be removed automatically when the limit is reached.

## Location
Organization → Devices → Create Endpoint Analytics Baseline

**Full Runbook name**

rjgit-org_devices_create-endpoint-analytics-baseline

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.3 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - DeviceManagementManagedDevices.ReadWrite.All
    - *Lists, creates and deletes Endpoint Analytics baselines (userExperienceAnalyticsBaselines)*


## Parameters
### BaselineNamingSchema

Name pattern with placeholders such as {Year}, {Month}, {Date} or {DateTime}, for example EA-Baseline-{Year}-{Month}.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Baseline naming schema |

### RemoveOldestBaseline

Deletes the oldest baseline when 20 already exist. Turn off to stop with an error instead.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Remove the oldest baseline at the limit? |



[Back to Runbook Reference overview](../../README.md)

