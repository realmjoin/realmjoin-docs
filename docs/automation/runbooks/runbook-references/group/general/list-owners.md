---
title: List Owners
description: List all owners of an Office 365 group.
---

## Description
This runbook retrieves and lists the owners of the specified group.
It uses Microsoft Graph to query the group and its owners and outputs the results as a table.
Use this to quickly review ownership assignments.

## Location
Group → General → List Owners

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Group.Read.All


## Parameters
### GroupID

Object ID of the target group.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

