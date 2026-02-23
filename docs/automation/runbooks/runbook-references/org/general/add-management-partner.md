---
title: Add Management Partner
description: List or add Management Partner Links (PAL)
---

## Description
This runbook lists existing Partner Admin Links (PAL) for the tenant or adds a new PAL.
It uses the Azure Management Partner API and supports an interactive action selection.

## Location
Organization → General → Add Management Partner

## Permissions
### Permission notes
Owner or Contributor role on the Azure Subscription


## Parameters
### Action

Choice of action to perform: list existing PALs or add a new PAL.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value | 0 |
| Type | Int32 |

### PartnerId

Partner ID to set when adding a PAL.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 6457701 |
| Type | Int32 |



[Back to Runbook Reference overview](../../README.md)

