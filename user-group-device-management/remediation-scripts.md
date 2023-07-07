# Remediation Scripts

## Overview

[Intune remediation scripts](https://learn.microsoft.com/en-us/mem/intune/fundamentals/remediations) allow you to report and react to problems on your managed windows clients using scripts.

RealmJoin Portal allows you to review Intune remediation scripts in your environment, additionally glueckkanja-gab hosts a [set of managed and constantly updated scripts](https://github.com/realmjoin/realmjoin-remediation) for you to use in GitHub.

## Remediation Script List

<figure><img src="../.gitbook/assets/image (6) (1).png" alt=""><figcaption><p>Remediation Script List</p></figcaption></figure>

The Remediation Script List shows you all existing and available remediation scripts for your environment.&#x20;

### Search and Sort

You can search for scripts by Author, Status or Name. The search will update as you type.&#x20;

You can sort by most fields by clicking on the fields' header (name).

### Filters

Use filters to limit the items displayed by state

* **Any** (default) - Show all existing and available remediation scripts
* **Managed** - Show all remediation scripts managed by glueckkanja-gab. Available (a.k.a. "not staged"), staged and deployed.&#x20;
* **Staged** - Show only managed remediation scripts that have been imported into your Intune instance but not assigned to users/devices.
* **Deployed** - Show only managed remediation scripts that are assigned to users/devices.

## Remediation Script Details

When you click on a script's name, you can review a script's details, statistics and also its stage, as well as deploy or remove managed scripts in your environment.

On the left side of the page you will see metadata about the script, incl. flags such as if the scripts need to be executed on 32bit on a 64bit host.

<figure><img src="../.gitbook/assets/image (9) (3).png" alt=""><figcaption><p>Remediation Script Details</p></figcaption></figure>

Be aware, details can vary. For example, only scripts already staged/existing in your tenant can have a "last modified" date.

The right half of the page is split up into multiple tabs.&#x20;

* **Overview** - Basic information about the script
* **Detection Script Source** - See the PowerShell Source of the detection script.
* **Remediation Script Source** - See the PowerShell Source of the remediation script (which is optional).

Other tabs and UI elements depend on the state of the script package.

### Custom scripts

* **Assignments** - For scripts that you created outside of RealmJoin, you can review (but not change) the scripts' assignments to users and groups. This will also show the schedule for the detection script execution.

<figure><img src="../.gitbook/assets/image (5) (1) (3).png" alt=""><figcaption><p>Custom Script Assignments</p></figcaption></figure>

* **Statistics** - Show execution and device statistics for the script

<figure><img src="../.gitbook/assets/image (4) (1).png" alt=""><figcaption><p>Script Statistics</p></figcaption></figure>

### Managed Scripts

#### Not staged

If a managed script is not staged yet (i.e. does not exist in your Intune instance yet), RealmJoin Portal will offer a button to **Stage** the script in your environment.&#x20;

This will make the script available for assignment, but not have any effect on your devices yet.

<figure><img src="../.gitbook/assets/image (11).png" alt=""><figcaption><p>Stage a Managed Script</p></figcaption></figure>

#### Staged and Deployed

Managed Scripts that exist in your environment show the same information as other (custom) scripts in your environment like **existing assignments** and **statistics**, see [Custom Scripts](remediation-scripts.md#custom-scripts).&#x20;

#### Removal

Staged and deployed managed scripts can be removed from Intune using the **More** -> **Delete** button.

<figure><img src="../.gitbook/assets/image (7) (3).png" alt=""><figcaption><p>Delete a Managed Script</p></figcaption></figure>

Deleting a managed script will also remove its [Managed Groups](remediation-scripts.md#managed-groups) (if such exist).

#### Assignment

You can assign managed scripts to users and devices in the **Assignments** tab.

<figure><img src="../.gitbook/assets/image (8) (4).png" alt=""><figcaption><p>Assign Managed Scrips</p></figcaption></figure>

When assigning a **staged** script, its status will change to **deployed**. At this point it can affect clients and users.

You can use **Assign to All Users** and **Assign to All Devices** to you Intune's default assignment targets for this script. This will show a dialogue to define the desired schedule for evaluation (detection):

<figure><img src="../.gitbook/assets/image (10).png" alt=""><figcaption><p>Script Schedule Editor</p></figcaption></figure>

#### Managed Groups

Alternatively, you can **Create Managed Groups** to create AzureAD Groups that will be assigned instead of "All Devices" or "All Users".&#x20;

<figure><img src="../.gitbook/assets/image (2) (1).png" alt=""><figcaption><p>Managed Groups</p></figcaption></figure>

The naming scheme for Managed Groups can be defined in [Settings -> General](../settings/general.md).

When updates for the managed remediation script become available, RealmJoin will make sure that these groups will be assigned to the update remediation script.

You can use **change schedule** to open the Script Schedule Editor for this assignment.

Using **Unassign** will remove individual group assignemts.
