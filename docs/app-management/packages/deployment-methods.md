---
type: Application Management
description: >-
  Comparison of the two ways to deploy Windows packages with RealmJoin — native
  Intune deployment (intunewin + Intune Management Extension) versus RealmJoin
  Agent deployment — and the additional capabilities the RealmJoin Agent adds.
---

# Deployment Methods: RealmJoin Agent vs. Intune

Nearly every package in the [Package Store](package-store/) can be deployed to your Windows devices in one of two ways. You choose the method per package when you [subscribe](package-store/package-store-details.md#subscription) to it, and you manage assignments the same way afterwards through [managed groups](package-deployment.md).

* **Intune deployment** – the package is pushed to your tenant as an `intunewin` app and delivered by Microsoft Intune and the Intune Management Extension, surfacing to users in the Company Portal.
* **RealmJoin deployment** – the package is installed by the [RealmJoin Agent](../../realmjoin-agent/realmjoin-client/) running on the device, surfacing to users in the [RealmJoin Tray](../../realmjoin-agent/client-menu/realmjoin-tray.md) and [Self Service Portal](../../realmjoin-agent/client-menu/self-service-portal.md).

{% hint style="info" %}
We recommend RealmJoin deployment. It supports everything the Intune method does and adds the capabilities described on this page. If you have decided to standardise on Intune-managed packages instead, see the [Migration Guide](migration-guide-realmjoin-to-intune-managed-packages.md).
{% endhint %}

## How each method delivers a package

{% tabs %}
{% tab title="Intune deployment" %}
The `intunewin` version of the package is pushed directly into your tenant. It contains all binaries plus a PowerShell-based deploy kit. From there it can be managed either from the RealmJoin Portal or in Intune directly.

* **Delivery:** Microsoft Intune + Intune Management Extension.
* **Self-service surface:** Company Portal → Apps.
* **Payload:** binaries bundled inside the `intunewin` package and staged to the tenant.
{% endtab %}

{% tab title="RealmJoin deployment" %}
The RealmJoin Agent on the device executes all installation code and commands locally using its package engine ([classic Chocolatey or the Native Choco Runtime](../../realmjoin-agent/realmjoin-client/native-choco-runtime.md)) together with PowerShell. Binaries are downloaded at installation time.

* **Delivery:** the RealmJoin Agent (`realmjoin.exe` / `realmjoinservice.exe`), syncing configuration roughly every 30 minutes.
* **Self-service surface:** RealmJoin Tray menu and Self Service Portal, organised into categories.
* **Payload:** binaries downloaded on demand during installation.
{% endtab %}
{% endtabs %}

## Feature comparison

Both methods support the fundamentals: **Required** (mandatory) and **Available** (user-initiated) assignments, managed group creation, staged **Preview / Main** channel automation with deferral and *Deploy at Night*, and version/update tracking in [Package Management](package-management.md). The table below focuses on where the two methods differ.

<table><thead><tr><th width="300">Capability</th><th width="180">Intune deployment</th><th>RealmJoin deployment</th></tr></thead><tbody>
<tr><td>Required &#x26; Available assignments</td><td>Yes</td><td>Yes</td></tr>
<tr><td>Managed groups &#x26; Preview/Main automation</td><td>Yes</td><td>Yes</td></tr>
<tr><td>Auto-upgrade to newer versions</td><td>Required packages only</td><td><strong>Required and Available packages</strong></td></tr>
<tr><td>Package dependencies (<em>Depends on</em>)</td><td>—</td><td><strong>Yes</strong> — prerequisites installed automatically first</td></tr>
<tr><td>Defined install sequence (<em>Order</em>)</td><td>—</td><td><strong>Yes</strong></td></tr>
<tr><td>Compliance-gated install (<em>Require compliance</em>)</td><td>—</td><td><strong>Yes</strong></td></tr>
<tr><td>Self-service reinstall / repair (<em>Allow reinstallation</em>)</td><td>—</td><td><strong>Yes</strong></td></tr>
<tr><td>Background install on config change</td><td>—</td><td><strong>Yes</strong></td></tr>
<tr><td>Per-package device targeting (VDI, hybrid-joined, private)</td><td>—</td><td><strong>Yes</strong> — built into each package's settings</td></tr>
<tr><td>User deferral control (<em>Deployment rate</em>: Slow/Fast/Tomorrow)</td><td>—</td><td><strong>Yes</strong></td></tr>
<tr><td>Install phase &#x26; audience control (<em>Main app / User part restrictions</em>)</td><td>—</td><td><strong>Yes</strong> — Logon/Manual/Initial/Normal, primary/secondary user</td></tr>
<tr><td>Onboard existing unmanaged installs (<em>Update group</em>)</td><td>—</td><td><strong>Yes</strong></td></tr>
<tr><td>Configuration / craft packages with multi-subscribe suffix</td><td>—</td><td><strong>Yes</strong></td></tr>
<tr><td>Own Enrollment Status Page during provisioning</td><td>Windows/Intune ESP</td><td><strong>Additional</strong> <a href="../../realmjoin-agent/realmjoin-client/realmjoin-esp.md">RealmJoin ESP</a></td></tr>
</tbody></table>

{% hint style="info" %}
The advanced per-package options above are the [**Expert Settings**](package-settings.md#expert-settings) of a package. RealmJoin App Deployment is required to use them, and the full feature set requires the RealmJoin Agent.
{% endhint %}

## What you gain with RealmJoin deployment

### Dependency resolution and install ordering

RealmJoin can express relationships between packages. With **Depends on**, prerequisite packages (for example a Visual C++ or .NET runtime) are installed automatically before the app that needs them, and with **Order** you control the exact sequence of the initial rollout. This lets you model real application stacks instead of assigning every component independently and hoping the timing works out.

### Auto-upgrade for Available apps, not just mandatory ones

When a newer version enters the channel, the RealmJoin Agent upgrades both **Required** *and* **Available** packages already installed on a device. This keeps self-service software patched to the same level as mandatory software, closing a common gap where optional apps drift out of date.

### Compliance-gated and condition-aware installation

Packages can be held until the RealmJoin Security Assessment confirms the device is [compliant](../../realmjoin-agent/realmjoin-client/README.md#compliance-checks) (encryption, patch level, firewall, anti-virus, …). You can also scope a package **per device type directly in its settings** — only on VDI (Windows 365 / Azure Virtual Desktop), only on hybrid-joined devices, or excluded from private devices — without building separate assignment constructs for each case.

### Fine-grained control over *when* and *for whom*

Each package can define its **install phase** — after logon, only when the user starts it manually, only during initial provisioning, or during normal usage — and whether it runs for the primary user, secondary users, or both. Combined with the **Deployment rate** (letting users defer for a defined number of days before installation enforces itself), you get precise control over the end-user experience.

### Self-service repair and silent remediation

**Allow reinstallation** lets users re-run a package from the tray at any time to fix a broken installation — ideal for self-healing packages such as time-sync or configuration fixes. **Allow background installation** applies configuration changes automatically on the next sync, without interrupting the user.

### Onboarding of existing installations

The [**Update group**](package-deployment.md#update) dynamically discovers copies of a software title that were installed outside of management and pulls those devices into the managed deployment. Newer versions — including security patches — then reach those machines too, so unmanaged installs stop being blind spots.

### Configurations, not just applications

Beyond application installers, RealmJoin deployment handles **craft/configuration packages** — such as printer or network-drive mappings — and lets you subscribe the same craft package multiple times using a [suffix](package-store/package-store-details.md#craft-packages-suffix-configuration-or-notation), so a user can receive several distinct configurations of the same package.

### A polished end-user and provisioning experience

The Agent provides the [RealmJoin ESP](../../realmjoin-agent/realmjoin-client/realmjoin-esp.md), which holds the Windows desktop until mandatory installs and configurations have completed during provisioning, and [app notifications](../../realmjoin-agent/realmjoin-client/deploy-apps.md) with a customisable hero image and interactive snooze/defer options. Available software is presented in the RealmJoin Tray and Self Service Portal, grouped into the categories you define.

### A modern, in-process package engine

The optional [Native Choco Runtime](../../realmjoin-agent/realmjoin-client/native-choco-runtime.md) runs installations inside the RealmJoin service — no dependency on the ageing bundled Chocolatey 0.10.3 binary — while remaining a drop-in replacement for your existing packages, with isolated per-package logging for easier troubleshooting.

## Choosing a method

<table data-view="cards"><thead><tr><th></th><th></th><th data-card-target data-type="content-ref"></th></tr></thead><tbody>
<tr><td><strong>Subscribe &#x26; assign</strong></td><td>How to subscribe a package for either method and assign it to managed groups.</td><td><a href="package-store/package-store-details.md">package-store-details.md</a></td></tr>
<tr><td><strong>Expert Settings</strong></td><td>Full reference for the per-package options compared above.</td><td><a href="package-settings.md">package-settings.md</a></td></tr>
<tr><td><strong>Migrate to Intune</strong></td><td>If you have decided to standardise on Intune-managed packages.</td><td><a href="migration-guide-realmjoin-to-intune-managed-packages.md">migration-guide-realmjoin-to-intune-managed-packages.md</a></td></tr>
</tbody></table>
