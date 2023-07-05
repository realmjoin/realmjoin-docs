# General

## Runbook Sync

If you configure [Process Automation / Runbooks](../runbooks/) in your environment, you can click "Sync runbooks..." to update your runbooks from glueckkanja gab's public repository.

![](<../.gitbook/assets/image (13) (1) (1).png>)

This will make sure, you have the current state of our runbooks, incl. bugifxes and new functionality. If needed, this will also install needed PowerShell modules in your Azure Automation Acount.

## Package Automation Defaults

If you source packages from RealmJoin's [Package Store](../AppManagement/package-store/), you can use [automation ](../AppManagement/package-management/package-details.md#automation)to keep these packages always up to date.

![Automation defaults for a package](<../.gitbook/assets/image (3) (2) (1).png>)

The settings are:

* **AutoDeployMain** - Automatically deploy new versions of this package to your users. ("Main" subscription)
* **AutoDeployMainDeferInDays** - Wait for this number of days to pass before publishing a new version to "main". This is usefull to avoid stress for users/clients if multiple package versions are published rapidly.
* **AutoDeployPreview** - Automatically deploy new versions of this package to your pilot users. ("Preview" subscription)
* **AutoDeployPreviewDeferInDays** - Wait for this number of days to pass before publishing a new version to "preview".
* **AutoDeployAtNight** - Schedule automatic deployment during night time
* **Select target timezone** - If you use AutoDeployAtNight, use this Time Zone to indicate when "at night" is.

See [Package Details](../AppManagement/package-management/package-details.md#automation) for more information on Package Automation.

## Remediation Scripts Defaults

If you use [RealmJoin managed Intune Remediation scripts](../user-group-device-management/remediation-scripts.md#managed-scripts), you can define the naming scheme for [Managed Groups](../user-group-device-management/remediation-scripts.md#managed-groups).

<figure><img src="../.gitbook/assets/image (3) (5).png" alt=""><figcaption><p>Remediation Scripts Group Naming Scheme</p></figcaption></figure>

You can use the following variables:

* **$healthScriptName** - Name of the Managed Remediation Script
* **$modifier** - either "included" or "excluded" (Assignment vs. Exception)
* **$groupName** - (only in description) Name of the Managed Group
