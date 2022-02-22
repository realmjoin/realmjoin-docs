# Log Analytics

![Log Analytics Settings](<../.gitbook/assets/image (10).png>)

## Overview

RealmJoin Portal can display possible issues with Windows updates like [Windows Update SafeGuard Holds](https://docs.microsoft.com/en-us/windows/deployment/update/safeguard-holds).

To do so, it [Microsoft Update Compliance](https://docs.microsoft.com/en-us/windows/deployment/update/update-compliance-get-started) needs to be configured in your environment. This will write update-related events into an [Azure LogAnalytics Workspace](https://docs.microsoft.com/en-us/azure/azure-monitor/logs/log-analytics-overview). RealmJoin can read the events from this LogAnalytics Workspace and display them on the[ device's details page](../user-group-device-management/device-list/device-details.md).

Use the LogAnalytics Settings page to configure access to this workspace.&#x20;

## Parameters

### TenantId

Please provide your AzureAD's tenant id.

### SubscriptionId

Please provide the Azure subscription's id, which hosts the LogAnalytics workspace.

### ClientId and ClientSecret

RealmJoin will interact with the LogAnalytics workspace via an AzureAD app. Please provide the app's ClientId/AppId and Secret, so that RealmJoin can authenticate.

### WorkspaceId

Please provide the LogAnalytics workspace's id from which to collect data.

