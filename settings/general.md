# General

## Runbook Sync

If you configure [Process Automation / Runbooks](../runbooks/) in your environment, you can click "Sync runbooks..." to update your runbooks from glueckkanja gab's public repository.

![](<../.gitbook/assets/image (13).png>)

This will make sure, you have the current state of our runbooks, incl. bugifxes and new functionality. If needed, this will also install needed PowerShell modules in your Azure Automation Acount.

## Package Automation Defaults

If you source packages from RealmJoin's [Package Store](../AppManagement/package-store/), you can use [automation ](../AppManagement/package-management/package-details.md#automation)to keep these packages always up to date.

![Automation defaults for a package](<../.gitbook/assets/image (3).png>)

The settings are:

* **AutoDeployMain** - Automatically deploy new versions of this package to your users. ("Main" subscription)
* **AutoDeployMainDeferInDays** - Wait for this number of days to pass before publishing a new version to "main". This is usefull to avoid stress for users/clients if multiple package versions are published rapidly.
* **AutoDeployPreview** - Automatically deploy new versions of this package to your pilot users. ("Preview" subscription)
* **AutoDeployPreviewDeferInDays** - Wait for this number of days to pass before publishing a new version to "preview".
* **AutoDeployAtNight** - Schedule automatic deployment during night time
* **Select target timezone** - If you use AutoDeployAtNight, use this Time Zone to indicate when "at night" is.

See [Package Details](../AppManagement/package-management/package-details.md#automation) for more information on Package Automation.
