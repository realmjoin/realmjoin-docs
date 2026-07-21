---
type: User, Group & Device Management
description: >-
  RealmJoin device details show a single device's logged-on user, installed apps,
  and security recommendations with status.
---

# Device Details

## Overview

This page provides information about the device you’ve selected from the [Device List](./).

<figure><img src="../../.gitbook/assets/image (172).png" alt=""><figcaption><p>Device Details</p></figcaption></figure>

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

<img src="../../.gitbook/assets/image (242).png" alt="" data-size="original">Endpoint Management active

![](<../../.gitbook/assets/image (271).png>)Disk Encryption enabled

![](<../../.gitbook/assets/image (211).png>)Defender ATP enabled

![](<../../.gitbook/assets/image (189).png>)A/V up to date

![](<../../.gitbook/assets/image (244).png>)Compliant device

![](<../../.gitbook/assets/image (175).png>) When the object was created

![](<../../.gitbook/assets/image (254).png>) Last seen activity / Last contact

Other bits of information are presented as tags:

* AzureAD - This device is Entra ID Joined&#x20;
* TPM2 - TPM2 is present and enabled
* Autopilot - This device is managed via Autopilot
* Company - Company Owned (not Personal)
* Personal - Personal, not Company Owned

### Local Admin Management (LAPS)

RealmJoin Portal can surface a device's local administrator credentials in two independent ways, and both can appear on the same device details page:

* **RealmJoin LAPS (agent-based)** – RealmJoin's own Local Admin Password Solution, delivered by the [RealmJoin Client](../../realmjoin-agent/realmjoin-client/) and stored in your own Azure Key Vault.
* **Intune LAPS integration** – retrieval of credentials that Microsoft's native **Windows LAPS** has backed up to Microsoft Entra ID, read directly from Microsoft Graph. No RealmJoin Client required.

The two solutions are complementary. The table below summarizes the differences:

|                             | RealmJoin LAPS (agent-based)                             | Intune LAPS integration                             |
| --------------------------- | ------------------------------------------------------- | --------------------------------------------------- |
| Credentials come from       | RealmJoin Client, stored in **your own** Azure Key Vault | **Windows LAPS**, backed up to Microsoft Entra ID   |
| Requires the RealmJoin Client | Yes                                                     | No                                                  |
| Account types               | **Emergency**, **Support** (on-demand) and **Privileged** | Single managed local admin account per device       |
| Actions                     | Reveal password, request on-demand Support Account, renew | Reveal / copy password, rotate password             |
| Platforms                   | Windows (and macOS)                                     | Windows and macOS                                   |

{% hint style="info" %}
RealmJoin LAPS is the more capable option — multiple account types, on-demand support accounts, forced rotations and your own Key Vault as the store. The **Intune LAPS integration** is aimed at tenants that already rely on Microsoft's native Windows LAPS and simply want to retrieve those credentials without leaving the Portal.
{% endhint %}

#### RealmJoin LAPS (agent-based)

When combined with the [RealmJoin Client](../../realmjoin-agent/realmjoin-client/), RealmJoin Portal can help with support tasks on windows clients that need local admin permissions by offering on-demand support accounts on clients. In many cases this removes the need to grant local admin permissions to the primary user of the device just to solve a one-time need.

![LAPS management](<../../.gitbook/assets/image (241).png>)

By default, a local admin emergency account is created on a windows client. This account is useable even if network connectivity to the client fails. This is kind of a last resort.

It is recommended to use a "Support Account". When clicking "**Request**", a job is created/queued and RealmJoin Client will create an on-demand local admin account next time it syncs to the backend. This can take up to 30 minutes or alternatively a "Sync this device" can be triggered on the client to speed up the process. RealmJoin Portal will show state of "Requested" until the account is created and automatically switches to a view similiar to the Emergency Account when ready:

![Support Account](<../../.gitbook/assets/image (61).png>)

Click the dots to reveal the password.

The Support Account will automatically be removed after 12 hours.

See the [LAPS documentation](../../realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/) for more details.

#### Intune LAPS integration

If you manage local administrator passwords with Microsoft's native **Windows LAPS** — deployed through an Intune [account protection policy](https://learn.microsoft.com/intune/device-security/laps/deploy-policy) that backs the credential up to Microsoft Entra ID — RealmJoin Portal can read those credentials for you, so support staff don't have to switch to the Intune or Entra admin center.

Unlike RealmJoin LAPS, this integration does **not** require the RealmJoin Client. The Portal simply reads whatever Windows LAPS has already backed up, via Microsoft Graph.

When the prerequisites below are met, an **Intune Local Admin Management** section appears on the device details page. It lists:

