
# Local Administrator Password Solution and RealmJoin

Local Administrator Password Solution (short LAPS) is a Microsoft tool which will solve the issue of using an identical password on every Windows computer.

With RealmJoin it is possible that you can manage administrators, either for local support or remote support. Of course you can create accounts as well. RealmJoin saves encrypted passwords at customers site and RealmJoin records accesses to these passwords.

## Prerequirements

### Application Insights

Application Insights are an important part of LAPS. Click the [here](appinsights.md) to see details about Application Insights:

### Group Configuration

| Key | Default Value | Sample Value | Description |
| --- | ------------- | ------------ | ----------- |
| **LocalAdminManagement.EmergencyAccount** | | | |
| .NamePattern | "ADM-{HEX:8}" | "Admin-{HEX:4}" | |
| .DisplayName | "RealmJoin Local Administrator" | "Local Emergency Admin" | |
| .PasswordCharSet | See notes[^1] | "0123456789ABCDEFabcdef" | |
| .PasswordLength | 20 | 30 | |
| .MaxStaleness | | "00:45" | Delete and recreate profile 45 min. after last use. |
| **LocalAdminManagement.SupportAccount**| | | |
| .NamePattern | !ADM-{HEX:8}" | "Admin-{HEX:4}"
| .DisplayName | "RealmJoin Local Administrator" | "Local Support Admin" | |
| .PasswordCharSet | See notes[^1] | "0123456789ABCDEFabcdef" | |
| .PasswordLength | 20 | 30 | | |
| .MaxStaleness | | "08:00" | Delete and recreate profile 8 hours after last use. |
| .OnDemand | | true | Create support account only when requested through RealmJoin Portal. Account will expire after 12 hours. |
| LocalAdminManagement.Inactive | | true | Kill switch. Remove all accounts from all clients |

[^1] Excludes similar looking characters:  
```!#%+23456789:=?@ABCDEFGHJKLMNPRSTUVWXYZabcdefghijkmnopqrstuvwxyz```

## Access

When a support member needs to access a secret, RealmJoin will provide an interface to get account and password. When this happens, an update-secret command will be send to the client and the admin account will be recreated.

<!-- Screenshot der UI einfügen - Jan Berdel nach einem Screenshot fragen -->

## On-demand account

An On-demand account will be created when a user requires it in the UI. This creation takes approximately 30 minutes. When an on-demand account is not in use for 12 hours it will be expired automatically.