---
type: Deployment Guide
description: >-
  This will guide you through all steps to deploy RealmJoin for an
  enterprise-grade environment with advanced requirements e.g. Runbooks, Logging
  etc.
---

# Extended Guide

This guide builds on [Getting Started](./). Make the three decisions described there first, then follow the steps in order and skip the ones your scope does not need.

## Prerequisites

* [ ] Microsoft Entra ID "Global Administrator" (consent to the RealmJoin applications)
* [ ] PowerShell 5.1 or later (Windows PowerShell or PowerShell 7) for the setup commands
* [ ] Azure subscription with at least Contributor rights, for the Azure resources below
* [ ] Owner rights (at least on resource group level), to grant the role assignments the setup commands create

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
#### Onboard the RealmJoin Portal

Onboarding onto the RealmJoin Portal establishes the initial connection to RealmJoin. Choose **Quick Setup** or **Advanced Setup** as described in [Getting Started](./#decision-1-quick-setup-or-advanced-setup). Both cover the full feature set of this guide; Advanced Setup gives you granular control over every permission through the RealmJoin PowerShell module.

{% content-ref url="../onboarding-realmjoin-portal/" %}
[onboarding-realmjoin-portal](../onboarding-realmjoin-portal/)
{% endcontent-ref %}

{% content-ref url="../onboarding-realmjoin-portal/advanced-setup.md" %}
[advanced-setup.md](../onboarding-realmjoin-portal/advanced-setup.md)
{% endcontent-ref %}
{% endstep %}

{% step %}
#### Activate the client app and security features

Two features are not part of the initial consent and have to be activated explicitly:

* **RealmJoin Client app** — required for the RealmJoin Agent: software deployments through the agent, the tray icon and client telemetry.
* **Security features** — Microsoft Defender for Endpoint integration. Requires an existing MDE subscription.

With **Quick Setup**, select **Activate** on the corresponding card on the [features page](https://portal.realmjoin.com/organization/features) of the RealmJoin Portal. With **Advanced Setup**, add the features with the RealmJoin PowerShell module:

```powershell
Update-RJTenant -AddFeatures @('Client', 'SecurityFeatures') 6>&1
```

If you need neither the agent nor the Defender integration, continue to the next step.
{% endstep %}

{% step %}
#### Establish Group Permissions

During onboarding, the Entra role _Global Administrator_ becomes a RealmJoin administrator. Assign RealmJoin roles to Entra groups in **Settings → Permissions** so that your administrators and helpdesk staff can work without that role.

Use the pre-defined roles for standard access, or request custom roles for stricter control.

{% hint style="warning" %}
Assign permissions carefully. Some roles grant **elevated access** in RealmJoin Portal
{% endhint %}

{% content-ref url="../../administration-and-settings/permission/pre-defined-roles.md" %}
[pre-defined-roles.md](../../administration-and-settings/permission/pre-defined-roles.md)
{% endcontent-ref %}

{% content-ref url="../../administration-and-settings/permission/custom-roles/" %}
[custom-roles](../../administration-and-settings/permission/custom-roles/)
{% endcontent-ref %}
{% endstep %}

{% step %}
#### Connect Azure Log Analytics Workspace

Connect a Log Analytics Workspace to store the RealmJoin [Audit Log](../../monitoring-and-logs/audit-log.md) and archived runbook logs. Connect it early, so that administrative actions are logged from the start.

This also enables integrations such as Windows Update for Business reporting.

{% content-ref url="../../monitoring-and-logs/log-analytics.md" %}
[log-analytics.md](../../monitoring-and-logs/log-analytics.md)
{% endcontent-ref %}
{% endstep %}

{% step %}
#### Connect Azure Automation

Connect Azure Automation to enable runbooks and remediation scripts.

These features automate recurring administrative tasks, reduce manual effort, and improve traceability.

{% content-ref url="../../automation/connecting-azure-automation/" %}
[connecting-azure-automation](../../automation/connecting-azure-automation/)
{% endcontent-ref %}
{% endstep %}

{% step %}
#### Set up the RealmJoin Agent

Install the RealmJoin Agent on Windows devices to unlock agent-based features such as application lifecycle management, RealmJoin ESP, LAPS, notifications, AnyDesk integration, audit tasks, and compliance checks. The RealmJoin Client app has to be activated first (see above).

Deploy the agent through Intune from the Package Store and add it to your Enrollment Status Page. The agent's behaviour is configured centrally with RealmJoin policies in the user and group settings.

If you do not need the agent, continue to the next relevant step.

{% content-ref url="../../realmjoin-agent/installation.md" %}
[installation.md](../../realmjoin-agent/installation.md)
{% endcontent-ref %}

{% content-ref url="../../ugd-management/user-and-group-settings/" %}
[user-and-group-settings](../../ugd-management/user-and-group-settings/)
{% endcontent-ref %}
{% endstep %}

{% step %}
#### Set up optional RealmJoin Agent add-ons

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
#### Deploy Packages

RealmJoin Portal provides and maintains a large library of ready-to-use packages for Windows and macOS.

When deploying packages, first decide whether the application should be delivered through **Microsoft Intune** or through the **RealmJoin Agent**. This depends on your deployment model and whether you want to use agent-based features.

For new applications, start with a **pilot group** before assigning packages broadly. If a newer package version is available, you can test it as a **Preview** before promoting it into production. Once validation is complete, you can enable **update automation** for ongoing lifecycle management.

If a required application is not available in the Package Store, use **Packaging Requests** to request a generic, custom, or organic package for your environment.

A typical rollout is: import package → configure assignments → test with pilot users or devices → enable automation.

{% content-ref url="../../application-management/packages/package-store/" %}
[package-store](../../application-management/packages/package-store/)
{% endcontent-ref %}

{% content-ref url="../../application-management/packages/package-management.md" %}
[package-management.md](../../application-management/packages/package-management.md)
{% endcontent-ref %}

{% content-ref url="../../application-management/packages/package-deployment.md" %}
[package-deployment.md](../../application-management/packages/package-deployment.md)
{% endcontent-ref %}

{% content-ref url="../../application-management/packages/packaging-requests/" %}
[packaging-requests](../../application-management/packages/packaging-requests/)
{% endcontent-ref %}
{% endstep %}

{% step %}
#### Configure optional platform features

After the core setup is complete, you can enable additional features for daily operations.

**Workplace Cloud Storage** connects an Azure Storage Account to the RealmJoin Portal. Once connected, administrators can:

* Manage favorites for Edge and Google Chrome
* Store backgrounds and other files with a publicly accessible URL
* Store Outlook signature templates

{% content-ref url="../../administration-and-settings/workplace-cloud-storage.md" %}
[workplace-cloud-storage.md](../../administration-and-settings/workplace-cloud-storage.md)
{% endcontent-ref %}

**Self Service Forms** are a convenient way to collect structured data from users. This can be used to let users report incidents or indicate changes, like the need for a new workplace setup in an office.

{% content-ref url="../../administration-and-settings/self-service-forms.md" %}
[self-service-forms.md](../../administration-and-settings/self-service-forms.md)
{% endcontent-ref %}

**Group namespaces** assist the RealmJoin Portal in sorting groups into different categories based off a specified prefix. The RealmJoin Portal includes default group namespaces, however additional namespaces may be added.

{% content-ref url="../../administration-and-settings/groups.md" %}
[groups.md](../../administration-and-settings/groups.md)
{% endcontent-ref %}

The **Software Report** aggregates data from the RealmJoin Agent and Intune to provide a list of all applications, their versions and the method of deployment.

{% content-ref url="../../analyze-and-export/software-reporting.md" %}
[software-reporting.md](../../analyze-and-export/software-reporting.md)
{% endcontent-ref %}
{% endstep %}
{% endstepper %}

## Next steps

Your environment is now set up. For day-to-day operations:

* Review administrative actions in the [Audit Log](../../monitoring-and-logs/audit-log.md).
* Track new features and fixes in the [RealmJoin Changelog](https://feedback.realmjoin.com/).
* When something does not work as expected, start with the [FAQ](../../troubleshooting-and-faq/faq.md) and [Troubleshooting](../../troubleshooting-and-faq/troubleshooting/), or contact [support](../../legal/support.md).
