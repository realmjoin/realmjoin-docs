---
type: Automation Guide
description: >-
  Replace the per-tenant RealmJoin Runbook Management app registration and its
  client secret with the RealmJoin managed multi-tenant app, using the RealmJoin
  PowerShell module.
---

# Switching to the RealmJoin managed app

## Overview

Tenants that connected Azure Automation before the PowerShell-based onboarding use a **RealmJoin Runbook Management** app registration in their own tenant. RealmJoin authenticates against your Automation Account with that app's client ID and client secret.

Newly onboarded tenants no longer do this: RealmJoin uses its own **multi-tenant application**, which is granted Contributor on your Automation Account and nothing else. You can switch an existing configuration over with the [RealmJoin PowerShell module](../../deployment/onboarding-realmjoin-portal/advanced-setup.md).

{% hint style="info" %}
There is no deadline here. Unlike the [Log Analytics migration](../../monitoring-and-logs/log-ingestion-api-migration.md), nothing is being retired by Microsoft — the legacy path keeps working. Switch when it suits you.
{% endhint %}

### Why switch

* **No client secret to rotate.** The per-tenant secret expires and has to be renewed; when it does expire, runbook sync and runbook execution stop until someone notices. The managed app has no secret on your side.
* **No app registration to maintain** in your tenant.
* **Narrower scope.** The legacy service principal was typically given Contributor on the whole resource group. The managed app is granted Contributor on the Automation Account only.
* Your Automation Account, its managed identity, its permissions and your runbooks all stay exactly as they are.

## What the switch changes

The same `Set-RJAutomationAccount` command as for a new setup is used, pointed at your **existing** Automation Account. It:

* creates the **RealmJoin Azure Resources** service principal in your tenant, if it does not exist yet
* grants it **Contributor** on that Automation Account
* re-asserts the managed identity's application permissions — Microsoft Graph, Exchange Online, Defender and SharePoint — for the set the module bundles
* tells RealmJoin to authenticate with the managed app from now on

Your Automation Account keeps its name, its managed identity and its object ID, so the Entra ID roles and any permissions you assigned to it stay valid. Runbooks are not re-imported from scratch.

{% hint style="warning" %}
The registration resets the configured **branch** of the shared runbook repository to `production`. If your tenant deliberately follows a different branch, set it again in the Portal afterwards under Settings → Runbooks.
{% endhint %}

## Prerequisites

The same as for a new setup — see [Prerequisites](./#prerequisites) on the onboarding page. In short:

* Access to the Settings area in the RealmJoin Portal, to get the command and its token
* PowerShell 5.1 or later, in a freshly opened local session — **not** Azure Cloud Shell
* An account that can create service principals and grant application permissions in Entra ID (*Global Administrator* or *Privileged Role Administrator*) and that can create role assignments in the subscription (*Owner*, or *Contributor* plus *User Access Administrator*)

## Migration

{% stepper %}
{% step %}
#### Copy the command from the RealmJoin Portal

In the RealmJoin Portal, go to **Settings → Runbooks** ([https://portal.realmjoin.com/settings/runbooks-configuration](https://portal.realmjoin.com/settings/runbooks-configuration)).

The page shows the notice **"Switch to the RealmJoin managed app"** together with a ready-to-copy command block. Use the **Copy** button to copy it.

The command is pre-filled with your current resource group, Automation Account name and subscription:

```powershell
$latest = [version](Find-Module RealmJoin -Repository PSGallery -ErrorAction Stop).Version
if (-not (Get-Module -ListAvailable RealmJoin | Where-Object Version -ge $latest)) {
    Install-Module RealmJoin -Force -AllowClobber -ErrorAction Stop
}
Import-Module RealmJoin -Force
Set-RJAutomationAccount -ResourceGroupName "<ResourceGroup>" -AutomationAccountName "<AutomationAccountName>" -SubscriptionId "<SubscriptionId>" -Token "<Token>" 6>&1
```

{% hint style="warning" %}
Make sure `-AutomationAccountName` is present and names your **existing** account. Without it the module creates a new, empty Automation Account instead of switching the one you use.
{% endhint %}
{% endstep %}

{% step %}
#### Run the command

Paste the block into a new PowerShell session and run it. The token is valid for roughly an hour — if it has expired, reload the settings page and copy the command again.

You will be prompted to sign in with `Connect-AzAccount`. The deployment then reports every resource and role assignment as it is applied; anything that already exists is detected and skipped.
{% endstep %}

{% step %}
#### Verify in the Portal

Return to **Settings → Runbooks** and select **Refresh**.

The migration notice is gone, and the page now shows **Runbook sync settings** with the branch and the Hybrid Runbook Worker options, plus a read-only **Azure connection** section. Client ID and client secret are no longer part of the configuration.

Check that the branch is the one you want, then run a runbook to confirm that execution still works.
{% endstep %}

{% step %}
#### Clean up the old app registration

Once everything works, the **RealmJoin Runbook Management** app registration is no longer used for runbooks and can be removed in Entra ID, together with its Contributor role assignment on the resource group.

{% hint style="warning" %}
Check what else uses that app registration first. It is the same app that the legacy [Log Analytics](../../monitoring-and-logs/log-analytics.md) setup may reuse — if your tenant is still on the Data Collector API there, or still reads log data written before that migration, the app registration and its secret are still needed. See [Migrating to the Log Ingestion API](../../monitoring-and-logs/log-ingestion-api-migration.md).
{% endhint %}
{% endstep %}
{% endstepper %}

## Troubleshooting

<details>

<summary>"RealmJoin module is outdated - execution cannot proceed"</summary>

Every cmdlet verifies once per session that you are running the latest published version. Install the current version, then close the session and open a new one:

```powershell
Install-Module -Name RealmJoin -Force -Scope CurrentUser
```

</details>

<details>

<summary>A module version conflict is reported</summary>

An `Az.*` module in a version other than the one the RealmJoin module pins is already loaded in the session. This cannot be fixed within the running session — close PowerShell, open a new session and run the command again. This is also the reason not to use Azure Cloud Shell.

</details>

<details>

<summary>The deployment fails while creating role assignments</summary>

Creating the Contributor assignment on the Automation Account requires a role that can manage access — for example *Owner*, *User Access Administrator* or *Role Based Access Control Administrator*. *Contributor* alone is not sufficient.

Role assignments that already exist are detected and skipped, so re-running the command after fixing the permissions is safe.

</details>

<details>

<summary>The deployment fails while assigning application permissions</summary>

Granting Graph, Exchange, Defender and SharePoint app roles to the managed identity requires *Global Administrator* or *Privileged Role Administrator*. Have someone with that role run the command, or run it again yourself after the role has been activated.

</details>

<details>

<summary>The runbook sync stops working after the switch</summary>

Open **Settings → Runbooks** and check the warning shown at the top of the page — RealmJoin verifies the Automation Account configuration whenever the page loads. Then use **Show cmdlet** under Azure connection to re-run the setup command; it is idempotent and re-applies anything that is missing.

</details>
