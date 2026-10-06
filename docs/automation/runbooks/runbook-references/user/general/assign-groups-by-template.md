---
title: Assign Groups By Template
description: Add this user to a predefined set of groups
---

## Description
Adds this user to one or more Entra ID groups. The groups come from a template that an administrator defines in the runbook customization, so the person running it picks a template instead of individual groups.

## Define the templates via runbook customization

The templates the users can pick are defined once per tenant in the runbook customization. Each template presets the group list (`GroupsString`); `UseDisplaynames` decides whether that list holds object IDs (`false`) or display names (`true`).

```json
{
    "Templates": {
        "Options": [
            {
                "$id": "GroupsTemplates",
                "$values": [
                    {
                        "Display": "User template 1 (object IDs)",
                        "Customization": {
                            "Default": {
                                "GroupsString": "c1f8e69f-e6c0-4e7e-b49d-241046958aa3,98c19df0-0bc1-4236-92b9-12559e1127d3"
                            }
                        }
                    },
                    {
                        "Display": "User template 2 (display names)",
                        "Customization": {
                            "Default": {
                                "GroupsString": "app - Microsoft VC Redistributable 2013"
                            }
                        }
                    }
                ]
            }
        ]
    },
    "Runbooks": {
        "rjgit-user_general_assign-groups-by-template": {
            "ParameterList": [
                {
                    "Name": "GroupsTemplate",
                    "Select": {
                        "Options": {
                            "$ref": "GroupsTemplates"
                        }
                    }
                },
                {
                    "Name": "UseDisplaynames",
                    "Default": false
                }
            ]
        }
    }
}
```

For more information on how to customize runbooks, please refer to the [Runbook Customization Guide](https://docs.realmjoin.com/automation/runbooks/runbook-customization).


## Location
User → General → Assign Groups By Template

**Full Runbook name**

rjgit-user_general_assign-groups-by-template

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Group.ReadWrite.All
    - *Resolves the template's groups, reads their members and adds the user via members@odata.bind*


## Parameters
### UserId

Object ID of the user the runbook acts on. Set by the portal from the selected user.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### GroupsTemplate

Template that decides which groups the user joins. The available templates are set up in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Group template |

### GroupsString

Groups to add the user to, separated by commas. Usually filled in by the selected template.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Groups |

### UseDisplaynames

Whether the group list contains display names instead of object IDs. Preset in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

