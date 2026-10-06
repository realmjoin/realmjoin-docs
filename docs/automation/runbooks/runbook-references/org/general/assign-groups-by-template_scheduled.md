---
title: Assign Groups By Template (Scheduled)
description: Add the users of a group to a predefined set of groups
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Adds every user of a source group to the target groups of a template, on a schedule, so a whole population gets the same group set. Users in an exclusion group are skipped. The templates are defined in the runbook customization.

## Define the templates via runbook customization

The templates decide which target groups the users of the source group join. Each template presets the group list (`GroupsString`) and whether that list holds object IDs (`UseDisplaynames` = `false`) or display names (`true`).

```json
{
    "Templates": {
        "Options": [
            {
                "$id": "GroupsTemplates",
                "$values": [
                    {
                        "Display": "Template 1 (UseDisplaynames=false)",
                        "Customization": {
                            "Default": {
                                "GroupsString": "c1f8e69f-e6c0-4e7e-b49d-241046958aa3,98c19df0-0bc1-4236-92b9-12559e1127d3",
                                "UseDisplaynames": false
                            }
                        }
                    },
                    {
                        "Display": "Template 2 (UseDisplaynames=true)",
                        "Customization": {
                            "Default": {
                                "GroupsString": "app - Microsoft VC Redistributable 2013,app - VLC Player",
                                "UseDisplaynames": true
                            }
                        }
                    }
                ]
            }
        ]
    },
    "Runbooks": {
        "rjgit-org_general_assign-groups-by-template_scheduled": {
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
Organization → General → Assign Groups By Template (Scheduled)

**Full Runbook name**

rjgit-org_general_assign-groups-by-template_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.0.1 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - User.Read.All
    - *Reads member users of source, exclusion and target groups to compute who to add*
  - Group.ReadWrite.All
    - *Resolves groups and adds users to target groups via members@odata.bind batches*


## Parameters
### SourceGroupId

Every user in this group is processed.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Source group |

### ExclusionGroupId

Users in this group are skipped. Leave empty to process all users.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Exclusion group |

### GroupsTemplate

Template that decides which groups the users join. The available templates are set up in the runbook customization.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Group template |

### GroupsString

Target groups, separated by commas. Usually filled in by the selected template.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Groups |

### UseDisplaynames

Turn on when the group list holds display names instead of object IDs. Can be preset per template.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | True |
| Type | Boolean |
| Portal display name | Groups given as display names? |



[Back to Runbook Reference overview](../../README.md)

