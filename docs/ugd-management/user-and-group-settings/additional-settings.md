---
type: User, Group & Device Management
description: >-
  Reference of available RealmJoin Client settings and policies configurable per
  user or group.
---

# Available RealmJoin Policies

The following article shows you a list of possible RealmJoin Client settings/policies. These can be configured and assigned per [user or group](../user-group-device-management.md).



### Allow users to access RealmJoin LAPS for their devices

Users may access different LAPS types for devices owned by visiting the RealmJoin portal.&#x20;

**Key**

Allow.SelfLAPS

**Value**

```
"true"|"false"
```

or per account type

```
{
  "EmergencyAccount": true,
  "SupportAccount": true,
  "PrivilegedAccount": true
}
```

### Allow users to access Intune LAPS for their devices

Users may access and rotate the LAPS password for their devices.

**Key**

Allow.SelfLAPSIntune

**Value**

```
"true"|"false"
```

or specifically:

```
{
  "CanReadPassword": true,
  "CanRotatePassword": false
}
```

Starting with **Portal v2026.29**, access can be scoped **per platform** (Windows/macOS). A platform-specific property overrides the generic `CanReadPassword`/`CanRotatePassword` for the matching device platform:

```
{
  "CanReadPasswordWindows": true,
  "CanRotatePasswordWindows": true,
  "CanReadPasswordMacOS": true,
  "CanRotatePasswordMacOS": false
}
```

A plain string value acts like `true` for the matching platform only:

```
"windows"|"macos"
```

### Configure BranchCache for RJ packages

This setting changes BranchCache mode for **new** clients.

**Key**\
BranchCache.Mode

**Value**

```
"Distributed"|"Undefined"
```

### Configure DomainConnect for Legacy Domains

The following settings configure DomainConnect for legacy domains.

**Key**\
DomainConnect.CredentialName

**Value**

```
"RealmJoin (domain)"
```

**Key**\
DomainConnect.Domain

**Value**

```
"domain.contoso.net"
```

**Key**\
DomainConnect.NetBIOS

**Value**

```
"contoso"
```

### Configure RealmJoin release channel

This setting changes the user's / user group's channel with the next update of the RealmJoin Client.

**Key**\
Environment.Channel

**Value**

```
"release" | "beta" | "canary"
```

### Configure RealmJoin ESP

Change if the default reboot after initial RealmJoin agent installation.

**Key**

FirstRun.AfterSuccessAction

**Value**

```
"none" | "logoff" | "restart"
```



Change if the RJ ESP is displayed. &#x20;

If the deployment screen needs to be disabled for secondary users, the system variable _$env:RjDisableSecondaryInitialDeployment = 1_ has to be set before the first SU login.

**Key**

FirstRun.DisableDeploymentScreen

**Value**

```
"true" | "false"
```



Show deployment screen on restricted or secure desktop.

**Key**

FirstRun.EnableSecureDesktop

**Value**

```
"true" | "false"
```

### Allow downgrade of packages <a href="#softwarepackaging.autoupgradecandowngrade" id="softwarepackaging.autoupgradecandowngrade"></a>

Allows downgrade of already installed applications via auto upgrade, if the version number is changed. Applies to all packages assigned to users receiving the policy via group or user settings.

**Key**

SoftwarePackaging.AutoUpgradeCanDowngrade

**Value**

```
"true" | "false"
```

### Global override of software package behavior

These settings are primarily intended for Deployment/DEM users on shared devices

**Key**

SoftwarePackageOverrides.AllowBackgroundInstall

**Value**

```
true | false
```

**Key**

SoftwarePackageOverrides.IgnorePhaseRestrictions

**Value**

```
true
```

**Key**

SoftwarePackageOverrides.IgnoreUserRestrictions

**Value**

```
true
```

### AnyDesk Feature

This setting enables or disables the AnyDesk feature.

**Key**\
Integration.AnyDesk

**Value**

```json
{
"Enabled": true | false,
"BootstrapperUrl": "https://.../.../AnyDesk.exe"
}
```

