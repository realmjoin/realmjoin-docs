---
description: >-
  Packages we recommend deploying from the Package Store alongside the RealmJoin
  Agent to get the most out of it.
---

# Recommended Packages

When you roll out the RealmJoin Agent, we recommend deploying the following packages from the **Package Store** as well. Together they provide the agent itself, the shared helper functions our packages rely on, additional telemetry, and a better end-user experience.

{% hint style="info" %}
All packages listed below can be found in the **Package Store** by searching for their package identifier (shown in each section). Assign them to **devices** just like the RealmJoin Agent.
{% endhint %}

## RealmJoin Agent (Device)

`generic-realmjoin-agent-special-esp-device-phase`

The RealmJoin Agent is the core client component running on your Windows devices. It enables features such as the RealmJoin ESP, application and configuration deployment, LAPS, notifications, and telemetry.

For the full, supported deployment procedure — including the required Intune configuration and Enrollment Status Page settings — follow the dedicated guide:

<table data-view="cards"><thead><tr><th></th><th data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td>Deploying the Agent</td><td><a href="installation.md">installation.md</a></td></tr></tbody></table>

## RealmJoin Core Choco Extension

`realmjoin-core.extension`

The Core Choco Extension is a foundational Chocolatey package that provides the shared PowerShell helper functions (cmdlets) used by RealmJoin packages during installation and uninstallation. It extends Chocolatey with helpers for software deployment, registry and INI handling, shortcuts, scheduled tasks, firewall rules, error handling, and more.

{% hint style="warning" %}
Because most RealmJoin packages depend on these helpers, the Core Choco Extension should be deployed to **all clients** so that packages can install and uninstall reliably.
{% endhint %}

## RealmJoin Telemetry Package

`generic-realmjoin-publishstate-computersystem-information`

This package publishes computer system information (such as hardware and operating system details) as state to the RealmJoin Portal. It enriches the data available for reporting and inventory, powering the advanced telemetry shown in the portal.

## RealmJoin Promote Tray Icon

`generic-realmjoin-promote-tray-icon`

This package promotes the RealmJoin tray icon so that it is always visible in the Windows notification area instead of being hidden in the overflow menu. This makes the [RealmJoin Tray](client-menu/realmjoin-tray.md) and [Self Service Portal](client-menu/self-service-portal.md) readily accessible to end users.
