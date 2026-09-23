---
type: Automation Guide
description: >-
  View RealmJoin runbook job metadata, real-time console output, and details
  from Azure Automation jobs.
---

# Runbook Job Details

## Overview

RealmJoin Portal allows you to view runbooks jobs from Azure Automation.

<figure><img src="../../../.gitbook/assets/image (127).png" alt=""><figcaption><p>Runbook Job Details</p></figcaption></figure>

On the left side of the page you will find metadata about the runbook job, its type/context, job ID and its caller.

Be aware, "caller" is only present when runbooks are RealmJoin-aware and report this information, as Azure Automation has no concept for this.

On the right, you will find multiple tabs, representing:

### Console

This will show a live feed of the runbooks output. In contrast to Azure Automation, output of a runbook is readable in real time.

If the job emitted tables, the console shows them in a compressed form by default, so that status lines stay readable. Use "Show full output" to switch to the complete, untruncated text and "Show compressed tables" to switch back.

Using "Copy to Clipboard" you can copy the full output to use it e.g. in a service/ITIL ticket system. This always copies the full output, regardless of which view is shown.

### Output Data

This renders the objects the runbook emitted as sortable, filterable tables, so that long values such as GUIDs stay fully readable instead of being truncated by the PowerShell console formatter. Each table can be exported to Excel or CSV.

Output Data is available for live runs only — for archived jobs, use the **Console** tab.

See [Runbook Output Data](../../../dev-reference/runbook-output-data.md) for how to work with the tables, and for what a runbook has to do so that its results show up here.

### Input

Review the parameters used to start the runbook job.

<figure><img src="../../../.gitbook/assets/image (118).png" alt=""><figcaption><p>Runbook Job Parameters</p></figcaption></figure>

### Errors and Warnings

If present, warnings and errors which are not part of regular output will be shown in these two tabs.

<figure><img src="../../../.gitbook/assets/image (244).png" alt=""><figcaption><p>Runbook Job Warnings</p></figcaption></figure>

### Exceptions

If the PowerShell script of the runbook threw an exception (and the runbook thus failed), you can review the Exception here.

Exceptions will also be shown above the regular output in **Console** if present to simplify identifying problems.

<figure><img src="../../../.gitbook/assets/image (180).png" alt=""><figcaption><p>Exception shown in Console</p></figcaption></figure>

### Source

This allows you to review the runbooks source code associated with this job.

<figure><img src="../../../.gitbook/assets/image (147).png" alt=""><figcaption><p>Runbook Source</p></figcaption></figure>
