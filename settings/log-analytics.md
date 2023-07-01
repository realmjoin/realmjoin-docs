# Log Analytics

## Overview

RealmJoin Portal can display possible issues with Windows updates like [Windows Update SafeGuard Holds](https://docs.microsoft.com/en-us/windows/deployment/update/safeguard-holds) by integrating with [Windows Update for Business Reports](https://learn.microsoft.com/en-us/windows/deployment/update/wufb-reports-overview).

Also, RealmJoin Portal will use Log Analytics to store Audit Log information and archive Runbook execution data past the default limits of Azure Automation (currently 30 days).

### Azure App Registration

RealmJoin will interact with the LogAnalytics workspace via an [AzureAD application registration](https://docs.microsoft.com/en-us/azure/active-directory/develop/app-objects-and-service-principals). You can create one here, alternatively you can reuse RealmJoin Runbook Management which is created when [onboarding runbooks](../onboarding/connecting-azure-automation/).

This app will be called using a ClientId and ClientSecret. Using a certificate or managed id is currently not suppored.

Please grant the app "Monitoring Reader" permissions on the Log Analytics account used for [Windows Update for Business Reports Integration](log-analytics.md#windows-update-for-business-reports-integration).

Also grant the app "Contributor" permissions on the Log Analytics account used for storing [RealmJoin Audit logs](log-analytics.md#realmjoin-audit-logs).

### Windows Update for Business Reports Integration

[Windows Update for Business Reports](https://learn.microsoft.com/en-us/windows/deployment/update/wufb-reports-overview) needs to be configured in your environment to leverage this feature. It will write update-related events into an [Azure LogAnalytics Workspace](https://docs.microsoft.com/en-us/azure/azure-monitor/logs/log-analytics-overview). RealmJoin can read the events from this LogAnalytics Workspace and display them on the[ device's details page](../user-group-device-management/device-list/device-details.md).

Use the LogAnalytics Settings page to configure access to this workspace.&#x20;

### RealmJoin Audit Logs

RealmJoin can use a Log Analytics workspace to store its own audit logs as well as archive runbook logs after the maximum retention in Azure Automation (30 days).&#x20;

Please be aware, to store logs longer than 30 days, you will need to modify the [workspace's default data retention](https://learn.microsoft.com/en-us/azure/azure-monitor/logs/data-retention-archive?tabs=portal-1%2Cportal-2), which is also set to 30 days by default.&#x20;

### Parameters

<figure><img src="../.gitbook/assets/image (13).png" alt=""><figcaption></figcaption></figure>

You configure both features in the same UI in RealmJoin Portal.

#### TenantId

Please provide your AzureAD's tenant id.

#### ClientId and ClientSecret

RealmJoin will interact with the LogAnalytics workspace via an [Azure App Registration](log-analytics.md#azure-app-registration). Please provide the app's ClientId/AppId and Secret, so that RealmJoin can authenticate.

#### Update Compliance WorkspaceId

Please provide the [Windows Update for Business Reports](log-analytics.md#windows-update-for-business-reports-integration) LogAnalytics workspace's id from which to collect data.

#### Customer Workspace Id

Please provide / create a Log Analytics workspace to store [RealmJoin audit log and runbook log data](log-analytics.md#realmjoin-audit-logs).

#### Customer Workspace Key

RealmJoin will act as an agent to Log Analytics. Please provide the "Primary Key" to this workspace, as to allow writing data to the workspace.

<figure><img src="../.gitbook/assets/image (26).png" alt=""><figcaption></figcaption></figure>

Press **Save** after entering all fields. The system will give you feedback if everything worked.
