# Runbook Logs

## Overview

Runbook logs allows you to review recent and archived runbook executions (jobs).

<figure><img src="../../.gitbook/assets/image (34).png" alt=""><figcaption><p>Runbook Job List</p></figcaption></figure>

### Type and Category

Runbooks in RealmJoin Portal are scoped to either the organization (tenant), a device, a user or a group to align with [User, Group and Device management](../../user-group-device-management/).

Also, categories can be used to organize runbooks into specific topics. The default categories are "general", "mail", "security".

Both type and category influence when/where a runbook will be offered in RealmJoin Portal and are reflected in Runbook logs to allow searching and sorting accordingly. See [Naming Conventions](../naming-conventions.md) to understand how type and category are assigned to a runbook.

### Search and Sort

You can search for jobs by job ID, name, type, category. The search will update while you type.&#x20;

You can sort by most fields by clicking on the fields header (name).

### Job Details

Click on a job's ID to open the jobs details page, which will show more metadata, the runbooks output and parameters. See [Runbook Job Details](runbook-job-details.md).

<figure><img src="../../.gitbook/assets/image (19).png" alt=""><figcaption><p>Runbook Job Details</p></figcaption></figure>

## Scheduled Jobs and Schedules

#### Scheduled Jobs

Click **Scheduled Jobs** to see all scheduled jobs in aour Azure Automation Account, regardless of type/context.

<figure><img src="../../.gitbook/assets/image (16).png" alt=""><figcaption><p>Scheduled Jobs</p></figcaption></figure>

You can **Delete** the scheduled job using the button right of the job. This will not delete the runbook, only the scheduled job.

See [Scheduling](../scheduling.md#assigning-schedules) to create new scheduled jobs.

#### Schedules

Click **Schedules** to view and manage available schedules for your runbooks.

See [Scheduling ](../scheduling.md#managing-schedules)to learn more.

## Archived Logs

Azure Automation will only keep runbook job logs for a limited time. RealmJoin offers to copy/archive runbook logs into a Log Analytics Workspace to preserve them for a longer time. This will only be available after you correctly configured/onboarded [Log Analytics](../../settings/log-analytics.md).

Please be aware that you have to modify the Workspace's retention time to accommodate your needs as this will limit how long archived logs can be stored.

Click **Archived** to switch from the recent logs in Azure Automation to those stored in Log Analytics.

<figure><img src="../../.gitbook/assets/image.png" alt=""><figcaption><p>Archived Runbook Job Logs List</p></figcaption></figure>

You can search and inspect these the same as the regular logs under **Recent**.
