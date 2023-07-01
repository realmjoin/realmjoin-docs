# Available Settings

The following article describes important settings for RealmJoin Client.

## Allow.SelfLAPS

#### Value

```
true | false
```

or per account type:

```
{
  "EmergencyAccount": true,
  "SupportAccount": true,
  "PrivilegedAccount": true
}
```

#### Description

See [LAPS](../../realmjoin-client/local-admin-password-solution-laps/).

## BranchCache.Mode

**Value**

```
"Distributed"|"Undefined"
```

**Description**

This setting changes BranchCache mode for **new** clients.

## **DomainConnect.CredentialName**

**Value**

```
"RealmJoin (domain)"
```

**Description**

## DomainConnect.Domain

**Value**

```
"domain.contoso.net"
```

**Description**

## DomainConnect.NetBIOS

**Value**

```
"contoso"
```

**Description**

## Environment.Channel

**Value**

```
"release" | "beta" | "canary"
```

**Description**

With this setting the user group switch channel on next auto-update. **This setting enforces the channel and might lead to a downgrade!**

## FirstRun.AfterSuccessAction

**Value**

```
"none" | "logoff" | "restart"
```

**Description**

Action to perform after initial deployment screen (default is _restart_).

## FirstRun.DisableDeploymentScreen

**Value**

```
true | false
```

**Description**

Show deployment screen (default is _true_). If the deployment screen needs to be disabled for secondary users, the system variable _$env:RjDisableSecondaryInitialDeployment = 1_ has to be set before the first SU login.

## FirstRun.EnableSecureDesktop

**Value**

```
true | false
```

**Description**

Show deployment screen on restricted and secure desktop (default is _true_).

## Integration.AnyDesk

**Value**

```
{
"Enabled": true, | false,
"BootstrapperUrl":"https://get.anydesk.com/GENERATED_LINK_TOKEN/RJAnyDesk.exe"
}
```

**Description**

This setting enables or disables the [AnyDesk feature](../../realmjoin-client/anydesk-integration/).

## **Integration.ExecutionMonitor**

**Value**

```
{
"Enabled": true, | false,
"UpdateInterval": "08:00"
}
```

**Description**

This setting enables or disables the ExecutionMonitor Feature.

## **Integration.Notification**

**Value**

```
{
"Enabled": true, | false,
"SourceUrl": "URL_PROVIDED_BY_GKGAB",
"FallbackCulture": "en"
}
```

**Description**

This setting enables or disables the Notifier feature and it also activates or deactivates the editor UI.

## LocalAdminManagement.CheckInterval

**Value**

```
"00:05"
```

**Description**

With this setting you confiure the interval for configuration checks (hh:ss).

## LocalAdminManagement.EmergencyAccount

**Value**

```
{
    "MaxStaleness": "00:45",
    "NamePattern": "ADM-{HEX:4},
    "Display": "Local Emergency Account",
    "PasswordCharSet": "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz",
    "PasswordLength": 14
}
```

**Description**

With this setting you can configure an emergency account. For more details about local admin management read our corresponding '[Local Admin Password Solution](../../realmjoin-client/local-admin-password-solution-laps/)' article.

## LocalAdminManagement.SupportAccount

**Value**

LocalAdminManagement.SupportAccount

```
{
    "MaxStaleness": "00:45",
    "NamePattern": "ADM-{HEX:4}",
    "DisplayName": "Local Support Administrator",
    "PasswordCharSet": "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz",
    "PasswordLength": 14,
    "OnDemand": true | false
}
```

**Description**

With this setting you can configure a support account. For more details about local admin management read our corresponding '[Local Admin Password Solution](../../realmjoin-client/local-admin-password-solution-laps/)' article.

## LocalAdminManagement.Inactive

**Value**

```
false
```

**Description**

This setting activates or deactivates local administrator management. For more details about local admin management read our corresponding '[Local Admin Password Solution](../../realmjoin-client/local-admin-password-solution-laps/)' article.

## Policies.DisableNetworkLocationWizard

**Value**

```
true | false
```

**Description**

With this setting you can activate or deactivate the network location wizard.

## Policies.RequireSecurityFeatures.BitlockerEnabled

**Value**

```
true | false
```

**Description**

With this setting you can enable or disable Bitlocker.

## Policies.SetCurrentUserAdministrator

**Value**

```
true | false
```

**Description**

This policy sets the current user as administrator.

## Policies.SetTimeserver

**Value**

```
"pool.ntp.org"
```

**Description**

With this setting the current time is available via NTP. For more information about it, read the [pool.ntp.org documentation](https://www.pool.ntp.org/en/).

## Restrict.LAPS

**Value**

```
{
"Admin": [
    "5c9e9c23-7b14-4d97-90d0-4841f2d4b520",
    "4508f67c-d85e-4c15-82f1-ec5e4adb7c6c"
    ],
"Deny":[
    "a5baa9d5-5545-41d7-aea8-19058b29b182"
    ]
}
```

{% hint style="warning" %}
Attach Restrict. \*keys to target user group
{% endhint %}

## SoftwarePackaging.AutoUpgradeCanDowngrade

**Value**

```
true
```

**Description**

Allows downgrade of already installed applications via auto upgrade, if the version number is changed.

## SoftwarePackaging.Toast.Countdown.Hero.Source

**Value**

{% hint style="warning" %}
The following value is an URL example for the hero image source.
{% endhint %}

```
"http://images.example.com/hero.png"
```

The correct size for a Hero Image is 364x180 px or 728x360 px. More details can be found in the [Microsoft documentation](https://docs.microsoft.com/en-us/windows/uwp/design/shell/tiles-and-notifications/adaptive-interactive-toasts#hero-image). The image needs to be in the PNG format and the name has to be the SHA1 value of the file.

## WebLinks

**Value**

```
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

**Description**

With this setting you can add weblinks to the tray menu of RealmJoin.
