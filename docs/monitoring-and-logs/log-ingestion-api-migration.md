---
type: Monitoring & Logs
description: >-
  Microsoft is retiring the Log Analytics HTTP Data Collector API. Migrate
  RealmJoin to the DCR-based Logs Ingestion API with the RealmJoin PowerShell
  module.
---

# Migrating to the Log Ingestion API

## Overview

RealmJoin writes its audit, operational and runbook logs into your own Log Analytics workspace. Until now it did so through the Azure Monitor **HTTP Data Collector API**, which authenticates with the workspace's shared key.

Microsoft ends support for that API on **14 September 2026**. Its successor is the **Logs Ingestion API** (called *Log Ingestion API* in the RealmJoin Portal), which is based on [Data Collection Rules (DCRs)](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/data-collection-rule-overview) and Microsoft Entra ID authentication instead of a shared key. RealmJoin supports it, and the switch is performed with the [RealmJoin PowerShell module](../deployment/onboarding-realmjoin-portal/advanced-setup.md).

{% hint style="info" %}
This page only applies if [Log Analytics](log-analytics.md) is already configured for your tenant. If it isn't, there is nothing to migrate — the same settings page offers a command that sets up a workspace on the Log Ingestion API right away. We still recommend setting it up, so your audit, operational and runbook logs are stored in your own tenant.
{% endhint %}

### Will anything break on the retirement date?

Most likely nothing. Microsoft's current documentation describes a *soft* deprecation: the old endpoints are no longer supported from that date on, but they do not stop accepting data, and ingestion keeps working as long as clients use TLS 1.2 or newer. The stricter wording from the original 2023 announcement — that the endpoints would simply become unavailable — is outdated.

Migrating is nevertheless recommended: the old path is unsupported, depends on a shared key, and receives no further fixes.

### What changes

{% columns %}
{% column %}
#### Before — Data Collector API

* Authentication with the workspace **shared key** ("Customer Workspace Key")
* A **customer-owned Entra ID app registration** with a client secret
* Tables `AuditLogs_CL`, `OperationalLogs_CL`, `RunbookLogs_CL`
* Configured manually in the Portal
{% endcolumn %}

{% column %}
#### After — Log Ingestion API

* Authentication with **Microsoft Entra ID**, no shared key
* The **RealmJoin Azure Resources** service principal, scoped to the workspace and its rules
* Tables `RJAuditLogs_CL`, `RJOperationalLogs_CL`, `RJRunbookLogs_CL`
* Deployed and maintained by the RealmJoin PowerShell module
{% endcolumn %}
{% endcolumns %}

The migration reuses your **existing** workspace, so your existing logs stay where they are. RealmJoin queries the old and the new tables side by side, which means historical data remains visible in the Portal after the migration.

### What the migration deploys

Running the migration command in your subscription creates:

* The **RealmJoin Azure Resources** service principal in your Entra ID tenant (if it does not exist yet)
* Three custom tables in your existing workspace: `RJAuditLogs_CL`, `RJOperationalLogs_CL`, `RJRunbookLogs_CL`
* One Data Collection Rule per table (`dcr-rj-aud-logs-*`, `dcr-rj-op-logs-*`, `dcr-rj-rb-logs-*`), each with its own direct ingestion endpoint
* Exactly two kinds of role assignment for RealmJoin, and nothing beyond them:
  * **Log Analytics Reader** on the workspace, so the Portal can query your logs
  * **Monitoring Metrics Publisher** on each of the three Data Collection Rules, so RealmJoin can write to them

RealmJoin receives no other permission in your subscription. The deployment is idempotent — re-running the same command is safe and only applies what is missing.

## Prerequisites

### In the RealmJoin Portal

* A role that grants access to the Settings area (`CanReadSettingsDetails`, see [Available Permissions](../administration-and-settings/permission/custom-roles/available-permissions.md)). The Settings page generates the migration command including a short-lived onboarding token.

### On the machine running PowerShell

