# Runbook Parameters

## Overview

This page allows you to specify the components needed to interact with Azure Automation and enable the use of [Runbooks (Process Automation)](../runbooks/).

## Parameters

![Runbook Integration Parameters](<../../.gitbook/assets/image (163).png>)

### TenantID

Please provide the unique [id of your Entra ID tenant](https://learn.microsoft.com/en-us/azure/cost-management-billing/manage/find-tenant-id-domain).

### SubscriptionID

Please provide the unique id of the Azure subscription hosting your Azure Automation Account.

### ResourceGroup

Please provide the name of the Azure ResourceGroup hosting your Azure Automation Account.

### ClientID and ClientSecret

RealmJoin will create an application in your Azure environment called "RealmJoin Runbook Management". This application will be used to interact with the Azure Automation Account. It will import runbooks from RealmJoin's central repository into your Automation Account and it will be used to start runbooks and to read runbook job logs.

Please provide the app's ClientID ("AppId") and ClientSecret, so that RealmJoin can authenticate against Azure Automation.

Make sure, that you securely store the ClientSecret. It will not be readable after saving this dialogue. If you click "Reset Setup", the field will be reset/emptied.&#x20;

### Branch

RealmJoin maintains a public repository of shared runbooks at [https://github.com/realmjoin/realmjoin-runbooks](https://github.com/realmjoin/realmjoin-runbooks)&#x20;

These runbooks are imported when you sync runbooks on the [General Settings](../../realmjoin-settings/general.md) page.&#x20;

Currently there are different git branches in this repository.&#x20;

* **production** - The main branch for production use. These runbooks are thoroughly tested, and we recommend using this branch.
* **master** - Early / Insider versions runbooks. These should be usable at any given time but are less well tested.
* **feature-{...}** - Specific features can be tested ahead of time by using specific features branches as part of a private preview or beta testing. Not recommended for general use.

Specify the name of the branch you want to use. "production" is recommended.

### Location

Specify the Azure Location to use when importing runbooks. This is a drop-down field and needs no typed input.
