---
type: Introduction
description: >-
  What RealmJoin is, which problems it solves next to Microsoft Intune, and what
  you need to run it.
---

# Overview

## What is RealmJoin?

RealmJoin is a **cloud-native, multi-tenant SaaS** and the **Application Lifecycle and Management companion to Microsoft Intune**. It is developed and operated by [glueckkanja](https://www.glueckkanja.com/) in Microsoft Azure, hosted in Europe, and requires **no on-premise servers and no local infrastructure**.

RealmJoin does not replace Intune - it builds on it. Intune stays your MDM: it enrolls devices, applies compliance and configuration policies, and delivers apps. RealmJoin adds what modern workplace teams need on top of it:

* a maintained **application catalogue and packaging service**, so you stop building and updating packages yourself,
* a **single, correlated view** of users, groups and devices across Intune, Entra ID, Microsoft Defender, Windows Autopilot and sign-in logs,
* **process automation** through curated runbooks that run in your own Azure Automation account,
* **delegated administration and self service**, so helpdesk staff and end users can act without broad Intune or Entra admin roles.

Administrators work in the [RealmJoin Portal](https://portal.realmjoin.com); on Windows clients, the optional [RealmJoin Agent](realmjoin-agent/realmjoin-client/) adds deployment and self-service capabilities directly on the device.

## What RealmJoin covers

### Application Management

The [Package Store](application-management/packages/package-store/) contains a continuously maintained catalogue of more than 3,000 ready-to-use Windows and macOS application packages. You subscribe to the packages you need, assign them to managed groups, and RealmJoin keeps versions and update channels (Preview / Main) flowing.

* **Generic packages** are maintained for all customers; **custom** and **organic packages** cover applications specific to your environment - and if something is missing, you can raise a [packaging request](application-management/packages/packaging-requests/) instead of packaging it yourself.
* Each package can be delivered either as an **Intune deployment** (`intunewin` pushed into your tenant) or as a **RealmJoin deployment** through the Agent. See [Deployment Methods](application-management/deployment-methods.md) for the comparison; macOS packages are provisioned via Intune.
* With RealmJoin deployment you additionally get **package dependencies and install order**, auto-upgrades for _Available_ apps, self-service reinstall/repair, user deferral options and reliable delivery of very large payloads.

{% content-ref url="application-management/packages/" %}
[packages](application-management/packages/)
{% endcontent-ref %}

### User, Group and Device Management

RealmJoin merges data from several Microsoft services into **one view per object**. On a device you see its Intune state next to Autopilot registration, Defender risk and sign-in activity; on a user you see licenses, group memberships, devices and policies - without switching portals.

From there you can drill down across correlated objects, run [Advanced Search](analyze-and-export/advanced-search/) queries, export data, and trigger context-specific actions directly on the object.

{% content-ref url="ugd-management/user-group-device-management.md" %}
[user-group-device-management.md](ugd-management/user-group-device-management.md)
{% endcontent-ref %}

### Process Automation

[Runbooks](automation/runbooks/) automate the recurring tasks of a modern workplace: onboarding and offboarding, group and mailbox management, device outphasing and wiping, Autopilot cleanup, reporting, security responses such as isolating a device or reading out BitLocker and LAPS secrets.

The runbook library is kept in sync from a [public GitHub repository](https://github.com/realmjoin/realmjoin-runbooks) and executed in **your own Azure Automation account** under a managed identity you control - you can add your own runbooks alongside it. Scheduled runbooks cover recurring reports and cleanups, and every job is logged and auditable.

{% content-ref url="automation/runbooks/" %}
[runbooks](automation/runbooks/)
{% endcontent-ref %}

### RealmJoin Agent

The [RealmJoin Agent](realmjoin-agent/realmjoin-client/) is an optional Windows 10/11 component. It applies the software and configuration policy assigned to a device after a local security assessment, and adds features that Intune alone does not offer:

* the [RealmJoin ESP](realmjoin-agent/realmjoin-client/realmjoin-esp.md), which holds the desktop until mandatory apps are installed - honouring dependencies and order,
* a [Self Service Portal](realmjoin-agent/client-menu/self-service-portal.md) and [tray menu](realmjoin-agent/client-menu/realmjoin-tray.md) for user-initiated installs,
* [LAPS](realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/) with passwords stored in your own Azure Key Vault,
* [user notifications](realmjoin-agent/realmjoin-client/showing-notifications.md), [multi-user shared devices](realmjoin-agent/realmjoin-client/multi-user-devices.md) and [AnyDesk integration](realmjoin-agent/realmjoin-client/anydesk-integration/).

{% content-ref url="realmjoin-agent/installation.md" %}
[installation.md](realmjoin-agent/installation.md)
{% endcontent-ref %}

### Delegation, self service and auditing

* **[Roles and Permissions](administration-and-settings/permission/):** delegate portal functionality to Entra users and groups with pre-defined or custom roles, optionally combined with [Privileged Identity Management](administration-and-settings/permission/implementing-privileged-identity-management-pim-with-realmjoin-portal.md). Helpdesk teams get exactly the actions they need - nothing more.
* **Self service:** every user has access to their own [profile page](ugd-management/user-profile.md), and [Self Service Forms](administration-and-settings/self-service-forms.md) collect structured requests such as incident reports or equipment orders.
* **[Audit Log](monitoring-and-logs/audit-log.md):** all actions performed in the portal are written to a Log Analytics workspace in your own Azure environment.

## How it works

RealmJoin's backend runs in Microsoft Azure and connects to your tenant through **least-privilege Entra ID applications** that you consent to during onboarding. Sensitive workloads deliberately stay in your environment: runbooks execute in your Azure Automation account, LAPS passwords live in your Azure Key Vault, and audit logs go to your Log Analytics workspace.

{% content-ref url="deployment/architecture-overview.md" %}
[architecture-overview.md](deployment/architecture-overview.md)
{% endcontent-ref %}

## What you need

* A **Microsoft 365 / Entra ID tenant** with **Microsoft Intune** licenses. RealmJoin is licensed per user, based on the Intune user license seats in your tenant - see [Licensing](legal/licensing/).
* A **Global Administrator** to consent to the RealmJoin applications during [onboarding](deployment/onboarding-realmjoin-portal/). Quick Setup covers core portal functionality; Advanced Setup unlocks the full feature set, including Autopilot, the Agent, privileged device actions, LAPS, audit logs and security features.
* An **Azure subscription** for the resources RealmJoin uses in your own environment: Azure Automation for runbooks, Key Vault for LAPS passwords and Log Analytics for audit and runbook logs. Expected Azure cost is minimal - see the [FAQ](troubleshooting-and-faq/faq.md#what-cost-to-expect-from-azure-resources).
* Optional: the **RealmJoin Agent** on Windows 10/11 clients for RealmJoin-based app deployment and the Agent-exclusive features. Microsoft Defender for Endpoint features require the corresponding Microsoft license.

{% hint style="info" %}
No on-premise servers, agents for the backend, or network appliances are required at any point.
{% endhint %}

## Getting started

Pick the deployment guide that matches your scope and follow it end to end - from consenting to the RealmJoin applications to your first package assignment.

{% content-ref url="deployment/getting-started/" %}
[getting-started](deployment/getting-started/)
{% endcontent-ref %}
