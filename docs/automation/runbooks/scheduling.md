---
description: Execute Runbooks repeatedly over time
---

# Runbook Scheduling

Some use cases for runbooks are better suited to be run repeatedly without interaction such as monitoring the health of a service or checking the remaining capacity of a storage.&#x20;

In those cases you can assign a schedule to a runbook and have Azure automatically run it for you at your desired schedule.

RealmJoin Portal allows you to assign schedules to runbooks as well as to manage and create schedules.

## Schedulability

By default, not all runbooks are flagged as schedulable. This is meant to easily indicate which runbooks are useful on a scheduled basis and which runbooks should preferably be used interactively.

By default, runbooks having the suffix `_scheduled` are flagged as schedulable. You can overwrite this behaviour using [runbook-permissions.md](runbook-permissions.md "mention").

## Assigning Schedules

If a runbook is flagged as schedulable, the "Schedule" button next to the runbook will become active.

<figure><img src="../../.gitbook/assets/image (209).png" alt=""><figcaption><p>Schedulable vs. non-schedulable runbook</p></figcaption></figure>

The schedule dialogue allows you to choose a [schedule ](scheduling.md#managing-schedules)and to configure the parameters for the runbook's execution. If the parameters are left empty, the runbook's defaults will be used.

<figure><img src="../../.gitbook/assets/image (177).png" alt=""><figcaption><p>Configuring a scheduled runbook</p></figcaption></figure>

RealmJoin Portal will show existing schedule-assignments when browsing the runbooks.

<figure><img src="../../.gitbook/assets/image (270).png" alt=""><figcaption><p>Scheduled runbook</p></figcaption></figure>

## Managing Schedules

Azure Automation allows administrators to define custom schedules for runbooks. You can use RealmJoin Portal to manage existing Azure Automation Schedules or to create new ones.

Use the navigation on the left, selecting the Runbook Logs ![](../../.gitbook/assets/jobs.png) and got the **Schedules** tab.

<figure><img src="../../.gitbook/assets/image (67).png" alt=""><figcaption><p>Runbook Schedules</p></figcaption></figure>

You can add a **New Schedule**, **Edit** or **Delete** an existing schedule from here.

### Default Schedules

If no schedules exist yet, RealmJoin Portal will offer a **Create default schedules** button:

<figure><img src="../../.gitbook/assets/image (59).png" alt=""><figcaption><p>Create Schedules</p></figcaption></figure>

Pressing this button will create a default set ("Hourly", "Daily", "Weekly", "Monthly") of schedules as seen above.

### New / Edit Schedule

When creating or editing a schedule, you can modify its name, description, start and end date/time and frequency.&#x20;

Execution of the runbook will happen on the days defined by start-date and frequency.&#x20;

For example: If you configure a weekly frequency with an interval of 1 week, starting on Thursday 9th of March 2023, then then runbook will be executed on every Thursday including and after 9th of march. Setting an interval of 2 weeks will make it run on march 9th and only every other ("every second") Thursday afterwards and so on.

The start-time defines at which time the execution will happen. Setting the timezone makes sure the time is interpreted accordingly.

<figure><img src="../../.gitbook/assets/image (64).png" alt=""><figcaption><p>Edit Schedule</p></figcaption></figure>
