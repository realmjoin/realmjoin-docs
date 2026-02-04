---
title: Restrict Or Release Code Execution
description: Restrict code execution.
---

## Description
Only allow Microsoft signed code to be executed.

## Location
Device → Security → Restrict Or Release Code Execution

## Permissions
### Application permissions
- **Type**: WindowsDefenderATP
  - Machine.Read.All
  - Machine.RestrictExecution


## Parameters
### DeviceId



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### Release



| Property | Value |
| --- | --- |
| Required | true |
| Default Value | False |
| Type | Boolean |

### Comment



| Property | Value |
| --- | --- |
| Required | true |
| Default Value | Possible security risk. |
| Type | String |


[Back to Table of Content](../../README.md)

