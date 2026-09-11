---
type: Automation Guide
description: >-
  Connect an Azure Automation Account to RealmJoin Portal with the RealmJoin
  PowerShell module, so RealmJoin can deploy, run and monitor runbooks in your
  tenant.
---

# Connecting Azure Automation

## Overview

To enable RealmJoin Portal to deliver [runbooks](../runbooks/) for automating daily tasks, you must connect an [Azure Automation](https://learn.microsoft.com/en-us/azure/automation/overview) Account. It acts as the host for your runbooks and provides the [permissions](azure-ad-roles-and-permissions.md) the runbooks need to work in your environment.

The Automation Account is set up with the [RealmJoin PowerShell module](../../deployment/onboarding-realmjoin-portal/advanced-setup.md). The Portal generates a ready-to-copy command for you — there is no app registration to create and no client secret to manage.

{% hint style="info" %}
Are runbooks already configured for your tenant with the legacy **RealmJoin Runbook Management** app registration? Then see [Switching to the RealmJoin managed app](managed-app-migration.md). It keeps your Automation Account and your runbooks, and removes the per-tenant client secret.
{% endhint %}

## Considerations

The Automation Account's [Managed Identity](https://learn.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview) requires extensive [permissions](azure-ad-roles-and-permissions.md) in your environment, such as the ability to modify group or user objects in Entra ID or manage mailboxes in Exchange Online. Limit administrative access to this account to prevent misuse of these privileges.

When using an existing Automation Account, note that RealmJoin Portal automatically creates, updates and removes runbooks coming from the [shared online repository of runbooks](https://github.com/realmjoin/realmjoin-runbooks). This functionality may not be supported in an existing Automation Account. If uncertain, we recommend creating a dedicated Azure Automation Account for RealmJoin runbooks — which the setup command does for you.

## What the setup deploys

Running the setup command creates:

* The **RealmJoin Azure Resources** service principal in your Entra ID tenant (if it does not exist yet)
* An **Automation Account** with a system-assigned managed identity, in the region of the resource group — or your existing Automation Account, if you name one
* **Contributor** for the RealmJoin service principal, scoped to that Automation Account, so RealmJoin can sync and start runbooks
* The **application permissions** for the managed identity that the module bundles — Microsoft Graph, Office 365 Exchange Online, Windows Defender ATP and SharePoint Online

RealmJoin authenticates against Azure with its own multi-tenant application. No app registration and no client secret are created in your tenant, and RealmJoin receives no permission outside that Automation Account.

{% hint style="warning" %}
The managed identity's **Entra ID directory roles** — Intune Administrator, Exchange Administrator, User Administrator and so on — are **not** assigned by the setup command. They still have to be granted separately, see [Granting roles and permissions](azure-ad-roles-and-permissions.md#granting-roles-and-permissions). Without them a large part of the shared runbooks will not work.
{% endhint %}

## Prerequisites

### In the RealmJoin Portal

* A role that grants access to the Settings area (`CanReadSettingsDetails`, see [Available Permissions](../../administration-and-settings/permission/custom-roles/available-permissions.md)). The settings page generates the setup command including a short-lived onboarding token.

### In Azure

* An Azure subscription and an **existing resource group** to deploy into — the module does not create the resource group. A separate resource group for the Automation Account is recommended.
* Optionally an existing Automation Account. If you do not name one, an account is created for you.

### On the machine running PowerShell

* **PowerShell 5.1** or later (Windows PowerShell or PowerShell 7)
* Access to the [PowerShell Gallery](https://www.powershellgallery.com/packages/RealmJoin) to install the RealmJoin module
* The `Az.Accounts`, `Az.Resources` and `Az.Automation` modules — the RealmJoin module installs them in the pinned versions automatically, for the current user

### Permissions of the account you sign in with

* **Microsoft Entra ID:** permission to create service principals **and to grant application permissions** — the setup assigns Graph, Exchange, Defender and SharePoint app roles to the managed identity. In practice this means *Global Administrator* or *Privileged Role Administrator*.
* **Azure subscription:** permission to deploy into the resource group **and** to create role assignments on it — for example *Owner*, or *Contributor* combined with *User Access Administrator* / *Role Based Access Control Administrator*.
* Sign-in happens through `Connect-AzAccount`, which uses the **Azure PowerShell** first-party application. Tenants that restrict user consent may need to grant admin consent to that application first.

{% hint style="warning" %}
Run the command in a **freshly opened, local** PowerShell session and avoid **Azure Cloud Shell**. The RealmJoin module requires exact versions of the `Az.*` modules. If a different version is already loaded in the session — which is typically the case in Cloud Shell — the module stops with a version conflict that can only be resolved by opening a new session.
{% endhint %}

## Setup

{% stepper %}
{% step %}
#### Prepare the resource group

In the Azure Portal, create or pick the resource group that should hold the Automation Account. Note its name and the ID of the subscription it lives in.

If you want to use an **existing** Automation Account, note its name as well.
{% endstep %}

{% step %}
#### Copy the command from the RealmJoin Portal

In the RealmJoin Portal, go to **Settings → Runbooks** ([https://portal.realmjoin.com/settings/runbooks-configuration](https://portal.realmjoin.com/settings/runbooks-configuration)).

The page states that the runbook configuration is managed via the RealmJoin PowerShell module and shows a command block. Use the **Copy** button to copy it.

```powershell
$latest = [version](Find-Module RealmJoin -Repository PSGallery -ErrorAction Stop).Version
if (-not (Get-Module -ListAvailable RealmJoin | Where-Object Version -ge $latest)) {
    Install-Module RealmJoin -Force -AllowClobber -ErrorAction Stop
}
Import-Module RealmJoin -Force
Set-RJAutomationAccount -Token "<Token>" 6>&1
```

{% hint style="info" %}
**About `6>&1`:** these commands report their progress on PowerShell's Information stream. The `6>&1` redirection displays that output in the console — without it you will not see any progress messages.
{% endhint %}
{% endstep %}

{% step %}
#### Add the target parameters

`Set-RJAutomationAccount` needs to know where to deploy. Complete the last line before running it:

```powershell
Set-RJAutomationAccount -ResourceGroupName "rg-realmjoin" -SubscriptionId "<SubscriptionId>" -Token "<Token>" 6>&1
```

* `-ResourceGroupName` is required. If you leave it out, PowerShell prompts you for it.
* `-SubscriptionId` is optional — without it, the subscription of your current Azure context is used, and you are asked to choose if several are available.
* `-AutomationAccountName` is optional. Pass it to use an **existing** Automation Account; otherwise a new one is created with a generated name.

{% hint style="warning" %}
Pointing the command at an existing Automation Account also asserts the settings RealmJoin expects on it: a system-assigned managed identity, the Basic SKU and public network access. Check whether that matches your requirements before reusing an account.
{% endhint %}
{% endstep %}

{% step %}
#### Run the command

Paste the block into a new PowerShell session and run it. The token is valid for roughly an hour — if it has expired, reload the settings page and copy the command again.

You will be prompted to sign in with `Connect-AzAccount`. If your account has access to several tenants or subscriptions, the module asks you to choose.

The deployment runs in three steps — service principal, Automation Account, permissions — and reports every resource as it is created. A single run usually takes a few minutes.

{% hint style="info" %}
Want to see what would happen first? Append `-WhatIf` for an Azure Resource Manager What-If preview. Note that signing in and installing the `Az` modules still happens, because the preview needs both.
{% endhint %}
{% endstep %}

{% step %}
#### Assign the Entra ID roles to the managed identity

The setup grants the managed identity its application permissions, but not its Entra ID directory roles. Assign those now — see [Granting roles and permissions](azure-ad-roles-and-permissions.md#granting-roles-and-permissions) for the current list and a script that does it.

The managed identity's object ID is shown in the Azure Portal on the Automation Account under Account Settings > Identity.

<figure><img src="../../.gitbook/assets/image (9).png" alt=""><figcaption><p>Managed identity of the Automation Account</p></figcaption></figure>
{% endstep %}

{% step %}
#### Verify in the Portal and start the first sync

Return to **Settings → Runbooks** and select **Refresh**. RealmJoin picks up the new configuration and starts the initial runbook import. Leave the page open until the sync has completed.

Subscription, resource group, Automation Account name and location are now shown read-only under **Azure connection** — they are maintained by the PowerShell module from now on.
{% endstep %}
{% endstepper %}

## Settings you manage in the Portal

Two settings stay editable in **Settings → Runbooks** after the setup:

* **Branch** — the branch of the [shared runbook repository](https://github.com/realmjoin/realmjoin-runbooks) you want to follow. The setup sets this to `production`, which is the right choice unless you have a reason to deviate.
* **Enable Hybrid Runbook Worker sync** and the worker group to use, see [Hybrid Runbook Worker](../runbooks/hybrid-runbook-worker.md). The group has to be registered in the Automation Account before it can be selected here.

Saving either of them triggers a runbook sync.

If you run into configuration or permission problems later, the **Show cmdlet** button under Azure connection brings the command back — re-running it is safe and only applies what is missing.

## Legacy setup (per-tenant app registration)

{% hint style="warning" %}
The setup below creates a **RealmJoin Runbook Management** app registration with a client secret in your tenant. It is documented only for reference on tenants that were configured this way in the past. Do not use it for new configurations — follow the [Setup](./#setup) above, or [switch an existing configuration to the managed app](managed-app-migration.md).
{% endhint %}

<details>

<summary>Show the legacy setup</summary>

{% embed url="https://www.youtube.com/watch?v=Ijp9XnE8UuA" %}

On this path, the Automation Account was created by hand in the Azure Portal, its permissions were assigned with two external scripts, and RealmJoin authenticated with a per-tenant app registration and client secret.

**Part 1 — Create an Azure Automation Account**

1. Navigate to your [Azure Portal > Automation Accounts](https://portal.azure.com/#create/Microsoft.AutomationAccount) and create a new Automation Account.
2. In the Basics tab, choose your Subscription, Resource Group, Automation Account Name and Region.
3. In the Advanced tab, ensure the System Assigned Managed Identity is enabled.
4. Select Review + Create and create your Automation Account.
5. Navigate to the resource group containing the Automation Account and, in the IAM tab, assign the Automation Account as a Contributor.

![Creating the Automation Account](<../../.gitbook/assets/image (7).png>)

![Enabling the system assigned managed identity](<../../.gitbook/assets/image (8).png>)

**Part 2 — Assign permissions to the Automation Account**

Managed identity permissions cannot be granted through the Azure Portal. The [approle-and-directoryrole-granter](https://github.com/Workplace-Foundation/approle-and-directoryrole-granter) scripts assign both the app permissions and the Entra ID roles from the JSON files published in the [runbooks repository](https://github.com/realmjoin/realmjoin-runbooks/tree/production/docs/other/json):

```powershell
. .\GrantAppPermToEntApp.ps1 -enterpriseAppObjId "<ManagedIdentityObjectId>" -permissionsTemplate .\AllRealmJoinRunbooks_collected_permissions.json
. .\AssignAzureADRoleToEntApp.ps1 -objectId "<ManagedIdentityObjectId>" -rolesTemplate .\AllRealmJoinRunbooks_collected_rbacroles.json
```

**Part 3 — Create the service principal for RealmJoin**

In the Portal under Settings > Runbooks, the Tenant ID, Subscription ID and Resource Group were entered first; the page then showed an Azure CLI snippet to run, which created the **RealmJoin Runbook Management** app registration with Contributor rights on the resource group:

```
az provider register --namespace Microsoft.Automation
az ad sp create-for-rbac -n "RealmJoin Runbook Management" --role contributor --scopes /subscriptions/<SubscriptionId>/resourceGroups/<ResourceGroup>
```

**Part 4 — Complete the wizard**

Back in the Portal, the `appId` and `password` from that output were entered together with the Automation Account name, the branch of the shared runbook repository (`production`) and the location of the Automation Account. Saving started the initial runbook import.

![Automation Account connection in RealmJoin Portal](<../../.gitbook/assets/image (143).png>)

</details>
