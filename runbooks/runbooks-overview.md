---
description: Automate day to day operations in your environment.
---

# Runbooks Overview

RealmJoin allows you to automate tasks, like&#x20;

* user lifecycle operations (onboarding/offboarding users)
* creating Temporary Access Passes (TAPs)
* reporting M/O365 license usage
* managing email aliases

RealmJoin realizes this by using [Azure Automation](https://azure.microsoft.com/en-us/services/automation) to execute so called "Runbooks". Specifically, [PowerShell Runbooks](https://docs.microsoft.com/en-us/azure/automation/automation-runbook-types#powershell-runbooks) will be used.

Runbooks are scripts, automating tasks that normally have to be executed by a support engineer / operator or administrator. Automating these tasks lowers the risk of manual error and allows better auditing of actions.

You can offer RealmJoin Portal to your support and administration teams to simplify and improve the quality of your day to day operations.

![](<../.gitbook/assets/user rb (1).png>)

## Common Runbooks

glueckkanja-gab maintains a [shared online repository of runbooks](https://github.com/realmjoin/realmjoin-runbooks). They aim to cover many common operations found in most environments. The runbooks are continuously updated and improved. Of course you can include your own, custom runbooks, too.

RealmJoin Portal allows you to import these runbooks into your environment and offers your support and administration staff an easy, non-technical interface to the tasks the runbooks cover.

### Syncing from the shared repository

You can trigger a sync from the shared repository to your Azure Automation account by clicking "Sync runbooks with upstream" at

[https://portal.realmjoin.com/settings/general](https://portal.realmjoin.com/settings/general)

![Trigger a sync of your runbooks](<../.gitbook/assets/image (1).png>)

As described in the [naming convention](naming-conventions.md) this will add, update and if needed remove runbooks from the connected Azure Automation Account to be in sync with glueckkanja-gab's shared repository. This ensures that your runbooks are up to date, including improvements, fixes and new features.

## Customization

You can customize existing an new runbooks to your environment. For example, you can&#x20;

* use templates for common pieces of information, like office locations
* prefill / preconfigure parameters, like to not allowing deleting user object when offboarding
* hide certain inputs/parameters

See [Runbook Customization ](runbook-customization.md)for more details.

## Scopes

Runbooks in RealmJoin Portal are scoped to the different types of objects in your environment. Some runbooks operate on the tenant / organization level, like creating a license report. Some runbooks are scoped on a per user basis, like resetting a password. RealmJoin Portal uses this scoping to offer the right runbooks in the right context.

See [Naming Conventions](naming-conventions.md) to learn about how runbooks are scoped to certain objects in your environment.

## Access Control

Access/Permissions to use certain runbooks can be granularly given on either a runbook level. E.g:

* Only allow access to this runbooks to the 3rd level operators&#x20;

Or limit runbooks usage on certain groups of users:

* Only allow our VIP support crew to change the CEO's email address

See [Runbook Permissions](runbook-permissions.md) for details on how to implement such rules in your environment.
