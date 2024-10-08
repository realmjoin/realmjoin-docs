# General

## Runbook Sync

If you configure [Process Automation / Runbooks](../automation/runbooks/) in your environment, you can click "Sync runbooks..." to update your runbooks from RealmJoin's public repository.

![](<../../.gitbook/assets/image (59).png>)

This will make sure, you have the current state of our runbooks, incl. bugfixes and new functionality. If needed, this will also install needed PowerShell modules in your Azure Automation Account.

## Package Automation Defaults

If you source packages from RealmJoin's [Package Store](../app-management/packages/package-store/), you can use [automation ](../app-management/packages/package-details.md#automation)to keep these packages always up to date.

![Automation defaults for a package](<../../.gitbook/assets/image (177).png>)

The settings are:

* **AutoDeployMain** - Automatically deploy new versions of this package to your users. ("Main" subscription)
* **AutoDeployMainDeferInDays** - Wait for this number of days to pass before publishing a new version to "main". This is usefull to avoid stress for users/clients if multiple package versions are published rapidly.
* **AutoDeployPreview** - Automatically deploy new versions of this package to your pilot users. ("Preview" subscription)
* **AutoDeployPreviewDeferInDays** - Wait for this number of days to pass before publishing a new version to "preview".
* **AutoDeployAtNight** - Schedule automatic deployment during night time
* **Select target timezone** - If you use AutoDeployAtNight, use this Time Zone to indicate when "at night" is.

See [Package Details](../app-management/packages/package-details.md#automation) for more information on Package Automation.

## Group Naming Scheme

RealmJoin Portal can dynamically create and manage Entra groups for features like [package assignment](../app-management/packages/package-details.md#assignments) and [remediation script assignment](../automation/remediation-scripts.md#assignment).

### App / Package Deployment

RealmJoin can create assignment groups for Intune and RealmJoin Client packages. Use this to define the naming pattern the groups.

<figure><img src="../../.gitbook/assets/image (209).png" alt=""><figcaption><p>Package Deployment Group Naming Scheme</p></figcaption></figure>

You can use the following variables:

* **$vendor** - Name of the software vendor (if available)
* **$product** - Name of the software title
* **$appName** - Full name (vendor and product) of the software
* **$modifier** - either nothing, "available", "preview" or "uninstall"&#x20;
* **$groupName** - (only in description) Name of the Managed Group

### Remediation Scripts

If you use [RealmJoin managed Intune Remediation scripts](../automation/remediation-scripts.md#managed-scripts), you can define the naming scheme for [Managed Groups](../automation/remediation-scripts.md#managed-groups).

<figure><img src="../../.gitbook/assets/image (127).png" alt=""><figcaption><p>Remediation Scripts Group Naming Scheme</p></figcaption></figure>

You can use the following variables:

* **$healthScriptName** - Name of the Managed Remediation Script
* **$modifier** - either "included" or "excluded" (Assignment vs. Exception)
* **$groupName** - (only in description) Name of the Managed Group
