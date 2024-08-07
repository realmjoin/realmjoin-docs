# Available Settings

The following article shows you a list of possible RealmJoin Client Settings. These can be configured and assigned per [user or group](../user-group-device-management/).

### BranchCache.Mode

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

### Environment.Channel

This setting changes the user's / user group's channel with the next update of the RealmJoin Client.

**Key**\
Environment.Channel

**Value**

```
"release" | "beta" | "canary"
```

### AnyDesk Feature

This setting enables or disables the AnyDesk feature.

**Key**\
Integration.AnyDesk

**Value**

```json
{
"Enabled": true | false,
"BootstrapperUrl":"https://get.anydesk.com/GENERATED_LINK_TOKEN/RJAnyDesk.exe"
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

This section shows you all necessary settings for the LocalAdminManagement features. For more details about this feature read the [Local Admin Password Solution article](local-admin-password-solution-laps/).

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

This sections shows you four policies for RealmJoin.

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
