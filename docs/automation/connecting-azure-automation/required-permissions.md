# Required Permissions

This page describes the permissions needed for RealmJoin to interact with Azure Automation / Runbooks.&#x20;

See [azure-ad-roles-and-permissions.md](../azure-ad-roles-and-permissions.md "mention") to see which permissions need to be granted to Azure Automation for the runbooks to be useful in your environment.

## RealmJoin Runbook Management

RealmJoin will create an Application Registration called **RealmJoin Runbook Management** which is used to update the [Azure Automation Runbooks](../runbooks/) in your tenant based on [RealmJoin's shared runbook repository.](https://github.com/realmjoin/realmjoin-runbooks)

This app also will be used by RealmJoin Portal to trigger runbook execution after filtering requests through [RealmJoin's RBAC](../../realmjoin-settings/permission/) and [Runbook Permissions](../runbooks/runbook-permissions.md).

As this app is created individually for your tenant, there is no globally known Application ID as with [RealmJoin Portal's apps](../../realmjoin-deployment/required-permissions.md).

This app will not have any API permissions.

### Azure Resource Permissions

The RealmJoin Runbook Management app will need to be at least Contributor on the Azure Resource Group hosting your Azure Automation Account. Using our [onboarding process](./) will make sure this permission is given.
