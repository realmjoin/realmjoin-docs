---
type: Deployment Guide
description: >-
  Recommendations for moving the Azure resources connected to RealmJoin — Key
  Vault, Log Analytics workspace, Automation Account and Workplace Cloud
  Storage — to another Azure subscription.
---

# Moving Azure Resources to Another Subscription

{% hint style="warning" %}
**This page is a recommendation, not a supported migration service.** The Azure resources described here live in your own subscription and are managed by you; RealmJoin only connects to them. The move itself is an Azure operation and your responsibility. RealmJoin support can help only to a limited extent — mainly with reconnecting the resources to RealmJoin afterwards. For issues with the Azure move itself, please contact Microsoft support.
{% endhint %}

## Overview

Use the Azure **Move → Move to another subscription** function for every resource instead of creating new ones. A move keeps names, endpoints and data, so most connections to RealmJoin keep working as they are.

| Resource                                                                                                   | Used by RealmJoin for                     | What to do after the move                                    |
| ---------------------------------------------------------------------------------------------------------- | ----------------------------------------- | ------------------------------------------------------------ |
| [Key Vault](#key-vault-laps)                                                                               | LAPS passwords                            | Nothing in RealmJoin — verify only                           |
| [Log Analytics workspace](#log-analytics-workspace)                                                        | Audit log, operational and runbook logs   | Run `Set-RJLogAnalyticsWorkspace` again with the new target  |
| [Automation Account](#automation-account-runbooks)                                                         | Runbooks                                  | Run `Set-RJAutomationAccount` again with the new target      |
| [Storage account](#workplace-cloud-storage)                                                                | Workplace Cloud Storage                   | Nothing in RealmJoin — verify only                           |

## General Considerations

* **Same Entra ID tenant.** This page assumes that the old and the new subscription belong to the same Microsoft Entra ID tenant. Moving resources to another tenant is a different scenario and is not covered here.
* **Move, don't recreate.** A new resource gets new names, keys or certificates. For the Key Vault this means that existing LAPS passwords can no longer be decrypted (see below).
* **Same region.** A move never changes the region of a resource. Create the target resource group in the **same region** as the resources you move — for the Automation Account this is required (see below).
* **Role assignments do not move.** Azure role assignments made directly on a moved resource are orphaned and must be created again. The RealmJoin setup commands do this for you.
* **Blockers.** Remove resource locks temporarily and check the Azure Policies of the target subscription before you start. Azure validates every move and reports what blocks it.
* **Timing.** Plan the move of the Log Analytics workspace and the Automation Account in a quiet period and reconnect them right afterwards (see the respective sections).

See also Microsoft's [move guidance](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/move-resource-group-and-subscription) and the list of [resource types that support moves](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/move-support-resources).

## Key Vault (LAPS)

RealmJoin only stores the DNS name of the Key Vault. The name stays the same during a move, so RealmJoin LAPS keeps working without any change in RealmJoin.

{% hint style="danger" %}
**Do not replace the Key Vault with a new one.** LAPS passwords are encrypted with the `realmjoin-master` certificate, whose private key is not exportable. A new vault gets a new certificate, and existing passwords can no longer be decrypted. Key Vault backups can only be restored within the same subscription, so they are no alternative. Recreating the vault means recreating all LAPS accounts on all devices.
{% endhint %}

1. Check the permission model under **Key Vault → Access configuration**:
   * **Vault access policy** (as described in [KeyVault](../../realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/keyvault.md)): the access policies move with the vault — nothing to do.
   * **Azure role-based access control**: note the roles of the **RealmJoin** service principal on the vault and assign them again after the move.
2. Move the vault: **Key Vault → Overview → Move → Move to another subscription**. A vault used for VM disk encryption cannot be moved.
3. Verify: the certificate `realmjoin-master` still exists, and LAPS passwords can still be displayed in RealmJoin Portal for a few devices.

During the move, Azure only blocks management operations. Reading and writing secrets keeps working.

## Log Analytics Workspace

The workspace ID, your logs and the retention settings stay the same. However, the [Data Collection Rules](../../monitoring-and-logs/log-analytics.md#components) that RealmJoin writes through **cannot be moved**: they stay in the old subscription and no longer point to the workspace. The role assignments for RealmJoin on the workspace are lost as well.

{% hint style="warning" %}
Between the end of the move and the reconnection below, RealmJoin cannot write logs. **Audit log entries from this period are not delivered later.** Move the workspace in a quiet period and reconnect it immediately afterwards.
{% endhint %}

1. Before the move, remove solutions or a linked Automation Account from the workspace, if there are any — Azure does not move a workspace with linked services.
2. Move the workspace: **Log Analytics workspace → Overview → Subscription: change**. Do not select the Data Collection Rules (`dcr-rj-*`). The move can take a while.
3. In RealmJoin Portal, open **Settings → Log Analytics** and copy the setup command.
4. **Replace the subscription ID and resource group** in the command with the new values. Keep the workspace name — without it, a new workspace would be created.

   ```powershell
   Set-RJLogAnalyticsWorkspace -ResourceGroupName "<new resource group>" -WorkspaceName "<existing workspace name>" -SubscriptionId "<new subscription ID>" -Token "<Token>" 6>&1
   ```
5. Run the command as described in [Connecting Azure Log Analytics Workspace](../../monitoring-and-logs/log-analytics.md#setup). It leaves the existing workspace and its data untouched, creates new Data Collection Rules in the workspace's region, assigns the required roles and registers the new values with RealmJoin.
6. In **Settings → Log Analytics**, select **Refresh** and **Check for configuration problems**. Then check that new entries appear in the [Audit Log](../../monitoring-and-logs/audit-log.md).
7. Delete the old Data Collection Rules in the old subscription.

{% hint style="info" %}
**Still using the workspace ID and shared key?** Azure regenerates the workspace keys during a move, so logging stops immediately. Run the setup command as described above — it also switches your tenant to the Log Ingestion API (see [Migrating to the Log Ingestion API](../../monitoring-and-logs/log-ingestion-api-migration.md)).
{% endhint %}

{% hint style="info" %}
**Windows Update for Business Reports:** if the workspace RealmJoin reads update data from is moved as well, run `Grant-RJUpdateComplianceWorkspaceAccess` again afterwards. The workspace ID stays the same; only the role assignment is lost.
{% endhint %}

## Automation Account (Runbooks)

Runbooks, schedules, variables and credentials as well as the managed identity move with the Automation Account. RealmJoin, however, stores the subscription and resource group of the account and loses its role assignment on it, so the account must be reconnected.

{% hint style="warning" %}
The target resource group **must be in the same region** as the Automation Account — the setup command deploys the account into the region of its resource group. Until the account is reconnected, RealmJoin cannot sync or start runbooks.
{% endhint %}

1. Note the object ID of the managed identity (**Automation Account → Account Settings → Identity**).
2. If the Automation Account is linked to a Log Analytics workspace (for example for Update Management or Change Tracking), remove these features and unlink the workspace first, as described by [Microsoft](https://learn.microsoft.com/en-us/azure/automation/how-to/move-account).
3. Move the Automation Account to the target resource group.
4. In RealmJoin Portal, open **Settings → Runbooks** and copy the setup command. **Replace the subscription ID and resource group** with the new values and keep the Automation Account name.

   ```powershell
   Set-RJAutomationAccount -ResourceGroupName "<new resource group>" -AutomationAccountName "<existing account name>" -SubscriptionId "<new subscription ID>" -Token "<Token>" 6>&1
   ```
5. Run the command as described in [Connecting Azure Automation](../../automation/connecting-azure-automation/README.md#setup). It assigns the role for RealmJoin on the account again and registers the new values with RealmJoin.
6. Verify:
   * The object ID of the managed identity is unchanged. If it has changed, grant its [roles and permissions](../../automation/connecting-azure-automation/azure-ad-roles-and-permissions.md#granting-roles-and-permissions) again.
   * **Settings → Runbooks → Refresh** shows the new values and the runbook sync completes.
   * A test runbook runs successfully.
   * If you use [Hybrid Runbook Workers](../../automation/runbooks/hybrid-runbook-worker.md), they still connect.

## Workplace Cloud Storage

RealmJoin connects to the storage account with its connection string, which contains the account name and access key. Both stay the same during a move, so the public URLs of your favorites, backgrounds, files and signatures keep working.

1. Move the storage account to the target resource group.
2. Verify: upload a test file in RealmJoin Portal under **Organization → Other Files**. If an error occurs, copy the connection string again from **Storage account → Access keys** and save it under **Settings → Workplace cloud storage** (see [Workplace Cloud Storage](../../administration-and-settings/workplace-cloud-storage.md#create-storage-account)).

## Checklist

* [ ] Old and new subscription belong to the same Entra ID tenant
* [ ] Target resource groups are in the same region as the resources
* [ ] Resource locks removed, Azure Policies of the target subscription checked
* [ ] Key Vault: LAPS passwords can be displayed
* [ ] Log Analytics: setup command run with the new values, configuration check passes, audit log entries appear
* [ ] Automation Account: setup command run with the new values, runbook sync completes, test runbook succeeds
* [ ] Workplace Cloud Storage: test upload succeeds
* [ ] Old Data Collection Rules and orphaned role assignments removed, resource locks restored
