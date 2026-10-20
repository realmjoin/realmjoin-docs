---
type: User, Group & Device Management
description: >-
  Show Microsoft Defender for Endpoint onboarding, exposure level, risk score,
  alerts, vulnerabilities and recommendations on RealmJoin device pages.
---

# Defender for Endpoint Integration

With the optional **Security features** enabled, RealmJoin Portal queries the Microsoft Defender for Endpoint (MDE) API for a device's Defender record and its alerts, vulnerabilities, security recommendations, logged-on users and installed software. It shows them on the [device details](user-list/device-details.md) page next to the device's Intune, Entra ID, Autopilot and RealmJoin Client data.

{% hint style="info" %}
The integration is read-only and does not replace the Microsoft Defender portal. RealmJoin changes nothing in Defender: you investigate and resolve alerts and remediate recommendations in Microsoft Defender, which the device page links to.
{% endhint %}

## Prerequisites

* **Microsoft Defender for Endpoint licenses** for the devices you want to see.
* **Devices onboarded** to Defender for Endpoint. Devices that are not onboarded show no Defender data.
* The **Security features** activated for your organization (see below). They are **not** part of the default RealmJoin configuration.

{% hint style="info" %}
Exposure level, vulnerabilities and security recommendations come from Microsoft Defender Vulnerability Management. If your Defender license does not include it, these values stay empty.
{% endhint %}

## Activate the Security features

