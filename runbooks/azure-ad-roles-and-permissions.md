---
description: >-
  This wiki pages addresses what requirements and (system-level) permissions
  have to be given, so that runbooks can be executed.
---

# Azure AD Roles and Permissions

## Permissions

The RealmJoin shared runbooks use the default Azure Automation [RunAs account](https://docs.microsoft.com/en-us/azure/automation/manage-runas-account) to interact with AzureAD, Graph API etc.

When creating the Automation Account RunAs account an Application Registration is created in the customer's AzureAD representing this RunAs Connection. All needed permissions have to be applied to this Application Registration.

The following list of roles and permissions will enable you to use all runbooks currently available in our shared repository.&#x20;

it is not recommended to reduce the roles/permissions as the runbooks are tested only against this set of permissions. If you reduce the set of roles/permissions some runbooks will cease to function.

### AzureAD Roles

Please add the following AzureAD roles to the the AppRegistration

* User administrator
* Cloud device administrator
* Exchange administrator

### Graph API Permissions

Please grant the following Graph API-Permissions to the AppRegistration

* AuditLog.Read.All
* Device.Read.All
* DeviceManagementConfiguration.ReadWrite.All
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

### Other App API Permissions

Please grant the following Office 365 Exchange Online API-Permissions to the AppRegistration

* Exchange.ManageAsApp

### Azure Resource Permissions

Please give at least "Contributor" access to the subscription or resource group hosting the Azure Automation Account for the runbooks

Some runbooks will use an Azure Storage Account to store reports or backups. Please give at least "Contributor" access to the corresponding subscription or resource group. Most runbooks can then create the resources inside the resource group on their own.

## Method of authentication

### Certificate Thumbprint

When creating the Azure Automation Account, a certificate thumprint is created as part of a [RunAs Account](https://docs.microsoft.com/en-us/azure/automation/manage-runas-account). Where possible, this is approach of authentication is currently used.

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

### Managed Identities

Azure Automation recently started supporting [Managed Identities](https://docs.microsoft.com/en-us/azure/automation/enable-managed-identity-for-automation) (system assigned) as alternative to RunAs accounts.&#x20;

We are currently evaluating this approach, but as of now our shared runbooks still expect a RunAs account.
