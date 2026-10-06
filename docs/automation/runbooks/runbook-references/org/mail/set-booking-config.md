---
title: Set Booking Config
description: Configure the Microsoft Bookings settings of the tenant
---

## Description
Sets the tenant-wide Microsoft Bookings settings in Exchange Online, such as whether Bookings is on, what customers may enter and how booking pages are named. Optionally an Outlook web policy for Bookings creators is created and Bookings is turned off in the default policy, so only members of that policy can create booking pages.

## Location
Organization → Mail → Set Booking Config

**Full Runbook name**

rjgit-org_mail_set-booking-config

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>ExchangeOnlineManagement (>= 3.9.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Runs Set-OrganizationConfig and the OWA mailbox policy cmdlets in the app-only Exchange Online session*

### RBAC roles
- Exchange Administrator
  - *Required for the app-only Exchange Online session to change Bookings settings and OWA policies*


## Parameters
### BookingsEnabled

Turns Microsoft Bookings on for the tenant.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Enable Bookings? |

### BookingsAuthEnabled

Customers must sign in before they can book.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Require sign-in to book? |

### BookingsSocialSharingRestricted

Removes the social sharing options from booking pages.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Hide social sharing? |

### BookingsExposureOfStaffDetailsRestricted

Keeps staff details such as email addresses off the booking pages.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Hide staff details? |

### BookingsMembershipApprovalRequired

Staff must approve before they are added to a booking page.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Require staff approval? |

### BookingsSmsMicrosoftEnabled

Customers can get SMS notifications about their bookings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Allow SMS notifications? |

### BookingsSearchEngineIndexDisabled

Keeps booking pages out of search engine results.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Hide from search engines? |

### BookingsAddressEntryRestricted

Customers cannot enter their address when booking.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Block address entry? |

### BookingsCreationOfCustomQuestionsRestricted

Staff cannot add custom questions to booking forms.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Block custom questions? |

### BookingsNotesEntryRestricted

Customers cannot add notes when booking.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Block notes entry? |

### BookingsPhoneNumberEntryRestricted

Customers cannot enter their phone number when booking.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Block phone number entry? |

### BookingsNamingPolicyEnabled

Applies the prefix, suffix and blocked words rules to new booking page names.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Enable naming policy? |

### BookingsBlockedWordsEnabled

Rejects booking page names that contain a word from the blocked words list of the Microsoft 365 groups naming policy.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Enable blocked words? |

### BookingsNamingPolicyPrefixEnabled

Adds the prefix to every new booking page name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Add prefix? |

### BookingsNamingPolicyPrefix

Text put in front of new booking page names.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Booking- |
| Type | String |
| Portal display name | Prefix |

### BookingsNamingPolicySuffixEnabled

Adds the suffix to every new booking page name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Add suffix? |

### BookingsNamingPolicySuffix

Text appended to new booking page names.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Suffix |

### CreateOwaPolicy

Creates the Outlook web policy for Bookings creators if it is missing and turns off Bookings in the default policy.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Create Outlook web policy for creators? |

### OwaPolicyName

Name of the Outlook web policy for Bookings creators.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | BookingsCreators |
| Type | String |
| Portal display name | Outlook web policy name |



[Back to Runbook Reference overview](../../README.md)

