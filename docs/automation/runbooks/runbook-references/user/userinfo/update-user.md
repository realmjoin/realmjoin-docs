---
title: Update User
description: Update profile details, groups and mailbox settings of this user
---

## Description
Updates the profile of this user in Entra ID, such as name, company, address, job title and manager. It can also add the user to a license group and further groups, enable the Exchange Online archive and reset the password. Only the fields you fill in are changed; a missing display name or company is filled in automatically.

## Offer locations, companies, licenses and departments as templates

Most fields of this runbook are free text. With runbook customization templates the operator picks from predefined lists instead, and a location template can fill in and lock the whole address block. The example below defines such templates and binds them to the runbook's fields:

```json
"Templates": {
    "Options": [
        {
            "$id": "LocationOptions",
            "$values": [
                {
                    "Display": "Contoso DE",
                    "Value": "ContosoDe",
                    "Customization": {
                        "Default": {
                            "StreetAddress": "Demostr. 22",
                            "PostalCode": "80333",
                            "City": "Munich",
                            "State": "Bavaria",
                            "Country": "Germany",
                            "UsageLocation": "DE"
                        },
                        "ReadOnly": [
                            "StreetAddress",
                            "PostalCode",
                            "City",
                            "Country",
                            "UsageLocation"
                        ]
                    }
                }
            ]
        },
        {
            "$id": "CompanyOptions",
            "$values": [
                {
                    "Display": "CONTOSO",
                    "Value": "Contoso"
                }
            ]
        },
        {
            "$id": "LicenseOptions",
            "$values": [
                {
                    "Display": "M365 E3 + E5 Security + Audio Conferencing",
                    "Value": "LIC_M365_E3&E5_SecurityPlan&AudioConf"
                },
                {
                    "Display": "none",
                    "Value": ""
                }
            ]
        },
        {
            "$id": "DepartmentOptions",
            "$values": [
                {
                    "Display": "M&A",
                    "Value": "M&A"
                },
                {
                    "Display": "Tax & Legal",
                    "Value": "Tax & Legal"
                },
                {
                    "Display": "Controlling & Operations",
                    "Value": "Controlling & Operations"
                },
                {
                    "Display": "IT",
                    "Value": "IT"
                },
                {
                    "Display": "Communications",
                    "Value": "Communications"
                },
                {
                    "Display": "Strategy & Management",
                    "Value": "Strategy & Management"
                },
                {
                    "Display": "Accounting",
                    "Value": "Accounting"
                },
                {
                    "Display": "Insurance",
                    "Value": "Insurance"
                },
                {
                    "Display": "Treasury",
                    "Value": "Treasury"
                }
            ]
        }
    ]
},
"Runbooks": {
    "rjgit-user_userinfo_update-user": {
        "ParameterList": [
            {
                "Name": "LocationName",
                "DisplayName": "Office Location",
                "DisplayBefore": "StreetAddress",
                "Select": {
                    "Options": {
                        "$ref": "LocationOptions"
                    }
                },
                "Default": "ContosoDe"
            },
            {
                "Name": "CompanyName",
                "Select": {
                    "Options": {
                        "$ref": "CompanyOptions"
                    },
                    "AllowEdit": false
                },
                "Default": "Contoso"
            },
            {
                "Name": "DefaultLicense",
                "DisplayName": "License",
                "Select": {
                    "Options": {
                        "$ref": "LicenseOptions"
                    },
                    "AllowEdit": true
                },
                "Default": "LIC_M365_E3&E5_SecurityPlan&AudioConf"
            },
            {
                "Name": "Department",
                "Select": {
                    "Options": {
                        "$ref": "DepartmentOptions"
                    },
                    "AllowEdit": true
                }
            },
            {
                "Name": "ResetPassword",
                "Hide": true
            },
            {
                "Name": "DefaultGroups",
                "Default": "app - 7-Zip,app - Adobe Reader DC Continuous Track,app - glueckkanja-gab KONNEKT"
            }
        ]
    }
}
```

For more information on how to customize runbooks, please refer to the [Runbook Customization Guide](https://docs.realmjoin.com/automation/runbooks/runbook-customization).


## Location
User → Userinfo → Update User

**Full Runbook name**

rjgit-user_userinfo_update-user

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.2 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>ExchangeOnlineManagement (>= 3.9.2) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - UserAuthenticationMethod.Read.All
    - *Reads the user's registered MFA methods to skip the password reset if MFA exists*
- **Type**: Office 365 Exchange Online
  - Exchange.ManageAsApp
    - *Opens the app-only Exchange Online session used for distribution groups and enabling the online archive*

### RBAC roles
- User Administrator
  - *Backs the profile updates, password reset, manager assignment and group adds*
- Exchange Administrator
  - *Required for the app-only Exchange Online session managing distribution groups and the online archive*


## Parameters
### UserName

User principal name of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### GivenName

New first name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | First name |

### Surname

New last name.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Last name |

### DisplayName

New display name as shown in Microsoft 365.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Display name |

### CompanyName

Company the user belongs to.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Company |

### City

City of the user's address.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### Country

Country of the user's address.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### JobTitle

Job title shown in the profile.

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

### OfficeLocation

Office or building the user works at.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Office location |

### PostalCode

Postal code of the user's address.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Postal code |

### PreferredLanguage

Language code such as en-US or de-DE.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Preferred language |

### State

State or region of the user's address.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |

### StreetAddress

Street and house number of the user's address.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Street address |

### UsageLocation

Two-letter country code that decides which licenses the user may get, for example DE.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Usage location |

### ManagerId

User who becomes the manager of this user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Manager |

### DefaultLicense

Display name of the group that assigns the license; the user is added to it.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | License group to assign |

### DefaultGroups

Display names of groups the user is added to, separated by commas.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Groups to add |

### EnableEXOArchive

Turns on the Exchange Online archive mailbox for the user.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Enable the archive mailbox? |

### ResetPassword

Sets a generated start password, shown in the output, that must be changed at the next sign-in. Skipped when the user already has MFA methods.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Reset the password? |



[Back to Runbook Reference overview](../../README.md)

