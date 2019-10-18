
# Local Administrator Password Solution and RealmJoin

Local Administrator Password Solution (short LAPS) is a Microsoft tool which will solve the issue of using an identical password on every Windows computer.

With RealmJoin it is possible that you can manage administrators, either for local support or remote support. Of course you can create accounts as well. RealmJoin saves encrypted passwords at customers site and RealmJoin records accesses to these passwords.

## Prerequirements

### Application Insights

Application Insights are an important part of LAPS. Click [here](appinsights.md) to see details about Application Insights:

### Group Configuration

| Key | Default Value | Sample Value | Description |
| --- | ------------- | ------------ | ----------- |
| **LocalAdminManagement.EmergencyAccount** | | | |
| .NamePattern | "ADM-{HEX:8}" | "Admin-{HEX:4}" | |
| .DisplayName | "RealmJoin Local Administrator" | "Local Emergency Admin" | Display name of administrator account (appears on Windows) |
| .PasswordCharSet | See notes[^1] | "0123456789ABCDEFabcdef" | Charset of the password |
| .PasswordLength | 20 | 30 | |
| .MaxStaleness | | "00:45" | Delete and recreate profile 45 min. after last use. |
| **LocalAdminManagement.SupportAccount**| | | |
| .NamePattern | "ADM-{HEX:8}" | "Admin-{HEX:4}"
| .DisplayName | "RealmJoin Local Administrator" | "Local Support Admin" | Display name of administrator account (appears on Windows) |
| .PasswordCharSet | See notes[^1] | "0123456789ABCDEFabcdef" | Charset of the password |
| .PasswordLength | 20 | 30 | | |
| .MaxStaleness | | "08:00" | Delete and recreate profile 8 hours after last use. |
| .OnDemand | | true | Create support account only when requested through RealmJoin Portal. Account will expire after 12 hours. |
| LocalAdminManagement.Inactive | | true | Kill switch. Remove all accounts from all clients |
|                               | | false | CFG - RealmJoin-EnableSupportAdmin |

[^1] Excludes similar looking characters:  
```!#%+23456789:=?@ABCDEFGHJKLMNPRSTUVWXYZabcdefghijkmnopqrstuvwxyz```

## Access

When a support member needs to access a secret, RealmJoin will provide an interface to get account and password. When this happens, an update-secret command will be send to the client and the admin account will be recreated.

<!-- Screenshot der UI einfügen - Jan Berdel nach einem Screenshot fragen -->

## Administrator Account Types

Two different account types are available. An **Emergency Administrator Account** and a **Support Administrator Account**

### Emergency Administrator Account

This account type will be created by default and is **available persistently** on the device. Thus, it is possible to get administrative access even when there is no internet connection available or when facing other connection problems.

A corresponding RealmJoin policy can trigger the creation of a persistent administrator account. The following process will be passed:

1. Starting point: Existing or new client with RealmJoin  
a) Existing client (Azure AD joined, Intune managed, RealmJoin agenda installed)  
b) New client (initialization during OOBE, Azure AD join, Intune enrollment, installation of RealmJoin and deployed software)

2. RealmJoin policy triggers RealmJoin agent to create a persistent administrator account on the client.
3. RealmJoin agent transfers the encrypted password to the RealmJoin backend.
4. RealmJoin backend stores the cyphertext into a customer owned [Azure Key Vault](keyvault.md).

A requirement for this process is a successful deployment of corresponding policy to the client.

#### Use in case of support

A support staff needs local administrative rights in field support (e. g. for troubleshooting connectivity issues). Therefore, he/she must go through the following steps:

1. The staff visits the RealmJoin WebUI. On the device details he/she will see the name of the administrator account and can request the password when clicking on the dotted text.

[![Request password for emergency admin](./media/rj-laps1.png)](./media/rj-laps1.png)

2. RealmJoin pulls the password from Azure Key Vault and displays it.
3. The staff is now able to get elevated rights with entering this username and password in the UAC credential prompt or performing a re-login as an administrator.
4. When the staff has finished all tasks, he/she logs out of the account.
5. The previously used account will be deleted after a defined period and a new one will be generated (following to steps already described).

### Support Administrator Account

A support account will be generated **on demand** and is designed for **one-time use**.

A support staff can trigger the creation of a temporal administrator account. The following process will be passed:

1. Starting point: Existing or new client with RealmJoin  
a) Existing client (Azure AD joined, Intune managed, RealmJoin agent installed)  
b) New client (initialization during OOBE, Azure AD join, Intune enrollment, installation of RealmJoin and deployed software)

2. A Support staff requests a support account via RealmJoin WebUI
3. This triggers RealmJoin agent to create a temporal administrator account on the client.
4. RealmJoin agent transfers the encrypted password to the RealmJoin backend.
5. RealmJoin backend stores the cyphertext into customer owned [Azure Key Vault](keyvault.md).

Requirements for this process:

* Successful deployment of corresponding of client.
* User is logged in and RealmJoin agent is running.
* Internet connectivity.

#### Use in case of support

The support staff visits the RealmJoin WebUI again (depends on the **Configuration check interval**) and follows these steps:

1. On the device details he/she will see the name of the temporal administrator account. The account creation will be started when clicking on **Request**.

[![Request password for support admin](./media/rj-laps2.png)](./media/rj-laps2.png)

> [!NOTE]
> After a certain time, the credentials will appear. Click the dotted password field to request the password.

2. RealmJoin pulls the password from Azure Key Vault and displays it.

[![Request password for emergency admin](./media/rj-laps3.png)](./media/rj-laps3.png)

3. The staff is now able to get elevated rights with entering this username and password in the UAC credential prompt or performing a re-login as an administrator.
4. When the staff has finished his tasks, he/she logs out of the account.
5. The previously used account will be deleted after a defined period