* **PowerShell 5.1** or later (Windows PowerShell or PowerShell 7)
* Access to the [PowerShell Gallery](https://www.powershellgallery.com/packages/RealmJoin) to install the RealmJoin module
* The `Az.Accounts`, `Az.Resources` and `Az.Automation` modules — the RealmJoin module installs them in the pinned versions automatically, for the current user

### Permissions of the account you sign in with

* **Microsoft Entra ID:** permission to create service principals, for example *Application Administrator*, *Cloud Application Administrator* or *Global Administrator*. Only needed the first time, when the RealmJoin Azure Resources service principal does not exist yet.
* **Azure subscription:** permission to deploy into the resource group of the workspace **and** to create role assignments on it — for example *Owner*, or *Contributor* combined with *User Access Administrator* / *Role Based Access Control Administrator*.
* Sign-in happens through `Connect-AzAccount`, which uses the **Azure PowerShell** first-party application. Tenants that restrict user consent may need to grant admin consent to that application first.

{% hint style="info" %}
The resource group and the Log Analytics workspace already exist in your case — the migration does not create them. The commands from the Portal are pre-filled with your current subscription, resource group and workspace name.
{% endhint %}

## Where to run the commands

Run the commands in a **local PowerShell session** on an administrative workstation — the same way you would run the RealmJoin onboarding script.

{% hint style="warning" %}
Use a **freshly opened** PowerShell session and avoid **Azure Cloud Shell**. The RealmJoin module requires exact versions of the `Az.*` modules. If a different version of an `Az` module is already loaded in the session — which is typically the case in Cloud Shell — the module cannot recover and stops with a version conflict message. Closing the session and opening a new one resolves this.
{% endhint %}

An elevated ("Run as administrator") session is not required: modules are installed with `-Scope CurrentUser`.

## Migration

{% stepper %}
{% step %}
#### Open the Log Analytics settings in the Portal

Navigate to **Settings → Log Analytics** ([https://portal.realmjoin.com/settings/log-analytics-configuration](https://portal.realmjoin.com/settings/log-analytics-configuration)).

As long as your tenant is still on the Data Collector API, the page shows the notice **"Migrate to Log Ingestion API (Recommended)"** together with a ready-to-copy command block. Use the **Copy** button to copy it.
{% endstep %}

{% step %}
#### Check the copied command

The command looks like this, with your own values filled in:

```powershell
$latest = [version](Find-Module RealmJoin -Repository PSGallery -ErrorAction Stop).Version
if (-not (Get-Module -ListAvailable RealmJoin | Where-Object Version -ge $latest)) {
    Install-Module RealmJoin -Force -AllowClobber -ErrorAction Stop
}
Import-Module RealmJoin -Force
Set-RJLogAnalyticsWorkspace -ResourceGroupName "<ResourceGroupName>" -WorkspaceName "<WorkspaceName>" -SubscriptionId "<SubscriptionId>" -Token "<Token>" 6>&1
Grant-RJUpdateComplianceWorkspaceAccess -WorkspaceId "<WorkspaceId>" 6>&1
```

* The first lines install or update the RealmJoin module and import it.
* `Set-RJLogAnalyticsWorkspace` performs the actual migration and registers the result with RealmJoin using the `-Token`.
* `Grant-RJUpdateComplianceWorkspaceAccess` only appears if you have configured an [Update Compliance workspace](log-analytics.md#windows-update-for-business-reports). It grants RealmJoin *Log Analytics Reader* on that workspace so Windows Update data keeps working without your own app registration.

{% hint style="warning" %}
Make sure `-ResourceGroupName`, `-WorkspaceName` and `-SubscriptionId` are present and point at your **existing** workspace. If `-WorkspaceName` is missing, the module creates a **new** workspace instead of migrating the existing one, and your old and new logs end up in different places. Add the missing parameter manually if needed.
{% endhint %}

{% hint style="info" %}
**About `6>&1`:** these commands report their progress on PowerShell's Information stream. The `6>&1` redirection displays that output in the console — without it you will not see any progress messages.
{% endhint %}
{% endstep %}

{% step %}
#### Run the command

Paste the block into a new PowerShell session and run it. The token is valid for roughly an hour — if it has expired, reload the settings page and copy the command again.

You will be prompted to sign in with `Connect-AzAccount`. If your account has access to several tenants or subscriptions, the module asks you to choose.

The deployment then reports every resource as it is created: the service principal, the custom tables, the Data Collection Rules and the role assignments. A single run usually takes a few minutes.

{% hint style="info" %}
Want to see what would happen first? Append `-WhatIf` to `Set-RJLogAnalyticsWorkspace` for an Azure Resource Manager What-If preview. Note that signing in and installing the `Az` modules still happens, because the preview needs both.
{% endhint %}
{% endstep %}

{% step %}
#### Verify in the Portal

Return to **Settings → Log Analytics** and select **Refresh**.

The page now shows the Log Ingestion API configuration — subscription, resource group, workspace name, customer workspace ID and tenant ID — as read-only fields, since these settings are maintained by the PowerShell module from now on. Under **Advanced** you can review the endpoints, rule names and stream names of the three Data Collection Rules.

Select **Check for configuration problems** to verify that all required Azure permissions are in place on the workspace and on each Data Collection Rule.
{% endstep %}

{% step %}
#### Confirm that logs arrive

Open [Audit Log](audit-log.md), the [Runbook Logs](../automation/runbooks/runbook-logs/) or the operational logs and confirm that new entries appear. Existing entries from before the migration remain visible as well.

{% hint style="info" %}
Azure needs a few minutes to make a newly created custom table and its rule available. If nothing arrives immediately, wait a little and refresh.
{% endhint %}
{% endstep %}
{% endstepper %}

## After the migration

### Keep the old app registration for now

The historical entries in `AuditLogs_CL`, `OperationalLogs_CL` and `RunbookLogs_CL` are still read with your **existing app registration and client secret**. The Portal queries the old and the new tables in parallel.

{% hint style="warning" %}
Do not delete the app registration, and keep renewing its client secret, as long as you still want to see log data from before the migration. Only the **workspace shared key** is no longer needed by RealmJoin — it is not used for writing anymore.
{% endhint %}

Once the old data has aged out of your [workspace retention](https://learn.microsoft.com/en-us/azure/azure-monitor/logs/data-retention-archive?tabs=portal-1%2Cportal-2), you can remove the app registration.

### Keeping the schema up to date

If RealmJoin extends the log schema in a future release, the settings page shows a notice that the deployed Log Analytics schema is out of date, along with the command to update it. That is the **same** `Set-RJLogAnalyticsWorkspace` command — run it again and the tables and rules are updated in place.

## Troubleshooting

<details>

<summary>"RealmJoin module is outdated - execution cannot proceed"</summary>

Every cmdlet verifies once per session that you are running the latest published version of the module. Install the current version, then close the session and open a new one:

```powershell
Install-Module -Name RealmJoin -Force -Scope CurrentUser
```

</details>

<details>

<summary>A module version conflict is reported</summary>

An `Az.*` module in a version other than the one the RealmJoin module pins is already loaded in the session. This cannot be fixed within the running session — close PowerShell, open a new session and run the command again. This is also the reason not to use Azure Cloud Shell.

</details>

<details>

<summary>"Need admin approval" or a consent error during sign-in</summary>

Sign-in uses the **Azure PowerShell** first-party application. If your tenant restricts user consent, an administrator has to grant admin consent to that application once.

</details>

<details>

<summary>The deployment fails while creating role assignments</summary>

Creating the *Log Analytics Reader* and *Monitoring Metrics Publisher* assignments requires a role that can manage access — for example *Owner*, *User Access Administrator* or *Role Based Access Control Administrator* on the resource group or subscription. *Contributor* alone is not sufficient.

Role assignments that already exist are detected and skipped, so re-running the command after fixing the permissions is safe.

</details>

<details>

<summary>The deployment fails with an error about the workspace region</summary>

The deployment targets the region of the resource group. If your existing workspace lives in a different region than its resource group, Azure rejects the change, because the location of an existing workspace cannot be modified. Please get in touch with RealmJoin support in that case.

</details>

<details>

<summary>The token is no longer accepted</summary>

The onboarding token in the generated command is short-lived (about an hour). Reload **Settings → Log Analytics** in the Portal, copy the command again and re-run it. The Azure deployment itself is idempotent, so a second run does no harm.

</details>

<details>

<summary>The Update Compliance workspace is in a different subscription</summary>

`Grant-RJUpdateComplianceWorkspaceAccess` looks up the workspace in the currently selected subscription. If the Update Compliance workspace lives elsewhere, pass the subscription explicitly:

```powershell
Grant-RJUpdateComplianceWorkspaceAccess -WorkspaceId "<WorkspaceId>" -SubscriptionId "<SubscriptionId>" 6>&1
```

</details>
