---
title: Add User
description: Create a new user account in Entra ID
---

## Description
Creates a cloud user in Entra ID with the usual profile details such as name, company, job title, manager, sponsors and address. Sign-in name, alias and display name are derived from the name when left empty, and a start password is generated when none is given. Optionally the user gets a license group, further groups and an Exchange Online archive mailbox.

## Offer locations and companies as templates

Address fields and company are free text by default. With runbook customization templates the operator picks an office location, which fills in and locks the address block, and a company from a list. The example below defines such templates and binds them to the runbook's fields:

```json
{
    "Templates": {
        "Options": [
            {
                "$id": "LocationOptions",
                "$values": [
                    {
                        "Display": "DE-OF",
                        "Customization": {
                            "Default": {
                                "StreetAddress": "Kaiserstraße 39",
                                "PostalCode": "63065",
                                "City": "Offenbach",
                                "Country": "Germany"
                            }
                        }
                    },
                    {
                        "Display": "DE-DEG",
                        "Customization": {
                            "Default": {
                                "StreetAddress": "Lateinschulgassse 24-26",
                                "PostalCode": "94469",
                                "City": "Deggendorf",
                                "Country": "Germany"
                            }
                        }
                    },
                    {
                        "Display": "DE-HH",
                        "Customization": {
                            "Default": {
                                "StreetAddress": "Hans-Henny-Jahnn-Weg 53",
                                "PostalCode": "22085",
                                "City": "Hamburg",
                                "Country": "Germany"
                            }
                        }
                    },
                    {
                        "Display": "FI-HS",
                        "Customization": {
                            "Default": {
                                "StreetAddress": "Somewhere 42",
                                "PostalCode": "12345",
                                "City": "Helsinki",
                                "Country": "Finland"
                            }
                        }
                    }
                ]
            },
            {
                "$id": "CompanyOptions",
                "$values": [
                    {
                        "Id": "gkg",
                        "Display": "glueckkanja-gab",
                        "Value": "glueckkanja-gab AG"
                    },
                    {
                        "Id": "pp",
                        "Display": "PrimePulse",
                        "Value": "PrimePulse AG"
                    }
                ]
            }
        ]
    },
    "Runbooks": {
        "rjgit-org_general_add-user": {
            "ParameterList": [
                {
                    "DisplayName": "Office Location",
                    "DisplayAfter": "CompanyName",
                    "Select": {
                        "Options": {
                            "$ref": "LocationOptions"
                        }
                    }
                },
                {
                    "Name": "CompanyName",
                    "Select": {
                        "Options": {
                            "$ref": "CompanyOptions"
                        },
                        "AllowEdit": false
                    }
                }
            ],
            "ReadOnly": [
                "StreetAddress",
                "PostalCode",
                "City",
                "Country"
            ]
        }
    }
}
```

For more information on how to customize runbooks, please refer to the [Runbook Customization Guide](https://docs.realmjoin.com/automation/runbooks/runbook-customization).


## Location
Organization → General → Add User

**Full Runbook name**

rjgit-org_general_add-user

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
    - *Opens the app-only Exchange Online session used for distribution groups and enabling the online archive*

### RBAC roles
- User Administrator
  - *Backs creating the user, assigning manager, sponsors and groups and reading license data*
- Exchange Administrator
  - *Required for the app-only Exchange Online session managing distribution groups and the online archive*


## Parameters
### GivenName

First name of the user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | First name |

### Surname

Last name of the user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Last name |

### UserPrincipalName

Sign-in name of the user. Derived from the name when empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### MailNickname

Alias of the mailbox. Derived from the sign-in name when empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### DisplayName

Derived from first and last name when empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### CompanyName

Company the user belongs to.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Company |

### JobTitle

Shown in the profile and in the address book.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Job title |

### Department

Department the user works in.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### ManagerId

User who becomes the manager.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### SponsorIds

Users recorded as sponsors of the new user. Several can be picked.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String[] |

### MobilePhone

Shown in the profile and in the address book.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Mobile phone |

### LocationName

Office location shown in the profile. With templates from the runbook customization, picking one also fills in the address fields.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Office location |

### StreetAddress

Part of the postal address shown in the profile. Filled in by the office location template when one is picked.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Street address |

### PostalCode

Part of the postal address shown in the profile. Filled in by the office location template when one is picked.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Postal code |

### City

Part of the postal address shown in the profile. Filled in by the office location template when one is picked.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### State

Part of the postal address shown in the profile.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Country

Part of the postal address shown in the profile. Filled in by the office location template when one is picked.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### UsageLocation

Two-letter country code that decides which licenses the user may get, for example DE.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Usage location |

### DefaultLicense

Display name of the group that assigns the license; the user is added to it. Leave empty for none.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | License group to assign |

### DefaultGroups

Display names of further groups the user is added to, separated by commas.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Groups to add |

### InitialPassword

Start password for the user. Leave empty to have one generated and shown in the output.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Initial password |

### EnableEXOArchive

Turns on the Exchange Online archive mailbox for the new user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Create an archive mailbox? |



[Back to Runbook Reference overview](../../README.md)

