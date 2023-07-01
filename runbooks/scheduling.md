---
description: Execute Runbooks repeatedly over time
---

# Scheduling

Some usecases for runbooks are better suited to be run repeatedly without interaction. This can for example be to monitor the health of a service or checking the remaining capacity of a storage.&#x20;

In those cases you can assign a schedule to a runbook and have Azure automatically run it for you daily or in intervals you prefer.

RealmJoin Portal allows you to assign schedules to runbooks as well as to manage and create schedules.

## Schedulability

By default, not all runbooks are flagged as schedulable. This is meant to easily indicate which runbooks are most probably either useful on a scheduled basis and which runbooks should preferably be used interactively.

By default runbooks having the suffix `_scheduled` are flagged as schedulable. You can overwrite this behaviour using [runbook-permissions.md](runbook-permissions.md "mention").

## Assigning Schedules

If a runbook is flagged as schedulable, the "Schedule" button next to the runbook will become active.

<figure><img src="../.gitbook/assets/image (2) (3).png" alt=""><figcaption><p>Schedulable vs. non-schedulable runbook</p></figcaption></figure>

The schedule dialogue allows you to choose a [schedule ](scheduling.md#managing-schedules)and to configure the parameters for the runbook's execution. If the parameters are left empty, the runbook's defaults will be used.

<figure><img src="../.gitbook/assets/image (3).png" alt=""><figcaption><p>Configuring a scheduled runbook</p></figcaption></figure>

RealmJoin Portal will show existing schedule-assignments when browsing the runbooks.

<figure><img src="../.gitbook/assets/image (3) (3).png" alt=""><figcaption><p>Scheduled runbook</p></figcaption></figure>

## Managing Schedules

Azure Automation allows to define schedules, so that runbooks can be automatically triggered every day or every week etc. You can use RealmJoin Portal to manage existing Azure Automation Schedules or to create new ones.

Use the navigation on the left, selecting the clock icon ![](<../.gitbook/assets/image (5).png>) to get to [Runbook Schedules](https://portal.realmjoin.com/automation-accounts/schedules).

<figure><img src="../.gitbook/assets/image (4) (2).png" alt=""><figcaption><p>Runbook Schedules</p></figcaption></figure>

You can add a **New Schedule**, **Edit** or **Delete** an existing schedule from here.

### Default Schedules

If no schedules exist yet, RealmJoin Portal will offer a **Create default schedules** button:

<img src="../.gitbook/assets/image (6).png" alt="" data-size="original">

Pressing this button will create a default set ("Hourly", "Daily", "Weekly", "Monthly") of schedules as seen above.

### New / Edit Schedule

When creating or editing a schedule, you can modify its name, description, start- and end-date/time and frequency.&#x20;

Execution of the runbook will happen on the days defined by start-date and frequency. E.g. if you configure a weekly frequency with an interval of  1, starting on 9th of march 2023, a Thursday, then then runbook will be executed on every Thursday including and after 9th of march. Setting an interval of 2 will make it run on march 9th and only every other ("every second") Thursday afterwards and so on.

The start-time defines at which time the execution will happen. Setting the timezone makes sure the time is interpreted accordingly.

<figure><img src="../.gitbook/assets/image (1) (1).png" alt=""><figcaption></figcaption></figure>
