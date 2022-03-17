# Required Permissions

## RealmJoin Runbook Management

RealmJoin will create an Application Registration called **RealmJoin Runbook Management** which is used to update the [Azure Automation Runbooks](../../runbooks/) in your tenant based on [glueckkanja-gab's shared runbook repository](https://github.com/realmjoin/realmjoin-runbooks).

This app also will be used by RealmJoin Portal to trigger runbook execution after filtering requests through [RealmJoin's RBAC](../../settings/permission.md) and [Runbook Permissions](../../runbooks/runbook-permissions.md).

As this app is created individually for your tenant, there is no globally known Application ID as with [RealmJoin Portal's apps](../onboarding-realmjoin-portal/required-permissions.md).

This app will not have any API permissions.

### Azure Resource Permissions

This app will need to be at least Contributor on the Azure Resource Group hosting your Azure Automation Account. Using our [onboarding process](./) will make sure this permission is given.

## Azure Automation Account (Runbooks)

You will have to grant permissions to your Azure Automation Account to leverage runbooks for operations/process automation.

See the [roles and permissions description](../../runbooks/azure-ad-roles-and-permissions.md) in [Process Automation](../../runbooks/) for more details.