The Security features use their own app registration, **RealmJoin Portal - Security Features**, which needs read access to the Defender for Endpoint API (`WindowsDefenderATP`). See [Portal Required Permissions](../deployment/required-permissions.md#realmjoin-portal-security-features) for the full list.

Granting it requires an administrator who can give tenant-wide admin consent. Use one of these ways:

* **In the Portal:** Go to **Organization ▸ Features**. In the **Security features** card, select **Activate** and complete the admin consent in Microsoft Entra ID.
* **With PowerShell:** Add the `SecurityFeatures` feature with the RealmJoin PowerShell module, see [Advanced Setup](../deployment/onboarding-realmjoin-portal/advanced-setup.md#available-features):

  ```powershell
  Update-RJTenant -AddFeatures @('SecurityFeatures') 6>&1
  ```

Once active, the **Security features** card lists the granted MDE permissions and offers **Reactivate** to grant them again. The [organization details](organization-details.md) page shows **Security Features** as _Active_.

## How devices are matched

RealmJoin looks up the Defender device record by the device's **Entra ID device ID**. If Defender has no record with that ID, it falls back to a record whose computer name matches the device's display name, preferring the most recently seen one.

Defender data is cached for up to five minutes, so a change in Microsoft Defender can take a few minutes to show in RealmJoin.

## What the device page shows

The following elements appear on a device's **Overview** tab. Sections without data are hidden, and each one is only shown to roles that have the matching [permission](#permissions).

### Status icon

With the Security features active, the device header shows the **Defender MDE enabled** shield. It is blue when the device is onboarded to Defender for Endpoint and red otherwise.

{% hint style="info" %}
The **A/V up to date** shield next to it is not part of this integration. It is reported by the [RealmJoin Client](../realmjoin-agent/realmjoin-client/) for all antivirus products on a Windows device.
{% endhint %}

### Endpoint Security Information

A summary of the device's Defender record:

| Field              | Meaning                                                                                                                                                                 |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Onboarding**     | Defender onboarding state, for example _Onboarded_, _CanBeOnboarded_ or _Unsupported_. Anything other than _Onboarded_ is highlighted.                                  |
| **Health Status**  | Sensor health, for example _Active_, _Inactive_, _ImpairedCommunication_ or _NoSensorData_. Anything other than _Active_ is highlighted.                                |
| **Exposure Level** | How exposed the device is to threats, based on its vulnerabilities and misconfigurations: _None_, _Low_, _Medium_ or _High_.                                             |
| **Risk Score**     | The device's risk based on active alerts: _None_, _Informational_, _Low_, _Medium_ or _High_.                                                                            |
| **Agent Version**  | Version of the Defender for Endpoint sensor.                                                                                                                            |
| **RBAC Group**     | The Defender device group the device belongs to, or _Unassigned_.                                                                                                       |
| **First Seen**     | When Defender first saw the device.                                                                                                                                     |
| **Last Seen**      | When Defender last received data from the device.                                                                                                                       |

_Low_ and lower values are shown in blue, _Medium_ in yellow and _High_ in red. See Microsoft's [exposure score and risk score](https://learn.microsoft.com/en-us/defender-endpoint/machine-scores) documentation for how Defender calculates them.

If Defender for Endpoint does not answer in time, the section shows a notice instead. Reload the page later to try again.

### Security Alerts

The Defender alerts for the device, most severe and newest first. Each alert shows its title, severity, classification (for example _True positive_ or _False positive_), whether it is assigned or resolved, when it was created and last updated or resolved, its description and category, and the evidence Defender collected: files, processes (with process and parent process IDs), URLs, accounts and registry values.

### Security Vulnerabilities

The vulnerabilities (CVEs) Defender found on the device, sorted by severity and then by whether a public or verified exploit exists. Each entry shows its severity, the _Public_ and _Verified_ exploit flags, when the CVE was published and updated, its description, links to known exploits and a link to the official CVE article.

### Security Recommendations

Defender's security recommendations for the device with their status. Recommendations to update software that updates itself (Microsoft Edge, Google Chrome, Microsoft Office and Visual Studio Code) are marked _Automatic_.

{% hint style="info" %}
Alerts, vulnerabilities and recommendations load in the background after the page opens, because Defender can take several seconds to answer. A **Security** placeholder is shown while they load.
{% endhint %}

### Link to Microsoft Defender

Under **External Links**, **Security Center** opens the device in the Microsoft Defender portal (`security.microsoft.com`).

### MDE Data tab

The **MDE Data** tab shows the raw Defender device record as JSON, together with the alerts, recommendations, logged-on users, vulnerabilities and software Defender reports for the device. Like the other [data source](user-group-device-management.md#data-sources) tabs, it is only shown when _Show advanced info_ is enabled in [Settings](../administration-and-settings/general.md).

## Defender Scan

The **Defender Scan** button on the device page is **not** part of this integration. It asks **Intune** to run a Microsoft Defender Antivirus quick scan on the device, so it works without the Security features but requires the device to be managed by Intune. It needs the `CanScanDevice` permission.

## Permissions

Which roles see what is controlled by these [permissions](../administration-and-settings/permission/custom-roles/available-permissions.md#device-security):

| Permission                                | Shows                                                    | Pre-defined roles                                |
| ----------------------------------------- | -------------------------------------------------------- | ------------------------------------------------ |
| `CanSeeDeviceExtendedSecurityInformation` | Endpoint Security Information                            | Admin, Advanced Supporter, Supporter, Auditor    |
| `CanSeeDeviceSecurityAlerts`              | Security Alerts                                          | Admin, Advanced Supporter, Supporter, Auditor    |
| `CanSeeDeviceSecurityVulnerabilities`     | Security Vulnerabilities                                 | Admin, Advanced Supporter, Supporter, Auditor    |
| `CanSeeDeviceSecurityRecommendations`     | Security Recommendations                                 | Admin, Advanced Supporter, Supporter, Auditor    |
| `CanSeeDeviceExternalLinks`               | **Security Center** link (and the Intune and Entra links) | Admin, Advanced Supporter, Auditor            |
| `CanSeeDeviceJsonAtp`                     | MDE Data tab (with _Show advanced info_)                 | Admin, Advanced Supporter, Auditor               |
| `CanScanDevice`                           | Defender Scan button (Intune)                            | Admin, Advanced Supporter, Supporter             |

Entra Global Administrators have all of them. See [Pre-defined Roles](../administration-and-settings/permission/pre-defined-roles.md) and [Custom Roles](../administration-and-settings/permission/custom-roles/) for assigning them.