* **Username** – the local admin account name backed up from the device (Windows only; macOS does not report an account name).
* **Last Updated** – when the password was last backed up or rotated.
* **Expires** – when Windows LAPS will next rotate the password (Windows only).
* **Password** – hidden by default. Select the eye icon to reveal it (it is shown briefly, then masked again automatically) or click the masked value to copy it straight to your clipboard.

If your role allows it, a **Rotate Password** action is available. This asks Intune to generate and back up a fresh password; it is a request that Intune applies the next time the device processes it, not an instant change.

{% hint style="info" %}
Retrieving or rotating an Intune LAPS password is audited — both within RealmJoin and in the Microsoft Entra / Intune audit logs.
{% endhint %}

{% hint style="warning" %}
Credentials can only be shown when Windows LAPS backs the account up to **Microsoft Entra ID**. Passwords for accounts backed up to on-premises Active Directory cannot be displayed — the same limitation applies in the Intune admin center.
{% endhint %}

**Prerequisites**

* The device is **Entra ID joined** and **enrolled in Intune**.
* **Windows LAPS is configured in Intune** and the credential is backed up to Microsoft Entra ID. See Microsoft's [Windows LAPS support in Intune](https://learn.microsoft.com/intune/device-security/laps/overview) for setup. macOS devices are supported when enrolled via Automated Device Enrollment (ADE) with a LAPS-managed local account.
* The **required Microsoft Graph permissions** are granted to the RealmJoin app registration. An administrator can grant these under **Organization ▸ Features**, in the **Optional: Intune LAPS** card:
  * `DeviceLocalCredential.Read.All` – read Windows LAPS credentials.
  * `DeviceManagementManagedDevices.PrivilegedOperations.All` – read macOS LAPS credentials **and** rotate passwords (this scope is also required to rotate a Windows password).

If a device isn't Entra/Intune managed, or the Graph permissions aren't consented, the Intune Local Admin Management section simply doesn't appear.

**Who can view and rotate**

* **View** the Intune LAPS password: Tenant Admin, Global Admin, Tenant Supporter, Tenant Advanced Supporter and Tenant Auditor roles (as well as Entra Global Administrators).
* **Rotate** the password: the same roles **except** Tenant Auditor — auditors can read credentials but not rotate them.

**Self-service for end users**

Users can be allowed to view (and optionally rotate) the Intune LAPS credential of a device they own — where they are the primary user or registered owner — using the `Allow.SelfLAPSIntune` user or group setting. This is the Intune counterpart to the agent-based [`Allow.SelfLAPS`](../../realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/#enable-self-service) setting.

The value can be:

* a boolean `true` / `false` (an explicit `false` always wins),
* a platform string `"windows"` or `"macos"` to grant access for that platform only, or
* an object with `CanReadPassword` / `CanRotatePassword` (optionally platform-specific via `CanReadPasswordWindows`, `CanRotatePasswordWindows`, `CanReadPasswordMacOS`, `CanRotatePasswordMacOS`).

```json
{
  "CanReadPassword": true,
  "CanRotatePassword": false
}
```

### Recovery Keys

For encrypted devices, RealmJoin Portal can work with the disk-encryption recovery key — **BitLocker** on Windows and **FileVault** on macOS.

Starting with **Portal v2026.29**, you can **rotate** a device's recovery key directly from the RealmJoin Portal. Rotating replaces the existing recovery key with a new one, which takes effect after the device next syncs.

{% hint style="info" %}
Recovery keys can also be retrieved via the [Show BitLocker Recovery Key](../../automation/runbooks/runbook-references/device/security/show-bitlocker-recovery-key.md) and [Show FileVault Recovery Key](../../automation/runbooks/runbook-references/device/security/show-filevault-recovery-key.md) runbooks.
{% endhint %}

## Warranty

Use the **Warranty** tab to display information like remaining vendor warranty time for **supported vendors/devices.**

{% hint style="success" %}
Currently supported vendors: Apple, Dell, Fujitsu, HP, Huawei, Lenovo and Microsoft
{% endhint %}

<figure><img src="../../.gitbook/assets/image (133).png" alt=""><figcaption><p>Warranty Information</p></figcaption></figure>

{% hint style="info" %}
We rely on the information provided by the vendors through their APIs. We do not guarantee the accuracy of this information.
{% endhint %}

Depending on the API used, a captcha might be displayed before requesting/displaying warranty information.

## Actions

You can use the button **Intune Sync** to trigger a remote sync of Intune Policies.

Use the **Defender Scan** button to trigger a (quick) scan of Windows Defender on a managed client.

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
