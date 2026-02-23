---
title: Reset Mfa
description: Remove all App- and Mobilephone auth methods for a user
---

## Description
Removes authenticator app and phone-based authentication methods for a user. This forces the user to re-enroll MFA methods after the reset.

## Location
User → Security → Reset Mfa

## Permissions
### Application permissions
- **Type**: Microsoft Graph
  - UserAuthenticationMethod.ReadWrite.All


## Parameters
### UserName

User principal name of the target user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

