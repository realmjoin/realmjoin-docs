---
title: List Inactive Enterprise Applications
description: List application registrations, which had no recent user logons.
---

## Description
Identifies enterprise applications with no recent sign-in activity based on Entra ID audit logs.
The report includes Entra ID applications with last sign-in older than specified days (default: 90 days) or applications with no sign-in records in the audit log.

## Location
Organization → Applications → List Inactive Enterprise Applications

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Directory.Read.All
  - Device.Read.All


## Parameters
### Days

Number of days without user logon to consider an application as inactive. Default is 90 days.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 90 |
| Type | Int32 |



[Back to Runbook Reference overview](../../README.md)

