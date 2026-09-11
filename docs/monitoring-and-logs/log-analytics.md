---
type: Monitoring & Logs
description: >-
  Connect an Azure Log Analytics workspace to RealmJoin Portal with the
  RealmJoin PowerShell module to store audit, operational and runbook logs in
  your own tenant.
---

# Connecting Azure Log Analytics Workspace

## Overview

RealmJoin Portal can use a Log Analytics workspace in your own Azure subscription to store

* its **audit log** — every action performed in the Portal, see [Audit Log](audit-log.md)
* its **operational logs**
* **runbook logs**, archived beyond the maximum retention of Azure Automation (currently 30 days)

Additionally, RealmJoin can read [Windows Update for Business Reports](https://learn.microsoft.com/en-us/windows/deployment/update/wufb-reports-overview) data from a Log Analytics workspace to display possible issues with Windows updates, such as [Windows Update Safeguard Holds](https://docs.microsoft.com/en-us/windows/deployment/update/safeguard-holds), on the [device's details page](../ugd-management/user-list/device-details.md). See [Windows Update for Business Reports](log-analytics.md#windows-update-for-business-reports).

The workspace is set up with the [RealmJoin PowerShell module](../deployment/onboarding-realmjoin-portal/advanced-setup.md). The Portal generates a ready-to-copy command for you — there is nothing to fill in by hand.

{% hint style="info" %}
Is Log Analytics already configured for your tenant and using the deprecated Data Collector API? Then follow [Migrating to the Log Ingestion API](log-ingestion-api-migration.md) instead — it reuses your existing workspace and keeps your existing logs.
{% endhint %}

## Components

RealmJoin writes its logs through the Azure Monitor **Logs Ingestion API**, based on [Data Collection Rules (DCRs)](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/data-collection-rule-overview) and Microsoft Entra ID authentication. Running the setup command creates:

* The **RealmJoin Azure Resources** service principal in your Entra ID tenant (if it does not exist yet)
* A **Log Analytics workspace** in the resource group you choose — or your existing workspace, if you name one
* Three custom tables in that workspace: `RJAuditLogs_CL`, `RJOperationalLogs_CL`, `RJRunbookLogs_CL`
* One Data Collection Rule per table (`dcr-rj-aud-logs-*`, `dcr-rj-op-logs-*`, `dcr-rj-rb-logs-*`), each with its own direct ingestion endpoint
* Exactly two kinds of role assignment for RealmJoin, and nothing beyond them:
  * **Log Analytics Reader** on the workspace, so the Portal can query your logs
  * **Monitoring Metrics Publisher** on each of the three Data Collection Rules, so RealmJoin can write to them

RealmJoin receives no other permission in your subscription. No app registration, no client secret and no workspace shared key are involved. The deployment is idempotent — re-running the same command is safe and only applies what is missing.

## Prerequisites

### In the RealmJoin Portal

* A role that grants access to the Settings area (`CanReadSettingsDetails`, see [Available Permissions](../administration-and-settings/permission/custom-roles/available-permissions.md)). The settings page generates the setup command including a short-lived onboarding token.

### In Azure

* An Azure subscription and an **existing resource group** to deploy into — the module does not create the resource group
* Optionally an existing Log Analytics workspace. If you do not name one, a workspace is created for you in the region of the resource group.

### On the machine running PowerShell

* **PowerShell 5.1** or later (Windows PowerShell or PowerShell 7)
* Access to the [PowerShell Gallery](https://www.powershellgallery.com/packages/RealmJoin) to install the RealmJoin module
* The `Az.Accounts`, `Az.Resources` and `Az.Automation` modules — the RealmJoin module installs them in the pinned versions automatically, for the current user

### Permissions of the account you sign in with

* **Microsoft Entra ID:** permission to create service principals, for example *Application Administrator*, *Cloud Application Administrator* or *Global Administrator*. Only needed the first time, when the RealmJoin Azure Resources service principal does not exist yet.
* **Azure subscription:** permission to deploy into the resource group **and** to create role assignments on it — for example *Owner*, or *Contributor* combined with *User Access Administrator* / *Role Based Access Control Administrator*.
* Sign-in happens through `Connect-AzAccount`, which uses the **Azure PowerShell** first-party application. Tenants that restrict user consent may need to grant admin consent to that application first.

{% hint style="warning" %}
Run the command in a **freshly opened, local** PowerShell session and avoid **Azure Cloud Shell**. The RealmJoin module requires exact versions of the `Az.*` modules. If a different version is already loaded in the session — which is typically the case in Cloud Shell — the module stops with a version conflict that can only be resolved by opening a new session.
{% endhint %}

## Setup

{% stepper %}
{% step %}
#### Prepare the resource group

In the Azure Portal, create or pick the resource group that should hold the workspace. Note its name, and the ID of the subscription it lives in.

If you want to use an **existing** Log Analytics workspace, note its name as well.
{% endstep %}

{% step %}
#### Copy the command from the RealmJoin Portal

In the RealmJoin Portal, navigate to **Settings → Log Analytics** ([https://portal.realmjoin.com/settings/log-analytics-configuration](https://portal.realmjoin.com/settings/log-analytics-configuration)).

The page states that Log Analytics is managed via the RealmJoin PowerShell module and shows a command block. Use the **Copy** button to copy it.

```powershell
$latest = [version](Find-Module RealmJoin -Repository PSGallery -ErrorAction Stop).Version
if (-not (Get-Module -ListAvailable RealmJoin | Where-Object Version -ge $latest)) {
    Install-Module RealmJoin -Force -AllowClobber -ErrorAction Stop
}
Import-Module RealmJoin -Force
Set-RJLogAnalyticsWorkspace -Token "<Token>" 6>&1
```

The first lines install or update the RealmJoin module and import it. `Set-RJLogAnalyticsWorkspace` performs the deployment and registers the result with RealmJoin using the `-Token`.

{% hint style="info" %}
**About `6>&1`:** these commands report their progress on PowerShell's Information stream. The `6>&1` redirection displays that output in the console — without it you will not see any progress messages.
{% endhint %}
{% endstep %}

{% step %}
#### Add the target parameters

`Set-RJLogAnalyticsWorkspace` needs to know where to deploy. Complete the last line before running it:

```powershell
Set-RJLogAnalyticsWorkspace -ResourceGroupName "rg-realmjoin" -SubscriptionId "<SubscriptionId>" -Token "<Token>" 6>&1
```

* `-ResourceGroupName` is required. If you leave it out, PowerShell prompts you for it.
* `-SubscriptionId` is optional — without it, the subscription of your current Azure context is used, and you are asked to choose if several are available.
* `-WorkspaceName` is optional. Pass it to use an **existing** workspace; otherwise a new one is created with a generated name.
{% endstep %}

{% step %}
#### Run the command

Paste the block into a new PowerShell session and run it. The token is valid for roughly an hour — if it has expired, reload the settings page and copy the command again.

You will be prompted to sign in with `Connect-AzAccount`. If your account has access to several tenants or subscriptions, the module asks you to choose.

The deployment then reports every resource as it is created: the service principal, the workspace, the custom tables, the Data Collection Rules and the role assignments. A single run usually takes a few minutes.

{% hint style="info" %}
Want to see what would happen first? Append `-WhatIf` for an Azure Resource Manager What-If preview. Note that signing in and installing the `Az` modules still happens, because the preview needs both.
{% endhint %}
{% endstep %}

{% step %}
#### Verify in the Portal

Return to **Settings → Log Analytics** and select **Refresh**.

The page now shows subscription, resource group, workspace name, customer workspace ID and tenant ID as read-only fields — these settings are maintained by the PowerShell module from now on. Under **Advanced** you can review the endpoints, rule names and stream names of the three Data Collection Rules.

Select **Check for configuration problems** to verify that all required Azure permissions are in place on the workspace and on each Data Collection Rule.

Afterwards, open the [Audit Log](audit-log.md) or the [Runbook Logs](../automation/runbooks/runbook-logs/) and confirm that entries appear. Azure needs a few minutes to make newly created custom tables available.
{% endstep %}
{% endstepper %}

## Data retention

{% hint style="warning" %}
To keep logs for longer than 30 days, adjust the [workspace's data retention](https://learn.microsoft.com/en-us/azure/azure-monitor/logs/data-retention-archive?tabs=portal-1%2Cportal-2) in Azure. Both the workspace default and the Azure Automation retention are 30 days.
{% endhint %}

## Keeping the schema up to date

If RealmJoin extends the log schema in a future release, the settings page shows a notice that the deployed Log Analytics schema is out of date, along with the command to update it. That is the **same** `Set-RJLogAnalyticsWorkspace` command — run it again and the tables and rules are updated in place.

## Windows Update for Business Reports

[Windows Update for Business Reports](https://learn.microsoft.com/en-us/windows/deployment/update/wufb-reports-overview) (formerly Update Compliance) writes update-related events into a Log Analytics workspace. RealmJoin can read those events and display them on the [device's details page](../ugd-management/user-list/device-details.md).

This is independent of the workspace RealmJoin writes its own logs to. You can point RealmJoin at the same workspace or at a separate one.

{% stepper %}
{% step %}
#### Enable Windows Update for Business Reports in Azure

1. In the Azure Portal, navigate to Monitor > Workbooks
2.  Search for "Windows Update for Business reports"<br>

    <figure><img src="../.gitbook/assets/image (332).png" alt=""><figcaption></figcaption></figure>
3. Set your Subscription and the Workspace that should receive the data.\
   ![](<../.gitbook/assets/image (333).png>)
4. Save Settings

{% hint style="warning" %}
Windows Update for Business reports may take up to 24 hours to apply.
{% endhint %}
{% endstep %}

{% step %}
#### Note the workspace ID

Open the workspace in the Azure Portal and copy the **Workspace ID** (a GUID) from its Overview page.
{% endstep %}

{% step %}
#### Enter the workspace ID in the RealmJoin Portal

Navigate to **Settings → Update Compliance**, enter the workspace ID and select **Save**. Leave the field empty to disable Safeguard Hold reporting for this tenant.
{% endstep %}

{% step %}
#### Grant RealmJoin read access

After saving, the page shows a command block. It grants the RealmJoin Azure Resources service principal **Log Analytics Reader** on that workspace — nothing else is deployed or changed:

```powershell
Grant-RJUpdateComplianceWorkspaceAccess -WorkspaceId "<WorkspaceId>" 6>&1
```

If the workspace lives in a different subscription than your current Azure context, add `-SubscriptionId "<SubscriptionId>"`.

Creating this role assignment requires permission to manage access on the workspace, for example *Owner* or *User Access Administrator*.
{% endstep %}
{% endstepper %}

## Legacy setup (Data Collector API)

{% hint style="danger" %}
The setup below uses the Azure Monitor **HTTP Data Collector API**, which Microsoft ends support for on **14 September 2026**. It is documented only for reference on tenants that were configured this way in the past. Do not use it for new configurations — follow the [Setup](log-analytics.md#setup) above, or [migrate an existing configuration](log-ingestion-api-migration.md).
{% endhint %}

<details>

<summary>Show the legacy setup</summary>

On this path, RealmJoin authenticated with a customer-owned Entra ID app registration and the workspace's shared key, and wrote into the tables `AuditLogs_CL`, `OperationalLogs_CL` and `RunbookLogs_CL`.

**Part 1 — Authentication using an Azure app registration**

1. In the Azure Portal, navigate to Microsoft Entra ID > Manage > App Registrations.
2. Select the All Applications tab.
3. Either re-use the "RealmJoin Runbooks Management" app registration created when [onboarding runbooks](../automation/connecting-azure-automation/), or select "New Registration" and register a new application.
4. On the application, navigate to Manage > Certificates & Secrets, select the "Client Secrets" tab and create a new client secret. Set description and expiration according to your internal naming and security policies.
5. Securely note down the secret value — navigating away from the page causes Azure to obfuscate it, and a new secret has to be created.

**Part 2 — Creating a Log Analytics workspace**

1. In the Azure Portal, navigate to Log Analytics Workspace and select Create.
2. Provide a resource group, name and region as required.
3. On the "Overview" tab, note the resource group name, workspace name and workspace ID.

**Part 3 — Azure permissions**

1. Navigate to the subscription your Log Analytics workspace resides in.
2. Select Access Control (IAM) and add a role assignment.
3. Grant your app registration **Monitoring Contributor** on the workspace used for RealmJoin logs, and **Monitoring Reader** on a workspace used only for Windows Update for Business Reports.
4. Review and save the role assignment.

**Part 4 — Connecting RealmJoin and the workspace**

In the RealmJoin Portal, navigate to Settings > Log Analytics and fill in the fields:

* **TenantId** — your Entra ID tenant ID, from the Entra ID Overview page
* **ClientId** and **ClientSecret** — the app registration from Part 1
* **Update Compliance Workspace Id** — the workspace ID of the Windows Update for Business Reports workspace
* **Subscription ID**, **Resource Group** and **Workspace Name** — of the workspace from Part 2
* **Customer Workspace Id** — the workspace ID of the workspace storing RealmJoin audit and runbook log data
* **Customer Workspace Key** — the workspace's "Primary Key", which allows RealmJoin to write data. It can be retrieved with the [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/monitor/log-analytics/workspace?view=azure-cli-latest#az-monitor-log-analytics-workspace-get-shared-keys) (`az monitor log-analytics workspace get-shared-keys --resource-group MyResourceGroup --workspace-name MyWorkspace`) or with [PowerShell](https://learn.microsoft.com/en-us/powershell/module/az.operationalinsights/get-azoperationalinsightsworkspacesharedkey?view=azps-14.6.0) (`Get-AzOperationalInsightsWorkspaceSharedKey -ResourceGroupName "MyResourceGroup" -Name "MyWorkspace"`).

Press **Save** after filling out all fields. The system gives you feedback if everything worked.

</details>
