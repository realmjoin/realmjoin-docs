# Software Reporting

The software reporting feature in the portal provides comprehensive insights into the applications installed across all devices within the company. This feature aggregates data from both Microsoft Intune and RealmJoin, leveraging a small agent running on user devices to collect and report detailed information.

To access the software reporting feature, navigate to the portal and select the "Software Reporting" section. Here, you will find a comprehensive list of all applications installed on company devices, along with their deployment methods and versions. This information is crucial for maintaining an up-to-date inventory of software and ensuring compliance with company policies.

## Data Sources

1. **RealmJoin**: Utilizes a small agent on user devices to gather information on applications deployed through RealmJoin.
2. **Microsoft Intune**: Collects data on applications deployed via Intune.

## Details

The software reporting includes the following key details for each application found on company devices:

* **Application Name**: The name of the application installed.
* **Deployment Method**: The method used to deploy the application. This can include:
  * **Choco**: Applications deployed via RealmJoin using Chocolatey.
  * **Win32**: Applications deployed via Microsoft Intune.
  * **Appx**: Applications deployed via the Windows Store.
* **Version Installed**: The specific version of the application that is installed on the device.



<figure><img src="../.gitbook/assets/image (38).png" alt=""><figcaption><p>Software Report filtered on "Adobe Reader"</p></figcaption></figure>

For each entry, all versions and all devices / users having the specific version installed can be displayed. The results are a filtered devices/user list, and can be exported for further usage (see Data Export).&#x20;

<figure><img src="../.gitbook/assets/image (39).png" alt=""><figcaption><p>All installed version of "Adobe Reader" in the company inventory</p></figcaption></figure>

<figure><img src="../.gitbook/assets/image (40).png" alt=""><figcaption><p>All devices with the same version of "Adobe Reader" installed. May be exported to be further processed.</p></figcaption></figure>

{% hint style="info" %}
**Special Considerations:**&#x20;

**Applications with Auto-Updaters**: For applications that have an auto-update feature, the version reported as RealmJoin (Choco) reflects only the initially installed version. To obtain the most current version, it is necessary to also check the Win32 entry.
{% endhint %}







