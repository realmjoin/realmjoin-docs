# Connecting Azure Automation

## Overview

{% embed url="https://www.youtube.com/watch?v=Ijp9XnE8UuA" %}

To allow RealmJoin Portal to provide [runbooks ](../runbooks/)for automating daily tasks, you need to connect an [Azure Automation](https://learn.microsoft.com/en-us/azure/automation/overview) Account. This Automation Account will host your runbooks as well as the [permissions](../azure-ad-roles-and-permissions.md) needed for the runbooks to function in your environment.

This guide will help you to onboard either a new or existing Automation Account.

Please be aware, the Automation Account (its [Managed Identity](https://learn.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview), to be more precise) will potentially have far reaching [permissions ](../azure-ad-roles-and-permissions.md)in your environment, like the ability to modify group or user objects in Entra ID or mailboxes in Exchange Online. Please carefully limit the number of people with access to this Automation Account to prevent unwanted usage of the given permissions.

When reusing an existing Automation Account, be aware that RealmJoin Portal automates the creation, updating and removal of runbooks coming from the [shared online repository of runbooks](https://github.com/realmjoin/realmjoin-runbooks). This might not be possible for an existing Automation Account. If in doubt, it is recommended to create a dedicated Azure Automation Account for RealmJoin Runbooks.

## Azure Environment

### Subscription

An Azure Subscription is needed to host your Automation Account. It is recommended to choose a subscription where only dedicated administrators will have access.

[https://portal.azure.com/#blade/Microsoft\_Azure\_Billing/SubscriptionsBlade](https://portal.azure.com/#blade/Microsoft_Azure_Billing/SubscriptionsBlade)

Please note down the Subscription Id as it will be needed later.

### Resource Group

Choose or create an Azure Resource Group in your Azure Subscription, e.g. `rjrb-automation`.

[https://portal.azure.com/#create/Microsoft.ResourceGroup](https://portal.azure.com/#create/Microsoft.ResourceGroup)

![Create an Azure Resource Group](<../../.gitbook/assets/image (138).png>)

Please note down the Resource Group's name as it will be needed later.

## Azure Automation Account <a href="#user-content-azure-automation-account" id="user-content-azure-automation-account"></a>

Create an Azure Automation Account in the given Resource Group. In this example we will use the name `c4a8toydariaazacc01` for the Automation Account. It will host your shared and private runbooks.

[https://portal.azure.com/#create/Microsoft.AutomationAccount](https://portal.azure.com/#create/Microsoft.AutomationAccount)

Please note down the Automation Account's name as it will be needed later.

## Connect to RealmJoin Portal

### Entering Info - Part 1

It is assumed you already finished [onboarding RealmJoin Portal](../../realmjoin-deployment/onboarding-realmjoin-portal.md).

1. In RealmJoin Portal go to '[Settings -> Runbooks](https://portal.realmjoin.com/settings/runbooks-configuration)'.

![Automation Account Connection in RealmJoin Portal](<../../.gitbook/assets/image (249).png>)

2. Fill in the Azure Tenant ID, Subscription ID and Resource Group name.\
   You can review your Azure Tenant ID at [https://portal.azure.com/#blade/Microsoft\_AAD\_IAM/ActiveDirectoryMenuBlade/Overview](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview)\
   To choose Subscription ID and Resource Group name, see [above](./#subscription-and-resource-group).

**Please leave the windows / wizard open for now. We will return shortly in** [**part 2**](./#entering-info-part-2)**.**

### Granting Access for RealmJoin to Azure Automation

RealmJoin Portal will create two lines of [AZ CLI](https://docs.microsoft.com/en-us/cli/azure/what-is-azure-cli) Code beneath `ResourceGroup`. Example (with anonymized example values):

```
az provider register --namespace Microsoft.Automation
az ad sp create-for-rbac -n "RealmJoin Runbook Management" --role contributor --scopes /subscriptions/12345678-1234-1234-1234-123456789abc/resourceGroups/rjrb-automation-01
```

Executing those lines will create an [App Registration](https://docs.microsoft.com/en-us/azure/active-directory/develop/app-objects-and-service-principals) (Service Principal) in AzureAD that can interact with the your Automation Account. This is needed, so that RealmJoin can

* Create, List and Update Runbooks
* Start Runbooks
* Display Jobs and Output

RealmJoin Portal automatically included the information given [above](./#entering-info-part-1).

Please execute these two lines of code using AZ CLI with an administrative account that can create App Registrations and also grant contributor permissions on the chosen Resource Group.

{% hint style="info" %}
You can use [Azure CloudShell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview), so you don't need to install and authenticate a local copy of AZ CLI.
{% endhint %}

![Azure CloudShell - Create the App Registration](<../../.gitbook/assets/image (112).png>)

The command will return multiple values. Please note down the values for `appId` and `password`.

You can review the resulting App Registration in Entra ID. It will be named "RealmJoin Runbook Management".

![App Registrations in Azure Portal](<../../.gitbook/assets/image (268).png>)

### Entering Information - Part 2

1. In RealmJoin Portal return to the open window/wizard for '[Settings -> Runbooks](https://portal.realmjoin.com/settings/runbooks-configuration)'.
2. Continue filling in the missing values for `appId` and `password` we created in the [last step](./#granting-access-for-realmjoin-to-azure-automation). Also fill in the name of the Automation Account from [before](./#user-content-azure-automation-account).
3. Choose the Branch of the shared runbook repository you want to follow. \
   If unsure, please choose `production` \
   All runbook branches may be viewed here: [https://github.com/realmjoin/realmjoin-runbooks](https://github.com/realmjoin/realmjoin-runbooks)
4. Choosing the location to make sure your runbooks are executed in the correct [Azure region](https://docs.microsoft.com/en-us/azure/availability-zones/az-overview).

![Automation Account Connection in RealmJoin Portal](<../../.gitbook/assets/image (127).png>)

5. Press "Save" to start the initial import of runbooks. Please leave this window open until you see the message "Sync completed".

![](<../../.gitbook/assets/image (99).png>)

## Granting Permissions to your Runbooks

Please continue with [azure-ad-roles-and-permissions.md](../azure-ad-roles-and-permissions.md "mention") in [Process Automation](../runbooks/) to allow your runbooks to interact with objects in your environment.
