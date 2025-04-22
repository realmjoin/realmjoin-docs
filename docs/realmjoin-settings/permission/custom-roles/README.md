# Custom Roles

## Overview

**Custom Roles** is an optional feature in RealmJoin Portal and allows to create additional RealmJoin internal roles. You can assign granular / atomic permissions to these roles and bind them to Entra groups or dedicated users.

{% hint style="info" %}
If custom roles are needed, please **request activation via RealmJoin support**.
{% endhint %}

Custom Roles are defined as JSON. The JSON editor included in RealmJoin Portal offers syntax checking and highlighting and will verify your definition against the Custom Roles JSON schema.&#x20;

<figure><img src="../../../../.gitbook/assets/image (203).png" alt=""><figcaption><p>Custom Roles JSON Editor</p></figcaption></figure>

## Using the editor

### Syntax check / Errors

The editor will check the syntax as you type. If a syntax error is detected, an error message **View x errors** and bug icon will appear next to **Save.**

<figure><img src="../../../../.gitbook/assets/image (62).png" alt=""><figcaption><p>JSON error message/button</p></figcaption></figure>

Click on this message to get more details about the error.

### Formatting

You can auto-format the JSON by clicking **Format** in the upper right corner of the page.

<figure><img src="../../../../.gitbook/assets/image (107).png" alt=""><figcaption><p>Format Button</p></figcaption></figure>

### Auto-Complete

The Editor can offer Auto-Complete known keywords (like permissions) from the schema.

<figure><img src="../../../../.gitbook/assets/image (94).png" alt=""><figcaption><p>Keyword Auto-Complete</p></figcaption></figure>

You can press "Ctrl" + "Space" at any time to invoke Auto-Complete.

## Rules

A role is described as a pair of permissions and users and/or groups these permissions are given to.

Roles are listed as part of an array (list) under the keyword **Rules**.

Example set of rules:

```json
{
  "Rules": [
    {
      "Name": "Default: Supporters can change primary user [27e589a7]",
      "Description": "Default rule to allow members of a Supporter group to change the primary user of RealmJoin joined devices. Please keep the ID that is included its name.",
      "Groups": [
        "f31f5765-f56f-47fa-9248-ac2d77221634",
        "422e6b7c-bd99-4082-be1c-88cbc2bb2734"
      ],
      "Permissions": [
        "CanChangeRealmJoinPrimaryUser"
      ]
    },{
      "Name": "Allow John to add new Self Service Forms",
      "Users": [
        "b31f5765-f56f-47fa-9248-ac2d77221622"
      ],
      "Permissions": [
        "CanAddSelfServiceForms"
      ]
    }
  ]
}
```

### Name and Description

**Name** is required, **Description** is optional.&#x20;

Both are plain text fields (string).

### Permissions

A permission is a unique string, identifying a certain action in RealmJoin Portal. **Permissions** is a list (array) of permissions.

See [Available Permissions](available-permissions.md) for a list and description of common permissions.

### Groups

A list (array) of Entra group object IDs. Given [permissions](./#permissions) will be assigned to all users that are members of these groups.

### Users

A list (array) of Entra user object IDs. Given [permissions](./#permissions) will be assigned to these users.

