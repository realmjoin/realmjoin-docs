# Runbook Job Details

## Overview

RealmJoin Portal allows you to view runbooks jobs from Azure Automation.&#x20;

<figure><img src="../../.gitbook/assets/image (8) (5).png" alt=""><figcaption><p>Runbook Job Details</p></figcaption></figure>

On the left side of the page you will find metadata about the runbook job, its type/context, job ID and its caller.&#x20;

Be aware, "caller" is only present when runbooks are RealmJoin-aware and report this information, as Azure Automation has no concept for this.

On the right, you will find multiple tabs, representing:

### Console

This will show a live feed of the runbooks output. In contrast to Azure Automation, output of a runbook is readable in real time.

Using "Copy to Clipboard" you can copy the full output to use it e.g. in a service/ITIL ticket system.

### Input

Review the parameters used to start the runbook job.

<figure><img src="../../.gitbook/assets/image (32).png" alt=""><figcaption><p>Runbook Job Parameters</p></figcaption></figure>

### Errors and Warnings

If present, warnings and errors which are not part of regular output will be shown in these two tabs.

<figure><img src="../../.gitbook/assets/image (22).png" alt=""><figcaption><p>Runbook Job Warnings</p></figcaption></figure>

### Exceptions

If the PowerShell script of the runbook threw an exception (and the runbook thus failed), you can review the Exception here.&#x20;

Exceptions will also be shown above the regular output in **Console** if present to simplify identifying problems.

<figure><img src="../../.gitbook/assets/image (24) (3).png" alt=""><figcaption><p>Exception shown in Console</p></figcaption></figure>

### Source

This allows you to review the runbooks source code associated with this job.

<figure><img src="../../.gitbook/assets/image (33) (1).png" alt=""><figcaption><p>Runbook Source</p></figcaption></figure>
