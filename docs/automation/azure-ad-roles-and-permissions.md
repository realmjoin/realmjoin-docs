---
description: >-
  This wiki pages addresses what requirements and (system-level) permissions
  have to be given, so that runbooks can be executed.
---

# Requirements

## PowerShell Modules

The shared runbooks available on [GitHub](https://github.com/realmjoin/realmjoin-runbooks) expect/use the following Windows PowerShell 5.1 modules:

* `RealmJoin.RunbookHelper`
* `Az.Accounts`
* `Az.Storage`
* `AzureAD`
* `ExchangeOnlineManagement`

RealmJoin Portal will automatically import and install these modules if referenced from inside a runbook. This import will also honor specified minimum versions for modules.

## Permissions

The RealmJoin shared runbooks use the Azure Automation's [system assigned managed identity](https://learn.microsoft.com/en-us/azure/automation/enable-managed-identity-for-automation) to interact with Entra ID, MS Graph API etc.

The following list of roles and permissions will enable you to use all runbooks currently available in our shared repository.

It is not recommended to reduce these roles/permissions as the runbooks are tested only against this set of permissions. If you reduce the set of roles/permissions, some runbooks will cease to function.

### Entra ID Roles

Please assign the following Entra ID roles to the managed identity

* User administrator
* Cloud device administrator
* Exchange administrator
* Teams administrator

### Graph API Permissions

Please grant the following Graph API-Permissions to the managed identity

* `AppCatalog.ReadWrite.All`&#x20;
* `Application.ReadWrite.All`&#x20;
* `AuditLog.Read.All`&#x20;
* `BitlockerKey.Read.All`&#x20;
* `Channel.Delete.All`&#x20;
* `ChannelMember.ReadWrite.All`&#x20;
* `ChannelSettings.ReadWrite.All`&#x20;
* `CloudPC.ReadWrite.All`&#x20;
* `Device.Read.All`&#x20;
* `DeviceLocalCredential.Read.All`&#x20;
* `DeviceManagementApps.ReadWrite.All`&#x20;
* `DeviceManagementConfiguration.ReadWrite.All`&#x20;
* `DeviceManagementManagedDevices.PrivilegedOperations.All`&#x20;
* `DeviceManagementManagedDevices.ReadWrite.All`&#x20;
* `DeviceManagementServiceConfig.ReadWrite.All`&#x20;
* `Directory.ReadWrite.All`&#x20;
* `Group.ReadWrite.All`&#x20;
* `IdentityRiskyUser.ReadWrite.All`&#x20;
* `InformationProtectionPolicy.Read.All`&#x20;
* `Mail.Send`&#x20;
* `Organization.Read.All`&#x20;
* `Place.Read.All`
* `Policy.Read.All`&#x20;
* `Reports.Read.All`&#x20;
* `RoleManagement.Read.All`&#x20;
* `Team.Create`&#x20;
* `TeamSettings.ReadWrite.All`&#x20;
* `User.ReadWrite.All`&#x20;
* `UserAuthenticationMethod.ReadWrite.All`&#x20;
* `WindowsUpdates.ReadWrite.All`

### Other App API Permissions

Please grant the following Office 365 Exchange Online API Permissions to the managed identity

* `Exchange.ManageAsApp`

Please grant the following WindowsDefenderATP API Permissions to the managed identity

* `Machine.Read.All`
* `Machine.Isolate`
* `Machine.RestrictExecution`
* `Ti.ReadWrite.All`

Please grant the following SharePoint API Permissions to the managed identity

* `User.Read.All`
* `Sites.Read.All`
* `Sites.FullControl.All`

### Granting Roles and Permissions

Granting permissions to Managed Identities can currently not be done using Azure Portal. We recommend using MS Graph / PowerShell scripting for this.&#x20;

You can find an example for this process [here](https://github.com/hcoberdalhoff/approle-and-directoryrole-granter).

### Azure Resource Permissions

Please give at least "Contributor" access to the subscription or resource group hosting the Azure Automation Account for the runbooks

Some runbooks will use an Azure Storage Account to store reports or backups. Please give at least "Contributor" access to the corresponding subscription or resource group. Most runbooks can then create the resources inside the resource group on their own.

## Authentication Methods

### Managed Identities

Azure Automation supports [Managed Identities](https://docs.microsoft.com/en-us/azure/automation/enable-managed-identity-for-automation) (system assigned) as the primary to way to authenticate. This replaces the deprecated RunAs Accounts.&#x20;

The RealmJoin Runbooks currently support RunAs Accounts if no managed identity is configured.

{% hint style="warning" %}
If a Managed Identity and a RunAs Account are configured at the same time, the runbooks from RealmJoin's shared repository will automatically prefer using the Managed Identity when using newer versions of our supporting `RealmJoin.RunbookHelper` Module starting with v0.8.0.&#x20;

Older versions of the module could not fully utilize Managed Identities and preferred the RunAs Account.&#x20;

Please make sure, that you grant the needed permissions to Managed Identity or disable it completely to only use the RunAs Account.&#x20;
{% endhint %}

### Client Secret

Some private runbooks may need a ClientID/Secret-style authentication. There are currently no shared runbooks that require ClientID and Secret.

If needed, a ClientID and Secret can be stored in the managed credentials named "realmjoin-automation-cred" in the Azure Automation Account.

Currently the "realmjoin-automation-cred" in the automation account is created by the RJ-Wizard by default, but filled with random values - they would have to be filled with correct values.

### User Account (Problematic)

Older modules may need a "real" user object to operate.&#x20;

{% hint style="info" %}
Microsoft Teams is now able to operate via Managed Identity. All Voice/Phone runbooks have been adapted to use Managed Identity.
{% endhint %}

If you want to use a fake user, you will have to

1. Create an (ADM-)User object, e.g. `ADM-ServiceUser.TeamsAutomation`
2. Assign a password to the user
3. Set the password to never expire (or track the password changes accordingly)
4. Disable MFA for this user / make sure conditional access is not blocking the user
5. Create a credentials object in the Azure Automation Account you use for the RealmJoin Runbooks, call the credentials e.g. `fakeuser` and store the credentials.

{% hint style="warning" %}
This is not a recommended approach and should be avoided. No default runbook uses this scenario anymore.
{% endhint %}
