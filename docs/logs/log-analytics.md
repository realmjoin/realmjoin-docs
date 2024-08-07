# Connecting Azure Log Analytics Workspace

## Overview

RealmJoin Portal can display possible issues with Windows updates like [Windows Update SafeGuard Holds](https://docs.microsoft.com/en-us/windows/deployment/update/safeguard-holds) by integrating with [Windows Update for Business Reports](https://learn.microsoft.com/en-us/windows/deployment/update/wufb-reports-overview).

Also, RealmJoin Portal will use Log Analytics to store Audit Log information and archive Runbook execution data past the default limits of Azure Automation (currently 30 days).

## Components

### Azure App Registration

RealmJoin will interact with both Log Analytics workspaces via an [Entra ID application registration](https://docs.microsoft.com/en-us/azure/active-directory/develop/app-objects-and-service-principals).&#x20;

{% hint style="info" %}
You can reuse the App Registration "RealmJoin Runbook Management" which is created when [onboarding runbooks](../automation/connecting-azure-automation/).
{% endhint %}

This app will be authenticated using a ClientId and ClientSecret. Using a certificate or Managed Identity is currently not supported.

Please grant the app "**Monitoring Reader**" permissions on the Log Analytics accounts used for [Windows Update for Business Reports Integration](log-analytics.md#windows-update-for-business-reports-integration) and "**Monitoring Contributor**" for the [RealmJoin Audit logs](log-analytics.md#realmjoin-audit-logs) Log Analytics account.

RealmJoin will also use the [Customer Workspace Key](log-analytics.md#customer-workspace-key) to write data directly into [RealmJoin Audit Logs](log-analytics.md#realmjoin-audit-logs).

### Windows Update for Business Reports Integration

[Windows Update for Business Reports](https://learn.microsoft.com/en-us/windows/deployment/update/wufb-reports-overview) needs to be configured in your environment in order to leverage this feature. It will write update-related events into an [Azure Log Analytics Workspace](https://docs.microsoft.com/en-us/azure/azure-monitor/logs/log-analytics-overview). RealmJoin can read the events from this Log Analytics Workspace and display them on the[ device's details page](../ugd-management/user-list/device-details.md).

{% hint style="info" %}
You can use the same Log Analytics Account for both [Windows Update for Business Reports](https://learn.microsoft.com/en-us/windows/deployment/update/wufb-reports-overview) and [RealmJoin Audit Logs](log-analytics.md#realmjoin-audit-logs). Please assign "**Monitoring Contributor**" permissions in this case.
{% endhint %}

### RealmJoin Audit Logs

RealmJoin can use a Log Analytics workspace to store its own audit logs as well as archive runbook logs after the maximum retention in Azure Automation (currently 30 days).

Please be aware, in order to store logs for longer than 30 days, you will need to modify the [workspace's default data retention](https://learn.microsoft.com/en-us/azure/azure-monitor/logs/data-retention-archive?tabs=portal-1%2Cportal-2), which is also set to 30 days by default.

## Setup

### Part 1 - Authentication using Azure App Registration

1. In the Azure Portal, navigate to Microsoft Entra ID > Manage > App Registrations.
2. Select the All Applications tab.
3. Choose your next step.

{% tabs %}
{% tab title="Existing Runbook Integration" %}
If you have already [integrated with Azure Runbooks](../automation/connecting-azure-automation/), you can re-use your existing App Registration.

1. Select the "RealmJoin Runbooks Management" App Registration.
2. Navigate to Manage > Certificates & Secrets.
3. Select the "Client Secrets" tab.
4. Create a new client secret.
   * Set description and expiration according to your internal naming and security policies.
{% endtab %}

{% tab title="New App Registration" %}
If you have not integrated runbooks or prefer a separate app registration, do the following:

1. Select "New Registration"
2.  Provide a Name\


    <figure><img src="../.gitbook/assets/image (318).png" alt=""><figcaption></figcaption></figure>
3. Register the application
4. Select the application
5. Navigate to Manage > Certificates & Secrets
6. Select the "Client Secrets" tab
7. Create a new client secret
   * Set description and expiration according to your internal naming and security policies
{% endtab %}
{% endtabs %}

4. Securely note down the secret value to use in [Part 5](log-analytics.md#part-4-connecting-realmjoin-and-azure-log-analytics-workspace).

{% hint style="warning" %}
Navigating away from the Certificates & Secrets page will cause Azure to obfuscate the secret. The secret will not be retrievable and a new secret will need to be created.
{% endhint %}

### Part 2 - Creating a Log Analytics Workspace

1. In the Azure Portal, navigate to Log Analytics Workspace
2. Select Create
3. Provide a Resource Group, Name and Region as required
4. Navigate to the "Overview" tab
5. Note the following for [Part 5](log-analytics.md#part-5-connecting-realmjoin-and-azure-log-analytics-workspace)
   1. Resource Group Name
   2. Workspace Name
   3. Workspace ID

### Part 3 - Enabling Windows Update for Business Reports

1. In the Azure Portal, navigate to Monitor > Workbooks
2. Search for "Windows Update for Business reports"\
   ![](<../.gitbook/assets/image (320).png>)
3. Set your Subscription and the Workspace previously create. If a separate Workspace is preferred for RealmJoin logs and Windows Update for Business reports, create a separate Workspace and link instead.\
   ![](<../.gitbook/assets/image (321).png>)
4. Save Settings

{% hint style="warning" %}
Windows Update for Business reports may take up to 24 hours to apply
{% endhint %}

### Part 4 - Azure Permissions

1. Navigate to the subscription your Log Analytics Workspace resides in
2. Select Access Control (IAM)
3. Add a role assignment
4.  Provide your App Registration with Monitoring Contributor permissions\


    <figure><img src="../.gitbook/assets/image (319).png" alt=""><figcaption></figcaption></figure>
5. Review and Save the role assignment



### Part 5 - Connecting RealmJoin and Azure Log Analytics Workspace

<figure><img src="../.gitbook/assets/image (273).png" alt=""><figcaption><p>Log Analytics Settings Page</p></figcaption></figure>

1. In the RealmJoin Portal, navigate to Settings ![](<../.gitbook/assets/image (322).png>) > Log Analytics
2.  Fill in the fields:\
    Tenant Details

    *   **TenantId:** Please provide your Entra ID's tenant ID. Find this in the Entra ID Overview page\


        <figure><img src="../.gitbook/assets/image (325).png" alt=""><figcaption></figcaption></figure>

    Azure App Registration Details

    *   **ClientId:** RealmJoin will interact with the LogAnalytics workspace via an [Azure App Registration](log-analytics.md#azure-app-registration). Please provide the app's ClientId/AppId and Secret, so that RealmJoin can authenticate.\


        <figure><img src="../.gitbook/assets/image (329).png" alt=""><figcaption></figcaption></figure>
    *   **ClientSecret:** Used with the ClientId to provide access to RealmJoin. This is the secret made in [Part 1](log-analytics.md#part-1-authentication-using-azure-app-registration).\


        <figure><img src="../.gitbook/assets/image (330).png" alt=""><figcaption></figcaption></figure>

    Windows Update for Business Workspace Details

    * **Update Compliance Workspace Id:** Please provide the [Windows Update for Business Reports](log-analytics.md#windows-update-for-business-reports-integration) Log Analytics Workspace's ID from which to collect data.

    Workspace Details

    * **Subscription ID:** Please provide the Subscription ID from the [RealmJoin Audit Logs](log-analytics.md#realmjoin-audit-logs) Log Analytics account. The subscription ID is viewable in the Subscription Overview page.
    * **Resource Group**: Please provide the Resource Group Name from the [RealmJoin Audit Logs](log-analytics.md#realmjoin-audit-logs) Log Analytics account.
    * **Workspace Name:** Please provide the Workspace Name from the [RealmJoin Audit Logs](log-analytics.md#realmjoin-audit-logs) Log Analytics account.
    *   **Customer Workspace Id:** Please provide / create a Log Analytics workspace to store [RealmJoin audit log and runbook log data](log-analytics.md#realmjoin-audit-logs).\


        <figure><img src="../.gitbook/assets/image (328).png" alt=""><figcaption></figcaption></figure>
    *   **Customer Workspace Key:** RealmJoin will act as an agent to Log Analytics. Please provide the "Primary Key" to this workspace, as to allow writing data to the workspace.\


        <figure><img src="../.gitbook/assets/image (323).png" alt=""><figcaption></figcaption></figure>
3. Press **Save** after filling out all fields. The system will give you feedback if everything worked.
