---
title: Reset Password
description: Reset a user's password.
---

## Description
Reset a user's password. The user will have to change it on signin. Does not work with PW writeback to onprem AD.

## Location
User → Security → Reset Password

## Permissions
### RBAC roles
- User administrator


## Parameters
### UserName



| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |

### EnableUserIfNeeded



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### ForceChangePasswordNextSignIn



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |


[Back to Table of Content](../../README.md)

