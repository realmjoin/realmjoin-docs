# Device Details

## Overview

This page shows you details regarding a single device.

<figure><img src="../../.gitbook/assets/image (24) (4).png" alt=""><figcaption><p>Device Details</p></figcaption></figure>

The left side of the page will show device metadata incl. the device's owner, OS and serial number.

The right side will show one of multiple tabs. The default **Overview** tab view will include information (if available) like

* The currently logged on user&#x20;
* Currently installed apps/software, either managed bei RealmJoin or Intune
* Security recommendations and if these are met by the device

### Object Types

The category "devices" includes:

* AzureAD joined clients, like modern workplace clients
* AzureAD registered devices, like user-owned phones and tablets
* Other devices, like printers used by MS Universal Printing or SurfaceHubs

### **Object Properties**

Every device details page will show an overview of the core properties like

* Display Name
* AzureAD Object ID
* Owner of the device
* Operating System
* Additional properties&#x20;

on the left side of the screen in a glanceable way. This part will not scroll and be always visible in any tab.

### Status information

The core properties include some glanceable information about the status of a device object. Some statuses these are presented via icons that are either blue (active / present) or red (inactive missing).

<img src="../../.gitbook/assets/image (8) (1) (1) (1) (1) (1).png" alt="" data-size="original">Endpoint Management active

![](<../../.gitbook/assets/image (14) (1) (1) (1) (1) (1).png>)Disk Encryption enabled

![](<../../.gitbook/assets/image (1) (1) (1).png>)Defender ATP enabled

![](<../../.gitbook/assets/image (6) (1) (1) (1) (1).png>)A/V up-to-date

![](<../../.gitbook/assets/image (16) (1) (1) (1) (1) (1).png>)Compliant device

![](<../../.gitbook/assets/image (5) (1) (1) (1).png>) When the object was created

![](<../../.gitbook/assets/image (2) (2).png>) Last seen activity / Last contact

Other bits of information are presented as tags:

* AzureAD - This device is AAD Joined&#x20;
* TPM2 - TPM2 is present and enabled
* Autopilot - This device is managed via Autopilot
* Company - Company Owned (not Personal)
* Personal - Personal, not Company Owned

### Local Admin Management (LAPS)

When combined with the [RealmJoin Client](../../realmjoin-client/), RealmJoin Portal can help with support tasks on windows clients that need local admin permissions by offering on-demand support accounts on clients. In many cases this removes the need to grant local admin permissions to the primary user of the device just to solve a one-time need.

![LAPS management](<../../.gitbook/assets/image (9) (1) (1) (1) (1).png>)

By default, a local admin emergency account is created on a windows client. This account is useable even if network connectivity to the client fails. This is kind of a last resort.

It is recommended to use a "Support Account". When clicking "**Request**", a job is created/queued and RealmJoin Client will create an on-demand local admin account next time it syncs to the backend. This can take up to 30 minutes or alternatively a "Sync this device" can be triggered on the client to speed up the process. RealmJoin Portal will show state of "Requested" until the account is created and automatically switches to a view similiar to the Emergency Account when ready:

![Support Account](<../../.gitbook/assets/image (8) (1) (1) (1).png>)

Click the dots to reveal the password.

The Support Account will automatically be removed after 12 hours.

See the [LAPS documentation](../../realmjoin-client/local-admin-password-solution-laps/) for more details.

## Warranty

Use the **Warranty** tab to display information like remaining vendor warranty time for supported vendors/devices.

<figure><img src="../../.gitbook/assets/image (5) (3).png" alt=""><figcaption><p>Warranty Information</p></figcaption></figure>

Depending on the API used, a captcha might be displayed before requesting/displaying warranty information.

## Actions

You can use the button **Sync** to trigger a Sync of Intune Policies and RealmJoin Action, like queued [LAPS](device-details.md#local-admin-management-laps) account creations.

**Scan** to trigger a (quick) scan of Windows Defender on a managed client.

## Other Tabs

The right side of the screen shows the contents of the current tab, which can be&#x20;

* "[Runbooks](../../runbooks/)" showing available runbooks for devices.
* Raw [data sources](../#data-sources), like AzureAD, Sign in logs etc. displayed as JSON. Only available for RealmJoin administrators.

##



