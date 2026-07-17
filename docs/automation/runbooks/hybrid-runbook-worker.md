---
type: Automation Guide
description: >-
  Run RealmJoin runbooks on a Hybrid Runbook Worker so they can reach on-premises
  and private-network resources that the Azure cloud cannot.
---

# Hybrid Runbook Worker

By default, RealmJoin runbooks run in Microsoft's **Azure Automation cloud**. That is perfect for tasks against cloud services (Entra ID, Intune, Exchange Online, …), but the cloud has no line of sight into your **on-premises** or otherwise private network.

A **Hybrid Runbook Worker** solves this. It is a machine you run inside your own environment (for example on-premises, or in a private cloud network) and register with your Azure Automation Account. Runbooks that target that worker execute **on that machine, inside your network**, while still being started, tracked, and audited through RealmJoin just like any other runbook.

## Why you might use it

Use a Hybrid Runbook Worker whenever a runbook needs to reach something the Azure cloud can't:

* On-premises **Active Directory**, file servers, or print servers
* Line-of-business applications and databases hosted in your own datacenter
* Network devices, appliances, or internal APIs that are not exposed to the internet
* Any resource that must be accessed from inside your corporate network for security or connectivity reasons

You keep the convenience of RealmJoin's runbook experience (self-service, permissions, approvals, logging) while the actual work happens where your resources live.

## How it works

* **Where it runs.** A normal runbook runs in the Azure cloud sandbox. A hybrid runbook is handed to your Hybrid Runbook Worker instead, so it runs on your own machine and can talk to your internal resources.
* **Which runbooks are hybrid.** RealmJoin recognises a runbook as "hybrid" by its name: runbooks whose name ends with **`_hybrid`** are routed to your Hybrid Worker Group. All other runbooks continue to run in the cloud as before.
* **Where it runs, more precisely.** When a hybrid runbook starts, RealmJoin sends it to the **Hybrid Worker Group** you configured. A worker group can contain one or more machines; Azure Automation picks an available worker in that group to do the work.

{% hint style="info" %}
Enabling this feature does **not** move your existing runbooks off the cloud. Only runbooks named with the `_hybrid` suffix are directed to the Hybrid Runbook Worker.
{% endhint %}

## Prerequisites

Before you can enable the feature in RealmJoin, you need a working Hybrid Runbook Worker in your Azure Automation Account:

1. Deploy and register one or more machines as a **Hybrid Runbook Worker Group** in your Azure Automation Account. See Microsoft's guide on [Hybrid Runbook Workers](https://learn.microsoft.com/en-us/azure/automation/automation-hybrid-runbook-worker) for the setup steps.
2. Make sure those machines have network access to the on-premises or private resources your runbooks need.

{% hint style="warning" %}
If no Hybrid Runbook Worker Group exists in your Automation Account, RealmJoin cannot offer one to select and will ask you to register a worker first.
{% endhint %}

## Enabling it in RealmJoin

{% stepper %}
{% step %}
### Open your runbook settings

In the RealmJoin Portal, go to your runbook settings. The Hybrid Runbook Worker option becomes available once your initial runbook configuration has been saved.
{% endstep %}

{% step %}
### Turn on Hybrid Runbook Worker sync

Enable **Enable Hybrid Runbook Worker sync**. RealmJoin will read the Hybrid Worker Groups registered in your Azure Automation Account.
{% endstep %}

{% step %}
### Choose a Hybrid Worker Group

Select the **Hybrid Worker Group** that your hybrid runbooks should run on, then save. This becomes the default target for all `_hybrid` runbooks in your tenant.
{% endstep %}
{% endstepper %}

## Running a hybrid runbook

Running a hybrid runbook works exactly like any other runbook — your support and administration staff don't need to do anything special.

* When a runbook is directed to a Hybrid Runbook Worker, the run dialog shows a note such as *"Will run on hybrid runbook worker group: …"* so it is clear where the task will execute.
* If a runbook is configured with more than one worker group to choose from, the operator can **select which Hybrid Runbook Worker Group** to use when starting it.
* Runbooks that require [approval](runbook-permissions.md) keep the selected worker group, so the task runs on the intended worker once approved.

{% hint style="info" %}
Runbook logs and job details are available in the RealmJoin Portal as usual — see [Runbook Logs](runbook-logs/) — regardless of whether a runbook ran in the cloud or on a Hybrid Runbook Worker.
{% endhint %}
