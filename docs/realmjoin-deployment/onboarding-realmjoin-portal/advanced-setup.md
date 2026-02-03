---
description: >-
  The Advanced Setup allows you to assign permissions in a more granular and
  customized way. This approach is more flexible but more complex and requires
  running the RealmJoin PowerShell module.
---

# Advanced Setup

## Recommended Setup

The setup command displayed by the RealmJoin Portal will provide permissions for:

* Core features
* Intune LAPS
* Sign-in data
* Remediation scripts
* Autopilot
* Intune device actions

To add all features or individual features, see [Other Commands](advanced-setup.md#other-commands).

{% stepper %}
{% step %}
### Open PowerShell on Windows/Mac

We recommend installing and running the RealmJoin PowerShell module on your device's PowerShell rather than Azure CloudShell.
{% endstep %}

{% step %}
### Copy and Run the RealmJoin Onboarding Script

The script will prompt you to authenticate with Microsoft Graph. Sign in with your Global Administrator.

<figure><img src="../../.gitbook/assets/Snipaste_2026-01-27_12-00-54.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Snipaste_2026-01-28_18-16-31.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Snipaste_2026-01-27_12-00-54.png" alt=""><figcaption></figcaption></figure>
{% endstep %}

{% step %}
### Begin using RealmJoin

Once finished, the script will launch the RealmJoin Portal

<figure><img src="../../.gitbook/assets/Snipaste_2026-01-27_12-18-57.png" alt=""><figcaption></figcaption></figure>
{% endstep %}
{% endstepper %}

## Other Commands

### Interactive Setup

For a guide, menu-driven experience:

```
Show-RJInteractiveSetup 6>&1
```

### Custom Configuration

#### Minimal Features (only mandatory features)

```
New-RJTenant -Features @() 6>&1
```

#### Full Feature Set

```
New-RJTenant -All 6>&1
```

#### Read-Only Permissions

```
New-RJTenant -ReadOnly 6>&1
```

#### Custom Feature Selection

```
New-RJTenant -Features @('RealmJoinPortal', 'IntuneLAPS', 'Autopilot') 6>&1
```

### Updating Existing Configuration

#### Add New Features

```
Update-RJTenant -AddFeatures @('SecurityFeatures') 6>&1
```

#### Remove Features

```
Update-RJTenant -RemoveFeatures @('ShowSignin') 6>&1
```

#### Switch to Read-Only Permissions

```
Update-RJTenant -ReadOnly 6>&1
```

#### Preview Changes

```
Update-RJTenant -AddFeatures @('SecurityFeatures') -WhatIf 6>&1
```

### Getting Help

```
Get-Help New-RJTenant -Full
Get-Help Update-RJTenant -Examples
Get-Help Show-RJInteractiveSetup -Detailed
```



