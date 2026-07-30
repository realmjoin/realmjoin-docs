---
type: User, Group & Device Management
description: >-
  Reference of available RealmJoin Client settings and policies configurable per
  user or group.
---

# Available RealmJoin Policies

The following article shows you a list of possible RealmJoin Client settings/policies. These can be configured and assigned per [user or group](../user-group-device-management.md).

Each setting consists of a **key** and a **value**:

* The key is a dot-separated path (for example `Integration.Notification`). RealmJoin merges the value into the client configuration at that path, on top of the [tenant-wide defaults](README.md#tenant-default-values).
* The value must be valid JSON — including plain values such as `true` or `"release"` (quoted, without brackets).

{% hint style="info" %}
A value of `undefined` **removes** the key from the effective configuration. Use this to drop a value that a broader scope (tenant-wide client config or "RealmJoin - All Users") has set, instead of overwriting it with a different value.
{% endhint %}

{% hint style="info" %}
The keys `Allow.*`, `Restrict.*` and `SoftwarePackageOverrides.*` are evaluated by the RealmJoin backend and are stripped from the configuration before it is sent to a device — they never reach the client.
{% endhint %}

### Allow users to access RealmJoin LAPS for their devices

Users may access different LAPS types for devices owned by visiting the RealmJoin portal.&#x20;

**Key**

Allow.SelfLAPS

**Value**

```
true | false
```

or per account type

```
{
  "EmergencyAccount": true,
  "SupportAccount": true,
  "PrivilegedAccount": true
}
```

See [Local Admin Password Solution (LAPS)](../../realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/#enable-self-service) for the full self-service description.

{% hint style="info" %}
`Allow.*` settings do not follow the usual "narrower scope wins" precedence. All values assigned to the user and to their groups are combined, and an explicit `false` always wins over any `true`.
{% endhint %}

{% hint style="warning" %}
`Allow.*` and `Restrict.*` are resolved against the user's **Entra ID group memberships**. Assigning them to the built-in "RealmJoin - All Users" group has no effect — use a real Entra ID group or assign them directly to the user.
{% endhint %}

### Allow users to access Intune LAPS for their devices

Users may access and rotate the LAPS password for their devices.

**Key**

Allow.SelfLAPSIntune

**Value**

```
true | false
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

Access is only granted to the device's primary user or registered owner. As with `Allow.SelfLAPS`, all assigned values are combined and an explicit `false` wins over any `true`.

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

{% hint style="info" %}
This setting is ignored on shared VDI clients — they always stay on the channel of their image.
{% endhint %}

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

These settings are primarily intended for Deployment/DEM users on shared devices. They are applied to **all** software packages assigned to the receiving user.

Forces the background installation flag on every package.

**Key**

SoftwarePackageOverrides.AllowBackgroundInstall

**Value**

```
true | false
```

Ignores the phase part of the [main app / user part restrictions](../../application-management/packages/package-settings.md) (Logon, Manual, Initial, Normal) of every package.

**Key**

SoftwarePackageOverrides.IgnorePhaseRestrictions

**Value**

```
true
```

Ignores the primary/secondary user part of those restrictions of every package.

**Key**

SoftwarePackageOverrides.IgnoreUserRestrictions

**Value**

```
true
```

{% hint style="info" %}
`IgnorePhaseRestrictions` and `IgnoreUserRestrictions` only take effect when set to `true`; `false` is the same as not setting them at all. Restrictions can only be lifted this way, never added.

When the device's primary user is a deployment (DEM) user, these overrides also apply to the packages that secondary users inherit from that deployment user.
{% endhint %}

### AnyDesk Feature

This setting enables or disables the [AnyDesk feature](../../realmjoin-agent/realmjoin-client/anydesk-integration/).

**Key**\
Integration.AnyDesk

**Value**

```json
{
"Enabled": true | false,
"BootstrapperUrl": "https://.../.../AnyDesk.exe",
"CustomClientSuffix": "myorg",
"Ui": {
    "TrayMenuTextEnglish": "Start remote session"
  }
}
```

* **Enabled:** Turns the AnyDesk integration on or off.
* **BootstrapperUrl:** Download location of the AnyDesk client used by the integration.
* **CustomClientSuffix:** Suffix of your custom AnyDesk client. It is used to build the `anydesk:` link the RealmJoin Portal opens when starting a session. Leave it out when using the generic client.
* **Ui.TrayMenuTextEnglish:** Caption of the entry in the RealmJoin tray menu. Defaults to `"Start remote session"`.

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

This setting enables or disables the [Notifier feature](../../realmjoin-agent/realmjoin-client/showing-notifications.md) and it also activates or deactivates the editor UI.

**Key**\
Integration.Notification

**Value**

```json
{
"Enabled": true | false,
"SourceUrl": "URL_PROVIDED_BY_GK",
"FallbackCulture": "en",
"CheckInterval": "00:01"
}
```

* **Enabled:** Turns the Notifier on or off.
* **SourceUrl:** Location of the notification definitions. This value is created by RealmJoin when the feature is enabled for your tenant — do not change it.
* **FallbackCulture:** Language used when a notification has no content for the user's language. Defaults to `"en"`.
* **CheckInterval:** How often the client checks for new notifications ([HH:mm](https://learn.microsoft.com/en-us/dotnet/standard/base-types/standard-timespan-format-strings)). Defaults to `"00:01"`.

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
    "DisplayName": "Local Emergency Account",
    "PasswordCharSet": "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz",
    "PasswordLength": 14
}
```

**Key**\
LocalAdminManagement.SupportAccount

**Value**

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

**Key**\
LocalAdminManagement.PrivilegedAccount

**Value**

```json
{
    "NamePattern": "Privileged-User-{COUNT:1}",
    "DisplayName": "Privileged User",
    "PasswordRenewals": ["DayAfterCreate", "Monthly", "Thursday"],
    "PasswordPreset": 3,
    "PasswordLength": 3
}
```

{% hint style="info" %}
All three account types share the same common properties (`NamePattern`, `DisplayName`, `PasswordCharSet`, `PasswordLength`, `PasswordPreset`, `MaxStaleness`). `OnDemand` and `Expiration` are specific to the support account, `Expiration` and `PasswordRenewals` to the privileged account. An account type that is not configured at all stays inactive. The [LAPS article](../../realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/) describes every property, the defaults and the password presets in detail.
{% endhint %}

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

Assign this setting to the groups of the **device owners** you want to protect. It then restricts which administrators may use LAPS on the devices of those users.

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

Each property holds the object IDs of Entra ID groups. One list exists per RealmJoin role:

```
"Admin" | "Auditor" | "Supporter" | "AdvancedSupporter" | "RunbookRunner" |
"SoftwareAgent" | "SoftwareRequester" | "OrganicRequester" | "NotificationAgent" | "Deny"
```

{% hint style="warning" %}
The lists are inclusive: as soon as at least one list is filled, only administrators who hold the matching RealmJoin role **and** are a member of one of the groups listed for that role may use LAPS on these devices. Everyone else is denied.

Membership in a group listed under `Deny` always denies access, regardless of the other lists. Global admins are never restricted.
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
