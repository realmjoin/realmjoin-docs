---
type: Automation Guide
description: >-
  How RealmJoin authenticates against your Azure Automation Account, and which
  Azure permissions it needs to sync and run runbooks.
---

# Runbook Management App Permissions

This page describes the permissions RealmJoin itself needs to interact with Azure Automation and runbooks.

See [azure-ad-roles-and-permissions.md](azure-ad-roles-and-permissions.md "mention") for the permissions that have to be granted to the Automation Account's managed identity so the runbooks are useful in your environment — those are a separate set.

## RealmJoin Azure Resources

Tenants onboarded with the [RealmJoin PowerShell module](./) are accessed through RealmJoin's own multi-tenant application, **RealmJoin Azure Resources**. Running the setup creates a service principal for it in your tenant.

RealmJoin uses it to update the [Azure Automation runbooks](../runbooks/) in your tenant from [RealmJoin's shared runbook repository](https://github.com/realmjoin/realmjoin-runbooks), and to trigger runbook execution after filtering requests through [RealmJoin's RBAC](../../administration-and-settings/permission/) and [Runbook Permissions](../runbooks/runbook-permissions.md).

The app has **no API permissions** in your tenant. There is no client secret on your side.

### Azure Resource Permissions

The service principal is granted **Contributor**, scoped to the Automation Account RealmJoin manages. It receives no permission on the surrounding resource group, on other resources, or on the subscription.

The same service principal is also used for the [Log Analytics](../../monitoring-and-logs/log-analytics.md) integration, where it is granted its own, separate roles on the workspace and its data collection rules.

## RealmJoin Runbook Management (legacy)

Tenants configured before the PowerShell-based onboarding use an app registration called **RealmJoin Runbook Management**, created individually in your tenant. RealmJoin authenticates with its client ID and client secret, and the app is typically Contributor on the whole resource group hosting the Automation Account.

As this app is created individually for your tenant, there is no globally known Application ID as with [RealmJoin Portal's apps](../../deployment/required-permissions.md). This app also has no API permissions.

{% hint style="info" %}
This path still works, but it means maintaining a client secret that expires. See [Switching to the RealmJoin managed app](managed-app-migration.md) to move over.
{% endhint %}
