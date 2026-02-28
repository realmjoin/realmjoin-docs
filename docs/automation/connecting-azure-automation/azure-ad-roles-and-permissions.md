---
description: >-
  This wiki pages addresses what requirements and (system-level) permissions
  have to be given, so that runbooks can be executed.
---

# Requirements

## PowerShell Modules

{% hint style="info" %} The PowerShell Modules section is automatically updated based on the <a href="https://github.com/realmjoin/realmjoin-runbooks">public repository</a>. {% endhint %}

The shared runbooks available on [GitHub](https://github.com/realmjoin/realmjoin-runbooks) expect/use the following Windows PowerShell modules:

| Module | Minimum version in runbooks |
|---|---|
| `Az.Accounts` | 5.3.2 |
| `Az.Compute` | 5.1.1 |
| `Az.DesktopVirtualization` | 5.4.1 |
| `Az.ManagementPartner` | 0.7.5 |
| `Az.Resources` | 9.0.1 |
| `Az.Storage` | 9.6.0 |
| `ExchangeOnlineManagement` | 3.9.2 |
| `Microsoft.Graph.Authentication` | 2.35.1 |
| `MicrosoftTeams` | 7.6.0 |
| `RealmJoin.RunbookHelper` | 0.8.5 |

RealmJoin Portal will automatically import and install these modules if referenced from inside a runbook. This import will also honor specified minimum versions for modules.

## Permissions

{% hint style="info" %} The Permissions section is automatically updated based on the <a href="https://github.com/realmjoin/realmjoin-runbooks">public repository</a>. {% endhint %}

The RealmJoin shared runbooks use the Azure Automation's [system assigned managed identity](https://learn.microsoft.com/en-us/azure/automation/enable-managed-identity-for-automation) to interact with Entra ID, MS Graph API etc.

The following list of roles and permissions will enable you to use all runbooks currently available in our shared repository.

It is not recommended to reduce these roles/permissions as the runbooks are tested only against this set of permissions. If you reduce the set of roles/permissions, some runbooks will cease to function.

### Entra ID Roles

Please assign the following Entra ID roles to the managed identity

* Application Developer
* Cloud Device Administrator
* Exchange Administrator
* Teams Administrator
* User Administrator

### Graph API Permissions

Please grant the following Graph API-Permissions to the managed identity

* `Application.Read.All`
* `Application.ReadWrite.OwnedBy`
* `AuditLog.Read.All`
* `BitlockerKey.Read.All`
* `CloudPC.ReadWrite.All`
* `Device.ReadWrite.All`
* `DeviceLocalCredential.Read.All`
* `DeviceManagementApps.ReadWrite.All`
* `DeviceManagementConfiguration.ReadWrite.All`
* `DeviceManagementManagedDevices.PrivilegedOperations.All`
* `DeviceManagementManagedDevices.ReadWrite.All`
* `DeviceManagementServiceConfig.ReadWrite.All`
* `Directory.Read.All`
* `Group.Create`
* `Group.ReadWrite.All`
* `GroupMember.ReadWrite.All`
* `IdentityRiskyUser.ReadWrite.All`
* `InformationProtectionPolicy.Read.All`
* `Mail.Send`
* `Organization.Read.All`
* `Place.Read.All`
* `Policy.Read.All`
* `Reports.Read.All`
* `RoleAssignmentSchedule.Read.Directory`
* `RoleManagement.Read.All`
* `RoleManagement.Read.Directory`
* `Team.Create`
* `TeamSettings.ReadWrite.All`
* `User.ReadWrite.All`
* `UserAuthenticationMethod.ReadWrite.All`
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

You can find an example for this process [here](https://github.com/Workplace-Foundation/approle-and-directoryrole-granter).

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
