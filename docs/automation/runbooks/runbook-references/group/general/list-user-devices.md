---
title: List User Devices
description: List devices owned by group members.
---

## Description
This runbook enumerates the users in a group and lists their registered devices.
Optionally, it can add the discovered devices to a specified device group.
Use this to create or maintain a device group based on group member ownership.

## Location
Group → General → List User Devices

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - Group.Read.All


## Parameters
### GroupID

Object ID of the group whose members will be evaluated.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### moveGroup

If set to true, the discovered devices are added to the target device group.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### targetgroup

Object ID of the target device group that receives the devices when moveGroup is enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

