# Settings

The following article shows you a list of possible RealmJoin Settings. These can be configured in [RealmJoin Classic](https://realmjoin-web.azurewebsites.net/).

### BranchCache.Mode

This setting changes BranchCache mode for **new** clients.

**Key**  
BranchCache.Mode

**Value**

```text
"Distributed"|"Undefined"
```

### Configure DomainConnect for Legacy Domains

The following settings configure DomainConnect for legacy domains.

**Key**  
DomainConnect.CredentialName

**Value**

```text
"RealmJoin (domain)"
```

**Key**  
DomainConnect.Domain

**Value**

```text
"domain.contoso.net"
```

**Key**  
DomainConnect.NetBIOS

**Value**

```text
"contoso"
```

### Environment.Channel

With this setting the user group switch channel on next auto-update.

**Key**  
Environment.Channel

**Value**

```text
"release" | "beta" | "canary"
```

### AnyDesk Feature

This setting enables or disables the AnyDesk feature.

**Key**  
Integration.AnyDesk

**Value**

```json
{
"Enabled": true, | false,
"BootstrapperUrl":"https://get.anydesk.com/GENERATED_LINK_TOKEN/RJAnyDesk.exe"
}
```

### ExecutionMonitor Feature

This setting enables or disables the ExecutionMonitor Feature.

**Key**  
Integration.ExecutionMonitor

**Value**

```json
{
"Enabled": true | false,
"UpdateInterval": "08:00"
}
```

### Notifier Feature

This setting enables or disables the Notifier featire and it also activates or deactivates the editor UI.

**Key**  
Integration.Notification

**Value**

```json
{
"Enabled": true | false,
"SourceUrl": "URL_PROVIDED_BY_GKGAB",
"FallbackCulture": "en"
}
```

### LocalAdminManagement Features

This section shows you all necessary settings for the LocalAdminManagement features. For more details about this features read [Local Admin Password Solution article](local-admin-password-solution-laps/README.md).

**Key**  
LocalAdminManagement.Inactive

**Value**

```text
false
```

**Key**  
LocalAdminManagement.CheckInterval

**Value**

```text
"00:05"
```

**Key**  
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

**Key**  
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

**Key**   
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

**Key**  
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
Attach Restrict. \*keys to target user group. This list is inclusive: Only those Admin and Support groups listed are allowed to use LAPS. Additionally usergroups can be excluded.
{% endhint %}

### Various Toggles

This sections shows you four policies for RealmJoin.

**Key**  
Policies.DisableNetworkLocationWizard

**Value**

```text
true | false
```

**Key**  
Policies.RequireSecurityFeatures.BitlockerEnabled

**Value**

```text
true | false
```

**Key**  
Policies.SetCurrentUserAdministrator

**Value**

```text
true | false
```

**Key**  
Policies.SetTimeserver

**Value**

```text
"pool.ntp.org"
```

