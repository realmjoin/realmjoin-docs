# Device List

This view offers you a simple way to search or review devices in your environment.

<figure><img src="../../.gitbook/assets/image (30).png" alt=""><figcaption><p>Device List</p></figcaption></figure>

### Object Types

The category "devices" includes:

* AzureAD joined clients, like modern workplace clients
* AzureAD registered devices, like user-owned phones and tablets
* Other devices, like printers used by MS Universal Printing or SurfaceHubs

### Search and Sort

The device list allows you to search for devices in your organization by

* Name
* AzureAD Object/Device ID
* Serial Number
* Manufacturer
* Model
* Operating System

The search support realtime / as-you-type incremental search. The search results will update instantly as you type.

You can sort the current search result or the full list by any of the fields, by clicking on the fields name.

### Filters

<figure><img src="../../.gitbook/assets/image (14).png" alt=""><figcaption><p>Device List Filters</p></figcaption></figure>

#### Only Enabled

If toggled **on** (default) devices that have been disabled / blocked from sign in in AzureAD will not be shown.

Switch **off** to see all devices including devices that are not enabled.

#### Operating System / Device Type

Use this filter to select devices based on their operating system or deployment method.&#x20;

* **Any** - Show all devices
* **Win** (Default) - Show only Windows based devices
* **Mac**  - Show only MacOS based devices
* **CloudPC** - Show only Windows365 devices
* **Mobiles** - Show iOS and Android devices
* **S-Hub** - Show Surface Hub devices
* **Printer** - Show Printers (from Universal Printing)
* **Other** - Show devices not matched by other filters

#### (Non-) Compliant Devices

For managed devices, you can choose to limit the results according to their [compliance state](https://docs.microsoft.com/en-us/mem/intune/protect/device-compliance-get-started) in Intune.

* **Any** - Show all devices
* **Compliant** - Show only devices reported as compliant by Intune
* **Non-Compliant** - Show only devices reported as not currently compliant by Intune

### Drill down to a Device

Clicking the name of a device will lead you to this [device's details page](device-details.md).
