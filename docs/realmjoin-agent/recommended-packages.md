---
type: RealmJoin Agent
description: >-
  Packages we recommend deploying from the Package Store alongside the RealmJoin
  Agent to get the most out of it.
---

# Recommended Packages

When you roll out the RealmJoin Agent, we recommend deploying the following packages from the **Package Store** as well. Together they provide the agent itself, the shared helper functions our packages rely on, additional telemetry, and a better end-user experience.

{% hint style="info" %}
Assign the **RealmJoin Agent (Device)** to **devices**. The additional packages (Core Choco Extension, Telemetry, and Promote Tray Icon) should be assigned to **users**.
{% endhint %}

## RealmJoin Agent (Device)

[Package Store: RealmJoin Agent (Device)](https://portal.realmjoin.com/packagestore/49465/overview) — `generic-realmjoin-agent-special-esp-device-phase`

The RealmJoin Agent is the core client component running on your Windows devices. It enables features such as the RealmJoin ESP, application and configuration deployment, LAPS, notifications, and telemetry.

For the full, supported deployment procedure — including the required Intune configuration and Enrollment Status Page settings — follow the dedicated guide:

<table data-view="cards"><thead><tr><th></th><th data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td>Deploying the Agent</td><td><a href="installation.md">installation.md</a></td></tr></tbody></table>

## RealmJoin Core Choco Extension

[Package Store: RealmJoin Core Choco Extension](https://portal.realmjoin.com/packagestore/59828/overview) — `realmjoin-core.extension`

Required helper for all RealmJoin package installations outside of Intune. It provides the shared PowerShell helper functions (cmdlets) that RealmJoin packages rely on during installation and uninstallation.

{% hint style="warning" %}
Please ensure this package is always up-to-date. We strongly recommend enabling **Automation** for the **Main** channel with a short delay (this requires a managed subscription).

The package should be assigned **mandatory to all users**, with **auto-upgrade enabled**.
{% endhint %}

## RealmJoin Telemetry Package

[Package Store: RealmJoin Telemetry Package](https://portal.realmjoin.com/packagestore/58078/overview) — `generic-realmjoin-publishstate-computersystem-information`

This package collects additional telemetry information from clients:

* Computer System Information (Vendor, Model, BIOS)
* Office ClickToRun Settings (Channel, Excluded Apps, ...)
* Enhanced Machine Information (CPU, Memory, Diskdrives, MACs, OEM LicenseKey, Secure Boot certificate ...)
* Windows Update SafeGuardHolds
* Windows Login (LastLoggedOnProvider)
* Device certificates (with details like Subject, Thumbprint, Issuer, Validity etc.)
* RealmJoin BIOS Management report (with BIOS password and settings status)

## RealmJoin Promote Tray Icon

[Package Store: RealmJoin Promote Tray Icon](https://portal.realmjoin.com/packagestore/37448/overview) — `generic-realmjoin-promote-tray-icon`

Sets the RealmJoin tray icon to "always show" in the Windows notification area instead of being hidden in the overflow menu. This makes the [RealmJoin Tray](client-menu/realmjoin-tray.md) and [Self Service Portal](client-menu/self-service-portal.md) readily accessible to end users.
