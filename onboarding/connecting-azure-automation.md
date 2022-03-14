# Connecting Azure Automation

## Overview

To enable RealmJoin Portal to offer [runbooks ](../runbooks/)as a way to automate daily operations, you need to connect an [Azure Automation Account](https://azure.microsoft.com/en-us/services/automation/). This Automation Account will host your runbooks as well as the [permissions](../runbooks/azure-ad-roles-and-permissions.md) needed for the runbooks to function in your environment.

This guide will help you to onboard either a new or existing Automation Account.

Please be aware, the [RunAs-Account](https://docs.microsoft.com/en-us/azure/automation/create-run-as-account) (Automation Account's identity) will potentially have far reaching [permissions ](../runbooks/azure-ad-roles-and-permissions.md)in your environment, like the ability to modify group- or user-objects in AzureAD or mailboxes in Exchange Online. Please carefully limit the number of people with access to this Automation Account to prevent unwanted usage of the given permissions.

When reusing an existing Automation Account, be aware that RealmJoin Portal automates the creation, updating and removal of runbooks coming from the [shared online repository of runbooks](https://github.com/realmjoin/realmjoin-runbooks). This might not be adequate for an existing Automation Account. If in doubt, it is recommended to create a dedicated Azure Automation Account.

## Azure Environment

### Subscription

Please choose an Azure Subscription to host your Automation Account. It is recommended to choose a subscription where only dedicated administrators will have access.

[https://portal.azure.com/#blade/Microsoft\_Azure\_Billing/SubscriptionsBlade](https://portal.azure.com/#blade/Microsoft\_Azure\_Billing/SubscriptionsBlade)

Please note down the Subscription Id as it will be needed later.

### Resource Group

Choose or create an Azure Resource Group in your Azure Subscription, e.g. `rjrb-automation`.

[https://portal.azure.com/#create/Microsoft.ResourceGroup](https://portal.azure.com/#create/Microsoft.ResourceGroup)

![Create an Azure Resource Group](<../.gitbook/assets/image (2) (1) (1).png>)

Please note down the Resource Group's name as it will be needed later.

## Azure Automation Account <a href="#user-content-azure-automation-account" id="user-content-azure-automation-account"></a>

Create an Azure Automation Account in the given Resource Group. In this example we will use the name `c4a8toydariaazacc01` for the Automation Account. It will host your shared and private runbooks.

[https://portal.azure.com/#create/Microsoft.AutomationAccount](https://portal.azure.com/#create/Microsoft.AutomationAccount)

Make sure, to have "Create Azure Run As account" set to "Yes".

Please note down the Automation Account's name as it will be needed later.

## Connect to RealmJoin Portal

### Entering Info - Part 1

It is assumed you already finished [onboarding RealmJoin Portal](onboarding-realmjoin-portal.md).

In RealmJoin Portal go to '[Settings -> Runbooks](https://portal.realmjoin.com/settings/runbooks-configuration)'.

![Automation Account Connection in RealmJoin Portal](<../.gitbook/assets/image (1) (1) (1) (1) (1) (1).png>)

Please fill in the AzureAD Tenant Id, Subscription Id and Resource Group name.

You can review your AzureAD Tenant Id at [https://portal.azure.com/#blade/Microsoft\_AAD\_IAM/ActiveDirectoryMenuBlade/Overview](https://portal.azure.com/#blade/Microsoft\_AAD\_IAM/ActiveDirectoryMenuBlade/Overview)

To choose Subscription Id and Resource Group name, see [above](connecting-azure-automation.md#subscription-and-resource-group).

Please leave the windows / wizard open for now. We will return shortly in [part 2](connecting-azure-automation.md#entering-info-part-2).

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

RealmJoin Portal automatically included the information given [above](connecting-azure-automation.md#entering-info-part-1).

Please execute these two lines of code using AZ CLI with an administrative account that can create App Registrations and also grant contributor permissions on the chosen Resource Group.

Tipp: You can use [Azure CloudShell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview), so you don't need to install and authenticate a local copy of AZ CLI.

![Azure CloudShell - Create the App Registration](<../.gitbook/assets/image (4) (1) (1) (1).png>)

The command will return multiple values. Please note down the values for `appId` and `password`.

You can review the resulting App Registration in AzureAD. It will be named "RealmJoin Runbook Management".

![App Regsitrations in Azure Portal](<../.gitbook/assets/image (10) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (2) (1) (1).png>)

### Entering Info - Part 2

In RealmJoin Portal return to the open window/wizard for '[Settings -> Runbooks](https://portal.realmjoin.com/settings/runbooks-configuration)'.

Continue filling in the missing values for `appId` and `password` we created in the [last step](connecting-azure-automation.md#granting-access-for-realmjoin-to-azure-automation). Also fill in the name of the Automation Account from [before](connecting-azure-automation.md#user-content-azure-automation-account).

Choose the Branch of the shared runbook repository you want to follow, wither `master` or `production`. If unsure, please choose `production` as `master` will have more bleeding edge / preview runbooks in a less tested state.

Choosing the location to make sure your runbooks are executed in the correct [Azure region](https://docs.microsoft.com/en-us/azure/availability-zones/az-overview).

![Automation Account Connection in RealmJoin Portal](<../.gitbook/assets/image (9) (1) (1) (1) (1) (1) (1).png>)

Press "Save" to start the initial import of runbooks. Please leave this window open until you see the message "Sync completed".

![](<../.gitbook/assets/image (5) (1) (1) (1) (1) (1).png>)
