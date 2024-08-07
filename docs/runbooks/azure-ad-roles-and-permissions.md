---
description: >-
  This wiki pages addresses what requirements and (system-level) permissions
  have to be given, so that runbooks can be executed.
---

# Azure AD Roles and Permissions

## Permissions

The RealmJoin shared runbooks use the Azure Automation's [system assigned managed indetity](https://learn.microsoft.com/en-us/azure/automation/enable-managed-identity-for-automation) to interact with AzureAD, MS Graph API etc.

The following list of roles and permissions will enable you to use all runbooks currently available in our shared repository, [except Phone-related runbooks](azure-ad-roles-and-permissions.md#user-account-problematic).

it is not recommended to reduce these roles/permissions as the runbooks are tested only against this set of permissions. If you reduce the set of roles/permissions, some runbooks will cease to function.

### AzureAD Roles

Please add the following AzureAD roles to the the managed identity

* User administrator
* Cloud device administrator
* Exchange administrator

### Graph API Permissions

Please grant the following Graph API-Permissions to the managed identity

* AuditLog.Read.All
* CloudPC.ReadWrite.All
* Device.Read.All
* DeviceManagementConfiguration.ReadWrite.All&#x20;
* DeviceManagementManagedDevices.PrivilegedOperations.All
* DeviceManagementManagedDevices.ReadWrite.All
* DeviceManagementServiceConfig.ReadWrite.All
* Directory.ReadWrite.All
* Group.ReadWrite.All
* IdentityRiskyUser.ReadWrite.All
* InformationProtectionPolicy.Read.All
* Policy.Read.All
* RoleManagement.Read.All
* Team.Create
* User.ReadWrite.All
* UserAuthenticationMethod.ReadWrite.All
* Reports.Read.All
* Place.Read.All
* Mail.Send

### Other App API Permissions

Please grant the following Office 365 Exchange Online API Permissions to the managed identity

* Exchange.ManageAsApp

Please grant the following WindowsDefenderATP API Permissions to the managed identity

* Machine.Read.All&#x20;
* Machine.Isolate&#x20;
* Machine.RestrictExecution

Please grant the following SharePoint API Permissions to the managed identity

* User.Read.All&#x20;
* Sites.Read.All&#x20;
* Sites.FullControl.All

### Granting Roles and Permissions

Granting permissions to Managed Identities can currently not be done using Azure Portal. We recommend to use MS Graph / PowerShell scripting for this.&#x20;

You can find an example for this process [here](https://github.com/hcoberdalhoff/approle-and-directoryrole-granter).

### Azure Resource Permissions

Please give at least "Contributor" access to the subscription or resource group hosting the Azure Automation Account for the runbooks

Some runbooks will use an Azure Storage Account to store reports or backups. Please give at least "Contributor" access to the corresponding subscription or resource group. Most runbooks can then create the resources inside the resource group on their own.

## Method of authentication

### Managed Identities

Azure Automation supports [Managed Identities](https://docs.microsoft.com/en-us/azure/automation/enable-managed-identity-for-automation) (system assigned) as primarty to way to authenticate. This replaces the deprecated RunAs Accounts.&#x20;

The RealmJoin Runbooks currently support RunAs Accounts if no managed identity is configured.

{% hint style="warning" %}
If a Managed Identity and a RunAs Account are configured at the same time, the runbooks from glueckkanja's shared repository will automatically prefer using the Managed Identity when using recent versions of our supporting RealmJoin.RunbookHelper Module starting with v0.8.0. Older versions of the module could not fully utilize Managed Identities and prefered the RunAs Account.&#x20;

Please make sure, that you grant the needed permissions to Managed Identity or disable it completely to only use the RunAs Account.&#x20;
{% endhint %}

### Client Secret

Some cases may needed a ClientID/Secret-style authentication. There are currently no shared runbooks that require ClientID and Secret.

If needed, a ClientId and Secret can be stored in the managed credentials named "realmjoin-automation-cred" in the Azure Automation Account.

Currently the "realmjoin-automation-cred" in the automation account is created by the RJ-Wizard by default, but filled with random values - they would have to be filled with correct values.

### User account (problematic)

Some cases like the MicrosoftTeams PS Module require the use of a full Azure AD user object for authentication/automation.

If you want to use theses runbook (like "Assign Teams Phone Number"), you will have to

* Create an (ADM-)User object, e.g. `ADM-ServiceUser.TeamsAutomation`
* Assign a password to the user
* Set the password to never expire (or track the password changes accordingly)
* Disable MFA for this user / make sure conditional access is not blocking the user
* Add the following AzureAD roles permanently to the user:
  * Teams Administrator
  * Skype for Business Administrator
* Create a credentials object in the Azure Automation Account you use for the RealmJoin Runbooks, call the credentials `teamsautomation`
* Store the credentials (username and password) in `teamsautomation`.

This is not a recommended situation and will be fixed as soon as a technical solution is known.

###
