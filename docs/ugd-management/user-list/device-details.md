# Device Details

## Overview

This page provides information about the device you’ve selected from the [Device List](./).

<figure><img src="../../../.gitbook/assets/image (163).png" alt=""><figcaption><p>Device Details</p></figcaption></figure>

The right side will show one of multiple tabs. The default **Overview** tab view will include information (if available) like

* The currently logged on user&#x20;
* Currently installed apps/software, either managed by RealmJoin or Intune
* Security recommendations and if these are met by the device

### **Object Properties**

The left section of the Device Details page will show an overview of the core properties like

* Display Name
* Entra ID Object ID
* Device Owner
* Operating System
* Serial Number
* Additional properties&#x20;

on the left side of the screen in a glanceable way. This part will not scroll and be always visible in any tab.

### Status Information

The core properties include some glanceable information about the status of a device object. Some statuses these are presented via icons that are either blue (active / present) or red (inactive missing).

<img src="../../../.gitbook/assets/image (233).png" alt="" data-size="original">Endpoint Management active

![](<../../../.gitbook/assets/image (262).png>)Disk Encryption enabled

![](<../../../.gitbook/assets/image (202).png>)Defender ATP enabled

![](<../../../.gitbook/assets/image (180).png>)A/V up to date

![](<../../../.gitbook/assets/image (235).png>)Compliant device

![](<../../../.gitbook/assets/image (166).png>) When the object was created

![](<../../../.gitbook/assets/image (245).png>) Last seen activity / Last contact

Other bits of information are presented as tags:

* AzureAD - This device is Entra ID Joined&#x20;
* TPM2 - TPM2 is present and enabled
* Autopilot - This device is managed via Autopilot
* Company - Company Owned (not Personal)
* Personal - Personal, not Company Owned

### Local Admin Management (LAPS)

When combined with the [RealmJoin Client](../../realmjoin-agent/realmjoin-client/), RealmJoin Portal can help with support tasks on windows clients that need local admin permissions by offering on-demand support accounts on clients. In many cases this removes the need to grant local admin permissions to the primary user of the device just to solve a one-time need.

![LAPS management](<../../../.gitbook/assets/image (232).png>)

By default, a local admin emergency account is created on a windows client. This account is useable even if network connectivity to the client fails. This is kind of a last resort.

It is recommended to use a "Support Account". When clicking "**Request**", a job is created/queued and RealmJoin Client will create an on-demand local admin account next time it syncs to the backend. This can take up to 30 minutes or alternatively a "Sync this device" can be triggered on the client to speed up the process. RealmJoin Portal will show state of "Requested" until the account is created and automatically switches to a view similiar to the Emergency Account when ready:

![Support Account](<../../../.gitbook/assets/image (52).png>)

Click the dots to reveal the password.

The Support Account will automatically be removed after 12 hours.

See the [LAPS documentation](../../realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/) for more details.

## Warranty

Use the **Warranty** tab to display information like remaining vendor warranty time for supported vendors/devices.

<figure><img src="../../../.gitbook/assets/image (124).png" alt=""><figcaption><p>Warranty Information</p></figcaption></figure>

Depending on the API used, a captcha might be displayed before requesting/displaying warranty information.

## Actions

You can use the button **Sync** to trigger a Sync of Intune Policies and RealmJoin Action, like queued [LAPS](device-details.md#local-admin-management-laps) account creations.

**Scan** to trigger a (quick) scan of Windows Defender on a managed client.

## Runbooks

"[Runbooks](../../automation/runbooks/)" showing available runbooks for devices.

## RAW data sources

RAW [data sources](../user-group-device-management.md#data-sources) displayed as JSON (only available for RealmJoin administrators):

* Entra ID
* Intune
* Autopilot
* Defender
* RealmJoin

{% hint style="info" %}
The RealmJoin state is updated when the agent checks in. Retention is 90 days. If a device is offline for more than 90 days, the state will not be available any more (icon greyed out). If it checks in again, the state will be re-evaluated and displayed after some minutes.
{% endhint %}
