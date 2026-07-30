---
type: RealmJoin Agent
description: >-
  What the RealmJoin Agent reports about a device by default, what the RealmJoin
  Telemetry Package adds on top, and where that information appears in the
  RealmJoin Portal.
---

# Advanced Telemetry

The RealmJoin Agent regularly reports a **device state** to RealmJoin — a snapshot of what the device looks like right now. That state is what feeds "Last Seen", the hardware and software information on a device, the compliance signals and the device exports in the Portal.

**Advanced Telemetry** extends that baseline with additional information that Windows does not expose to Intune, or only exposes with considerable effort: real hardware details, Microsoft 365 Apps configuration, Windows Update safeguard holds, logon method, BIOS management status and more. It is delivered through the [RealmJoin Telemetry Package](../recommended-packages.md#realmjoin-telemetry-package) from the Package Store.

{% hint style="info" %}
Advanced Custom Telemetry is part of **RealmJoin Enterprise**. See [Licensing](../../legal/licensing/) for the full feature comparison.
{% endhint %}

## What is collected by default

As soon as the RealmJoin Agent is installed, it reports the following without any additional package:

<table><thead><tr><th width="230">Area</th><th>Examples</th></tr></thead><tbody><tr><td>Identity &#x26; operating system</td><td>Machine and host name, joined domain, Windows version and display version, language and culture, installed RealmJoin Agent version</td></tr><tr><td>Enrollment</td><td>Entra ID tenant, device and user IDs, Workplace Join data, Intune account and device ID</td></tr><tr><td>Security</td><td>Firewall profile states, installed antivirus products, BitLocker volume states, TPM information, Defender for Endpoint onboarding state</td></tr><tr><td>Updates</td><td>Windows Update state</td></tr><tr><td>Network</td><td>Resolved RealmJoin CDN endpoints, proxy configuration, metered-connection flag</td></tr><tr><td>Content delivery</td><td>Delivery Optimization group, BranchCache mode, cache size and hit counters</td></tr><tr><td>Software</td><td>State of all RealmJoin-managed packages plus a full software inventory (installed programs and Microsoft Store apps)</td></tr><tr><td>LAPS</td><td>Local admin accounts managed by RealmJoin and their password status — see <a href="local-admin-password-solution-laps/">Local Admin Password Solution (LAPS)</a></td></tr><tr><td>Integrations</td><td>AnyDesk ID, notification message states</td></tr><tr><td>Session</td><td>Deployment phase, logged-on user, logon time, whether the user is a local administrator</td></tr></tbody></table>

## What Advanced Telemetry adds

The [RealmJoin Telemetry Package](../recommended-packages.md#realmjoin-telemetry-package) (`generic-realmjoin-publishstate-computersystem-information`) adds the following information to the device state:

<table><thead><tr><th width="290">Information</th><th>Values</th></tr></thead><tbody><tr><td>Computer system information</td><td>Manufacturer, model, serial number, BIOS version</td></tr><tr><td>Enhanced machine information</td><td>CPU name and speed, installed memory, disk drives, MAC addresses, OEM license key, last boot time, Secure Boot / UEFI 2023 CA certificate state</td></tr><tr><td>Microsoft 365 Apps (Click-to-Run)</td><td>Update channel, reported version, platform, excluded apps</td></tr><tr><td>Windows Update safeguard holds</td><td>Active safeguard holds blocking feature updates, including their severity</td></tr><tr><td>Windows logon</td><td>Last used logon provider — reveals whether users sign in with Windows Hello for Business (fingerprint / facial recognition) or with a password</td></tr><tr><td>Device certificates</td><td>Subject, thumbprint, issuer and validity of the certificates on the device</td></tr><tr><td>BIOS management</td><td>RealmJoin BIOS Management report: BIOS version, BIOS password status, BIOS settings status</td></tr></tbody></table>

{% hint style="info" %}
Assign the Telemetry Package to **users**, not devices. See [Recommended Packages](../recommended-packages.md) for the packages we recommend alongside the Agent.
{% endhint %}

## Where the data appears in the Portal

Once the Telemetry Package is deployed, the additional information shows up throughout the Portal:

* **Device details** — manufacturer, model and serial number, CPU and memory, last boot time, Microsoft 365 Apps update channel, the **UEFI 2023 CA** badge, and an alert when a device has critical **Windows Update safeguard holds**.
* **Device list** — the Manufacturer, Model and Serial Number columns, and "Last Seen" enriched with Agent telemetry where available.
* **Advanced Search** — filter your device list on the reported values, see [Advanced Search](../../analyze-and-export/advanced-search/).
* **Exports** — the device export includes serial number, CPU name and speed, memory and Office channel columns, see [Data Export](../../analyze-and-export/data-export.md).

## Data protection and retention

The device state is transmitted to the RealmJoin backend together with the regular configuration request and is stored in the Azure region West Europe. It is archived for **90 days**, after which retention policies remove the data.

Custom telemetry is visible to everyone who is permitted to view the device in the Portal. For details on data processing, storage and sub-processors, see [Security & Privacy](../../security-and-privacy/security-and-privacy.md).