### ExecutionMonitor Feature

This setting enables or disables the ExecutionMonitor Feature.

**Key**\
Integration.ExecutionMonitor

**Value**

```json
{
"Enabled": true | false,
"UpdateInterval": "08:00"
}
```

### Notifier Feature

This setting enables or disables the Notifier feature and it also activates or deactivates the editor UI.

**Key**\
Integration.Notification

**Value**

```json
{
"Enabled": true | false,
"SourceUrl": "URL_PROVIDED_BY_GK",
"FallbackCulture": "en"
}
```

### LocalAdminManagement Features

This section shows you all necessary settings for the LocalAdminManagement features. For more details about this feature read the [Local Admin Password Solution article](../../realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/).

**Key**\
LocalAdminManagement.Inactive

**Value**

```
false
```

**Key**\
LocalAdminManagement.CheckInterval

**Value**

```
"00:05"
```

**Key**\
LocalAdminManagement.EmergencyAccount

**Value**

```json
{
    "MaxStaleness": "00:45",
    "NamePattern": "ADM-{HEX:4}",
    "Display": "Local Emergency Account",
    "PasswordCharSet": "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz",
    "PasswordLength": 14
}
```

**Key**\
LocalAdminManagement.SupportAccount

```json
{
    "MaxStaleness": "00:45",
    "NamePattern": "ADM-{HEX:4}",
    "DisplayName": "Local Support Administrator",
    "PasswordCharSet": "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz",
    "PasswordLength": 14,
    "OnDemand": true | false
}
```

### AppCatalog Feature

This setting controls native, one-click access to the [App Catalog](../../realmjoin-agent/client-menu/self-service-portal.md#app-catalog-tab) from the RealmJoin tray menu and Windows Start Menu.

**Key**\
AppCatalog

**Value**

```json
{
  "Enabled": true | false,
  "HidePackages": true | false,
  "CreateStartMenuShortcut": true | false
}
```

* **Enabled:** Adds an **App Catalog** entry to the RealmJoin tray menu that opens the device's App Catalog page in Microsoft Edge app mode.
* **HidePackages:** Hides the individual software packages from the classic tray "Install"/"Update" submenu, useful once users are directed to the App Catalog instead.
* **CreateStartMenuShortcut:** Requires `Enabled: true`. Creates a per-user Start Menu shortcut ("App Catalog") that opens the same page, so it can be found via Start search or pinned to the taskbar.

### Weblinks for RealmJoin Tray

The following setting generates a weblink in the tray.

**Key**\
WebLinks

**Value**

```json
[
  {
    "Name": "My Azure Account",
    "Target": "https://account.activedirectory.windowsazure.com/r/#/profile",
    "Platform": "any"
  },
  {
    "Name": "Outlook Web Access",
    "Target": "https://outlook.office365.com/owa/?realm=contoso.onmicrosoft.com",
    "Platform": "any"
  }
]
```

### Access Restrictions

{% hint style="info" %}
Currently only LAPS is supported
{% endhint %}

**Key**\
Restrict.LAPS

Value

```json
{
  "Admin": [
    "11-cf35-49dd-a862-123123",
    "11-2ec2-47ee-8cb8-123123"
  ],
  "Supporter": [
    "23-cf35-49dd-a862-231"
  ],
  "Deny": []
}
```

{% hint style="warning" %}
Attach Restriction: keys of targeted user groups. This list is inclusive: Only the listed Admin and Support groups are allowed to use LAPS. Additionally user groups can be excluded from the list.
{% endhint %}

### Various Toggles

This section shows you four policies for RealmJoin.

**Key**\
Policies.DisableNetworkLocationWizard

**Value**

```
true | false
```

**Key**\
Policies.RequireSecurityFeatures.BitlockerEnabled

**Value**

```
true | false
```

**Key**\
Policies.SetCurrentUserAdministrator

**Value**

```
true | false
```

**Key**\
Policies.SetTimeserver

**Value**

```
["time.windows.com", "time.apple.com", "pool.ntp.org"]
```
