---
title: Set Booking Config
description: Configure Microsoft Bookings settings for the organization.
---

## Description
Configure Microsoft Bookings settings at the organization level, including booking policies,
naming conventions, and access restrictions. Optionally creates an OWA mailbox policy for
Bookings creators and disables Bookings in the default OWA policy.

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



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### BookingsAuthEnabled



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### BookingsSocialSharingRestricted



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### BookingsExposureOfStaffDetailsRestricted



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### BookingsMembershipApprovalRequired



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### BookingsSmsMicrosoftEnabled



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### BookingsSearchEngineIndexDisabled



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### BookingsAddressEntryRestricted



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### BookingsCreationOfCustomQuestionsRestricted



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### BookingsNotesEntryRestricted



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### BookingsPhoneNumberEntryRestricted



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### BookingsNamingPolicyEnabled



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### BookingsBlockedWordsEnabled



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### BookingsNamingPolicyPrefixEnabled



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### BookingsNamingPolicyPrefix



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | Booking- |
| Type | String |

### BookingsNamingPolicySuffixEnabled



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |

### BookingsNamingPolicySuffix



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### CreateOwaPolicy



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |

### OwaPolicyName



| Property | Value |
| --- | --- |
| Required | false |
| Default Value | BookingsCreators |
| Type | String |



[Back to Runbook Reference overview](../../README.md)

