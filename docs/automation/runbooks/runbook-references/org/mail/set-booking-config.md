---
title: Set Booking Config
description: Configure Microsoft Bookings settings for the organization
---

## Description
Configures Microsoft Bookings settings at the organization level using Exchange Online organization configuration. The runbook can optionally create an OWA mailbox policy for Bookings creators and disable Bookings in the default OWA policy.

## Location
Organization → Mail → Set Booking Config

## Permissions
### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp

### RBAC roles
- Exchange administrator


## Parameters
### BookingsEnabled

If set to true, Microsoft Bookings is enabled for the organization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### BookingsAuthEnabled

If set to true, Bookings uses authentication.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### BookingsSocialSharingRestricted

If set to true, social sharing is restricted.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### BookingsExposureOfStaffDetailsRestricted

If set to true, exposure of staff details is restricted.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### BookingsMembershipApprovalRequired

If set to true, membership approval is required.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### BookingsSmsMicrosoftEnabled

If set to true, Microsoft SMS notifications are enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### BookingsSearchEngineIndexDisabled

If set to true, search engine indexing is disabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### BookingsAddressEntryRestricted

If set to true, address entry is restricted.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### BookingsCreationOfCustomQuestionsRestricted

If set to true, creation of custom questions is restricted.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### BookingsNotesEntryRestricted

If set to true, notes entry is restricted.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### BookingsPhoneNumberEntryRestricted

If set to true, phone number entry is restricted.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### BookingsNamingPolicyEnabled

If set to true, naming policies are enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### BookingsBlockedWordsEnabled

If set to true, blocked words are enabled for naming policies.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### BookingsNamingPolicyPrefixEnabled

If set to true, the naming policy prefix is enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### BookingsNamingPolicyPrefix

Prefix applied by the naming policy.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Booking- |
| Type | String |

### BookingsNamingPolicySuffixEnabled

If set to true, the naming policy suffix is enabled.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### BookingsNamingPolicySuffix

Suffix applied by the naming policy.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### CreateOwaPolicy

If set to true, an OWA mailbox policy for Bookings creators is created if missing.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### OwaPolicyName

Name of the OWA mailbox policy to create or use for Bookings creators.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | BookingsCreators |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

