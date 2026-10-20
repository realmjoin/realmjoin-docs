---
type: Deployment Guide
description: >-
  The recommended path from a new tenant to your first deployed package: the
  decisions to make up front, a standard setup for trials and Intune-only
  environments, and where the extended guide takes over.
---

# Getting Started

This page is the starting point for every new RealmJoin environment. Read it top to bottom: it lists what you need, the three decisions to make before you start, and the steps that take you from a new tenant to your first deployed package. Each step links to the page with the details.

## Before you start

* A **Microsoft 365 / Entra ID tenant** with **Microsoft Intune** licenses. RealmJoin is licensed per user, see [Licensing](../../legal/licensing/).
* A **Global Administrator** who consents to the RealmJoin applications during onboarding.
* An **Azure subscription** — only if you want the features that run in your own Azure environment (see [Decision 3](./#decision-3-which-features-run-in-your-azure-environment)). A trial or an Intune-only setup does not need one.

To understand what RealmJoin does before you start, read the [Overview](../../overview.md) and the [Architecture Overview](../architecture-overview.md).

## Make three decisions

### Decision 1: Quick Setup or Advanced Setup

You choose the setup type when you onboard the RealmJoin Portal.

|                       | Quick Setup                                                                                          | Advanced Setup                                                                   |
| --------------------- | ---------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| How                   | One Entra admin consent in the browser                                                               | The RealmJoin PowerShell module creates the service principals and permissions   |
| Permissions           | All core and optional portal permissions at once (Intune LAPS, Autopilot, device actions, remediation scripts, sign-ins, BitLocker keys and more) | Only the features you select, optionally read-only                               |
| Effort                | A few clicks                                                                                         | Run and maintain PowerShell commands                                             |
| Recommended for       | Most organizations, trials and proofs of concept                                                     | Strict compliance requirements or maximum control over every granted permission |
| Switch later          | Can be switched to Advanced Setup later (one-way)                                                    | Cannot be switched back to Quick Setup                                           |

The RealmJoin Agent client app and the Microsoft Defender for Endpoint security features are activated separately in both setup types, on the [features page](https://portal.realmjoin.com/organization/features) of the RealmJoin Portal.

{% hint style="info" %}
Not sure? Start with **Quick Setup**. You can still move to Advanced Setup later if your compliance requirements change.
{% endhint %}

### Decision 2: Intune only, or Intune and the RealmJoin Agent

Every Windows package can be delivered by **Microsoft Intune** or by the **RealmJoin Agent**. Intune deployment needs nothing on the device beyond Intune. The Agent adds dependencies and install order, the RealmJoin ESP, self service, user deferral, LAPS with your own Key Vault, notifications and more.

{% content-ref url="../../application-management/deployment-methods.md" %}
[deployment-methods.md](../../application-management/deployment-methods.md)
{% endcontent-ref %}

### Decision 3: Which features run in your Azure environment

Some features deliberately keep data and execution in your own Azure subscription. Each one is optional, so connect only what you plan to use.

| Feature                                                   | Azure resource          | Needed for                                                        |
| --------------------------------------------------------- | ----------------------- | ----------------------------------------------------------------- |
| [Runbooks](../../automation/connecting-azure-automation/) | Automation Account      | Automating administrative tasks                                    |
| [Audit Log](../../monitoring-and-logs/log-analytics.md)   | Log Analytics Workspace | Audit log, archived runbook logs, Windows Update for Business reports |
| [Agent LAPS](../../realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/) | Key Vault | Local admin passwords managed by the RealmJoin Agent              |
| [Workplace Cloud Storage](../../administration-and-settings/workplace-cloud-storage.md) | Storage Account | Browser favorites, files and Outlook signature templates          |

## Choose your path

| Your scope                                                          | Path                                                                                 |
| ------------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| Trial or proof of concept                                           | [Standard path](./#standard-path) below                                              |
| Application deployment through Intune only, no Azure resources     | [Standard path](./#standard-path) below                                              |
| RealmJoin Agent, Runbooks, audit logs, Defender integration or LAPS | Standard path, then continue with the [Extended Guide](extended-guide.md)            |

## Standard path

{% stepper %}
{% step %}
#### Onboard the RealmJoin Portal

Sign in to the RealmJoin Portal as Global Administrator, consent to the RealmJoin application and choose the setup type from [Decision 1](./#decision-1-quick-setup-or-advanced-setup).

{% content-ref url="../onboarding-realmjoin-portal/" %}
[onboarding-realmjoin-portal](../onboarding-realmjoin-portal/)
{% endcontent-ref %}
{% endstep %}

{% step %}
#### Give your team access

During onboarding, the Entra role _Global Administrator_ becomes a RealmJoin administrator. Assign RealmJoin roles to Entra groups in **Settings → Permissions** so that your administrators and helpdesk staff can work without the Global Administrator role. Use the pre-defined roles unless you need a custom set of permissions.

{% content-ref url="../../administration-and-settings/permission/" %}
[permission](../../administration-and-settings/permission/)
{% endcontent-ref %}
{% endstep %}

{% step %}
#### Deploy your first package

Open the **Package Store**, subscribe to an application, choose the deployment method from [Decision 2](./#decision-2-intune-only-or-intune-and-the-realmjoin-agent) and assign it to a pilot group through its managed groups. Once the pilot works, widen the assignment and enable update automation.

{% content-ref url="../../application-management/packages/package-store/" %}
[package-store](../../application-management/packages/package-store/)
{% endcontent-ref %}

{% content-ref url="../../application-management/packages/package-deployment.md" %}
[package-deployment.md](../../application-management/packages/package-deployment.md)
{% endcontent-ref %}
{% endstep %}

{% step %}
#### Explore your users, groups and devices

The user, group and device pages combine Entra ID, Intune, Autopilot, Defender and sign-in data for each object. Open a known user or device to check that the data from your tenant arrives.

{% content-ref url="../../introduction/navigation.md" %}
[navigation.md](../../introduction/navigation.md)
{% endcontent-ref %}

{% content-ref url="../../ugd-management/user-group-device-management.md" %}
[user-group-device-management.md](../../ugd-management/user-group-device-management.md)
{% endcontent-ref %}
{% endstep %}
{% endstepper %}

## Next steps

If your scope goes beyond the standard path, continue with the Extended Guide. It adds the RealmJoin Agent, the Azure resources from [Decision 3](./#decision-3-which-features-run-in-your-azure-environment) and the optional platform features.

{% content-ref url="extended-guide.md" %}
[extended-guide.md](extended-guide.md)
{% endcontent-ref %}

Questions along the way are answered in the [FAQ](../../troubleshooting-and-faq/faq.md). For anything else, see [Support & Service Level](../../legal/support.md).
