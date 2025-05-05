# Table of contents

* [Welcome](README.md)
  * [Navigation](readme/navigation.md)

## RealmJoin Deployment

* [Onboarding](realmjoin-deployment/onboarding-realmjoin-portal.md)
* [Required Permissions](realmjoin-deployment/required-permissions.md)
* [Infrastructure Considerations](realmjoin-deployment/infrastructure/README.md)
  * [Multi User Devices](realmjoin-deployment/infrastructure/multi-user-devices.md)
* [Migration to RealmJoin vNext](realmjoin-deployment/migration-to-realmjoin-vnext.md)

## User, Group and Device Management <a href="#ugd-management" id="ugd-management"></a>

* [Overview](ugd-management/user-group-device-management.md)
* [User Profile](ugd-management/about-me.md)
* [Organization Details](ugd-management/organization-details.md)
* [User, Group and Device Lists](ugd-management/user-list/README.md)
  * [User Details](ugd-management/user-list/user-details.md)
  * [Group Details](ugd-management/user-list/group-details.md)
  * [Device Details](ugd-management/user-list/device-details.md)
* [User and Group Settings](ugd-management/user-and-group-settings/README.md)
  * [Available RealmJoin Policies](ugd-management/user-and-group-settings/additional-settings.md)

## App Management

* [Packages](app-management/packages/README.md)
  * [Package Store](app-management/packages/package-store/README.md)
    * [Application Store Details](app-management/packages/package-store/package-store-details.md)
  * [Package Management](app-management/packages/package-management.md)
  * [Package Details](app-management/packages/package-details.md)
  * [Package Assignments](app-management/packages/package-deployment/README.md)
    * [Package Migration](app-management/packages/package-deployment/package-migration.md)
  * [Package Settings](app-management/packages/package-settings.md)
  * [Packaging Requests](app-management/packages/packaging-requests/README.md)
    * [Organic Packages](app-management/packages/packaging-requests/organic-packages.md)
* [AVD Templates](app-management/avd-templates.md)

## Automation

* [Connecting Azure Automation](automation/connecting-azure-automation/README.md)
  * [Required Permissions](automation/connecting-azure-automation/required-permissions.md)
  * [Runbook Parameters](automation/connecting-azure-automation/runbooks.md)
* [Runbooks](automation/runbooks/README.md)
  * [Runbook Customization](automation/runbooks/runbook-customization.md)
  * [Runbook Permissions](automation/runbooks/runbook-permissions.md)
  * [Naming Conventions](automation/runbooks/naming-conventions.md)
  * [Runbook Scheduling](automation/runbooks/scheduling.md)
  * [Runbook Logs](automation/runbooks/runbook-logs/README.md)
    * [Runbook Job Details](automation/runbooks/runbook-logs/runbook-job-details.md)
  * [Runbooks Changelog](https://github.com/realmjoin/realmjoin-runbooks/blob/production/CHANGELOG.md)
* [Requirements](automation/azure-ad-roles-and-permissions.md)
* [Remediation Scripts](automation/remediation-scripts.md)

## RealmJoin Agent

* [Features](realmjoin-agent/realmjoin-client/README.md)
  * [Local Admin Password Solution (LAPS)](realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/README.md)
    * [KeyVault](realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/keyvault.md)
    * [Application Insights](realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/application-insights.md)
  * [Notifications](realmjoin-agent/realmjoin-client/showing-notifications.md)
  * [AnyDesk Integration](realmjoin-agent/realmjoin-client/anydesk-integration/README.md)
    * [AnyDesk configuration](realmjoin-agent/realmjoin-client/anydesk-integration/customer-tasks.md)
  * [App Deployment using the Agent](realmjoin-agent/realmjoin-client/deploy-apps/README.md)
    * [RealmJoin ESP](realmjoin-agent/realmjoin-client/deploy-apps/realmjoin-esp.md)
* [Deploying the Agent](realmjoin-agent/installation.md)
* [User Interface](realmjoin-agent/client-menu.md)

## Logs

* [Connecting Azure Log Analytics Workspace](logs/log-analytics.md)
* [Audit Log](logs/audit-log.md)

## RealmJoin Settings

* [Overview](realmjoin-settings/settings.md)
* [General](realmjoin-settings/general.md)
* [Roles and Permissions](realmjoin-settings/permission/README.md)
  * [Pre-defined Roles](realmjoin-settings/permission/pre-defined-roles.md)
  * [Custom Roles](realmjoin-settings/permission/custom-roles/README.md)
    * [Available Permissions](realmjoin-settings/permission/custom-roles/available-permissions.md)
* [Group Namespaces](realmjoin-settings/groups.md)
* [Workplace Cloud Storage](realmjoin-settings/workplace-cloud-storage.md)
* [Self Service Forms](realmjoin-settings/self-service-forms.md)

## Developer Reference <a href="#dev-reference" id="dev-reference"></a>

* [RealmJoin API](dev-reference/realmjoin-api/README.md)
  * [Authentication](dev-reference/realmjoin-api/authentication.md)
* [Interacting with Runbooks](dev-reference/interacting-with-runbooks.md)
* [Simulating a Runbook Environment](dev-reference/simulating-a-runbook-environment.md)
* [Local Admin Password Management](dev-reference/local-admin-password-management.md)

## Other

* [FAQ](other/faq/README.md)
  * [Security](other/faq/security.md)
* [Troubleshooting](other/troubleshooting/README.md)
  * [Package Installation Issues](other/troubleshooting/package-installation-issues/README.md)
    * [Collecting Logfiles](other/troubleshooting/package-installation-issues/collecting-logfiles.md)
    * [Logfiles Structure](other/troubleshooting/package-installation-issues/logfiles-structure.md)
    * [Analysing chocolatey.log](other/troubleshooting/package-installation-issues/analysing-chocolatey.log.md)
    * [Troubleshooting failed chocolatey packages](other/troubleshooting/package-installation-issues/troubleshooting-failed-chocolatey-packages.md)
    * [Troubleshooting failed craft packages](other/troubleshooting/package-installation-issues/troubleshooting-failed-craft-packages.md)
    * [Fixes for common issues](other/troubleshooting/package-installation-issues/fixes-for-common-issues.md)
    * [Intunewin Debugging](other/troubleshooting/package-installation-issues/intunewin-debugging.md)
  * [LAPS Issues](other/troubleshooting/laps-issues/README.md)
    * [LAPS account passwords cannot be retrieved](other/troubleshooting/laps-issues/laps-account-passwords-cannot-be-retrieved.md)
    * [Requested LAPS Accounts are not being created](other/troubleshooting/laps-issues/requested-laps-accounts-are-not-being-created.md)
* [Changelog](https://feedback.realmjoin.com/)

## Legal

* [Licensing](legal/licensing.md)
* [Support](legal/support.md)

***

* [RealmJoin Website](https://www.realmjoin.com/)
