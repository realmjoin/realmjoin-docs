---
description: >-
  This will guide you through all steps to deploy RealmJoin for an
  enterprise-grade environment with advanced requirements e.g. Runbooks, Logging
  etc.
---

# Extended Guide

## Prerequisites

* [ ] Windows PowerShell
* [ ] Azure subscription (at least Contributor rights on that subscription)
* [ ] Azure owner rights (at least on Resource Group level)
* [ ] Microsoft Entra ID "Global administrator" (Consent to access Graph API)

## Azure Resource Overview

| Type                    | Description                                                                                                               |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| Application Insights    | Optionally stores LAPS-related audit and access events.                                                                   |
| Automation Account      | Hosts RealmJoin runbooks and related automation tasks.                                                                    |
| Key Vault               | Stores LAPS passwords securely in your Azure environment.                                                                 |
| Log Analytics Workspace | Stores RealmJoin audit logs, archived runbook logs, and optional reporting data.                                          |
| Storage Account         | Provides storage for optional Workplace Cloud Storage features such as favorites, files, and Outlook signature templates. |

{% stepper %}
{% step %}
### Onboard the RealmJoin Portal

Onboarding onto the RealmJoin Portal will establish the initial connection to RealmJoin. Administrators will be able to choose from the Quick or Advanced Setup once complete. This guide continues with the **Advanced Setup** path.

{% content-ref url="../onboarding-realmjoin-portal/" %}
[onboarding-realmjoin-portal](../onboarding-realmjoin-portal/)
{% endcontent-ref %}
{% endstep %}

{% step %}
### Proceed with the Advanced Setup

Use **Advanced Setup** to deploy RealmJoin with granular permission control. You can add or remove permissions later with the RealmJoin PowerShell module.

{% content-ref url="../onboarding-realmjoin-portal/advanced-setup.md" %}
[advanced-setup.md](../onboarding-realmjoin-portal/advanced-setup.md)
{% endcontent-ref %}
{% endstep %}

{% step %}
### Establish Group Permissions

Assign RealmJoin access through Entra groups.

Use built-in roles for standard access or create custom roles for stricter control.

{% hint style="warning" %}
Assign permissions carefully. Some roles grant **elevated access** in RealmJoin Portal
{% endhint %}

{% content-ref url="../../realmjoin-settings/permission/pre-defined-roles.md" %}
[pre-defined-roles.md](../../realmjoin-settings/permission/pre-defined-roles.md)
{% endcontent-ref %}

{% content-ref url="../../realmjoin-settings/permission/custom-roles/" %}
[custom-roles](../../realmjoin-settings/permission/custom-roles/)
{% endcontent-ref %}
{% endstep %}

{% step %}
### Set up the RealmJoin Agent

Install the RealmJoin Agent on Windows devices to unlock agent-based features such as application lifecycle management, RealmJoin ESP, LAPS, notifications, AnyDesk integration, audit tasks, and compliance checks.

If you do not need the agent, continue to the next relevant step.

{% content-ref url="../../realmjoin-agent/installation.md" %}
[installation.md](../../realmjoin-agent/installation.md)
{% endcontent-ref %}
{% endstep %}

{% step %}
### Set up optional RealmJoin Agent add-ons

Enable optional add-ons that require additional configuration after the agent is installed.

Use this step if you want to extend the agent with:

* **LAPS** for managed local admin accounts, password rotation, and secure password storage
* **AnyDesk Integration** for remote support workflows directly from RealmJoin Portal

If you do not need these add-ons, continue to the next step.

{% content-ref url="../../realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/" %}
[local-admin-password-solution-laps](../../realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/)
{% endcontent-ref %}

{% content-ref url="../../realmjoin-agent/realmjoin-client/anydesk-integration/" %}
[anydesk-integration](../../realmjoin-agent/realmjoin-client/anydesk-integration/)
{% endcontent-ref %}
{% endstep %}

{% step %}
### Connect Azure Automation

Connect Azure Automation to enable runbooks and remediation scripts.

These features automate recurring administrative tasks, reduce manual effort, and improve traceability.

{% content-ref url="../../automation/connecting-azure-automation/" %}
[connecting-azure-automation](../../automation/connecting-azure-automation/)
{% endcontent-ref %}
{% endstep %}

{% step %}
### Connect Azure Log Analytics Workspace

Connect a Log Analytics Workspace to store RealmJoin audit data and runbook execution logs.

This also enables integrations such as Windows Update for Business reporting.

{% content-ref url="../../logs/log-analytics.md" %}
[log-analytics.md](../../logs/log-analytics.md)
{% endcontent-ref %}
{% endstep %}

{% step %}
### Deploy Packages

RealmJoin Portal provides and maintains a large library of ready-to-use packages for Windows and macOS.

When deploying packages, first decide whether the application should be delivered through **Microsoft Intune** or through the **RealmJoin Agent**. This depends on your deployment model and whether you want to use agent-based features.

For new applications, start with a **pilot group** before assigning packages broadly. If a newer package version is available, you can test it as a **Preview** before promoting it into production. Once validation is complete, you can enable **update automation** for ongoing lifecycle management.

If a required application is not available in the Package Store, use **Packaging Requests** to request a generic, custom, or organic package for your environment.

A typical rollout is: import package → configure assignments → test with pilot users or devices → enable automation.

{% content-ref url="../../app-management/packages/package-store/" %}
[package-store](../../app-management/packages/package-store/)
{% endcontent-ref %}

{% content-ref url="../../app-management/packages/package-management.md" %}
[package-management.md](../../app-management/packages/package-management.md)
{% endcontent-ref %}

{% content-ref url="../../app-management/packages/package-deployment.md" %}
[package-deployment.md](../../app-management/packages/package-deployment.md)
{% endcontent-ref %}

{% content-ref url="../../app-management/packages/packaging-requests/" %}
[packaging-requests](../../app-management/packages/packaging-requests/)
{% endcontent-ref %}
{% endstep %}

{% step %}
### Configure optional platform features

After the core setup is complete, you can enable additional features for daily operations.

**Workplace Cloud Storage** connects an Azure Storage Account to the RealmJoin Portal. Once connected, administrators can:

* Manage favorites for Edge and Google Chrome
* Store backgrounds and other files with a publicly accessible URL
* Store Outlook signature templates

{% content-ref url="../../realmjoin-settings/workplace-cloud-storage.md" %}
[workplace-cloud-storage.md](../../realmjoin-settings/workplace-cloud-storage.md)
{% endcontent-ref %}

**Self Service Forms** are a convenient way to collect structured data from users. This can be used to let users report incidents or indicate changes, like the need for a new workplace setup in an office.

{% content-ref url="../../realmjoin-settings/self-service-forms.md" %}
[self-service-forms.md](../../realmjoin-settings/self-service-forms.md)
{% endcontent-ref %}

**Group namespaces** assist the RealmJoin Portal in sorting groups into different categories based off a specified prefix. The RealmJoin Portal includes default group namespaces, however additional namespaces may be added.

{% content-ref url="../../realmjoin-settings/groups.md" %}
[groups.md](../../realmjoin-settings/groups.md)
{% endcontent-ref %}

The **Software Report** aggregates data from the RealmJoin Agent and Intune to provide a list of all applications, their versions and the method of deployment.

{% content-ref url="../../app-management/software-reporting.md" %}
[software-reporting.md](../../app-management/software-reporting.md)
{% endcontent-ref %}
{% endstep %}
{% endstepper %}
