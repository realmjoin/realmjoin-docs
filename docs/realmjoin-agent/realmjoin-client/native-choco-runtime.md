---
description: >-
  The Native Choco Runtime is RealmJoin's own in-process package installation
  engine that replaces the outdated Chocolatey 0.10.3 binary while staying fully
  compatible with existing packages.
---

# Native Choco Runtime

{% hint style="info" %}
The Native Choco Runtime was introduced with **RealmJoin Agent 4.21.6 (Beta)**. While in beta it is **opt-in**: existing clients keep using the classic Chocolatey engine until you explicitly enable the native runtime.
{% endhint %}

## What it is

When the RealmJoin Agent installs software packages outside of Intune (see [package installation](deploy-apps.md#package-installation)), it has traditionally relied on [Chocolatey](https://chocolatey.org/) as the underlying package engine. RealmJoin shipped a pinned, heavily patched build of the open-source Chocolatey CLI — version **0.10.3** — bundled as `choco.exe` under `C:\ProgramData\chocolatey\`.

The **Native Choco Runtime** replaces that bundled Chocolatey binary with RealmJoin's **own, purpose-built implementation** that runs **in-process** inside the RealmJoin service. It _shims_ Chocolatey: it understands the same package format (`.nupkg`) and behaves the same way from a package author's and administrator's point of view, but it no longer depends on the ageing Chocolatey 0.10.3 codebase.

In our deployments, classic Chocolatey is essentially "a vehicle for a ZIP" — RealmJoin only relies on a small slice of what it does. Re-implementing that slice natively removes an outdated third-party dependency and lets us fix issues, tighten security, and integrate installation, logging, and error handling directly.

In other words, packages you already use keep working unchanged — only the engine underneath them changes.

## How it works

* **In-process engine.** Package installs run inside the RealmJoin service instead of shelling out to an external `choco.exe`. The `chocolateyInstall.ps1` of each package is executed in an in-process PowerShell runspace.
* **Isolated storage.** The native runtime installs to its **own** root, `C:\ProgramData\RealmJoin\choco\` (with `lib\`, `extensions\`, and `logs\` subfolders). It never writes to classic Chocolatey's state under `C:\ProgramData\chocolatey\` and never changes the machine-wide `ChocolateyInstall` environment variable. This means the native runtime and a pre-existing classic Chocolatey can **coexist** on the same device.
* **Automatic dependency resolution.** Package dependencies declared in the `.nuspec` (such as the [RealmJoin Core Choco Extension](../recommended-packages.md#realmjoin-core-choco-extension)) are resolved and installed automatically from your configured sources.
* **`choco.exe` shim.** Some package scripts call `choco.exe` directly. To keep those working, the runtime deploys a small shim to `%ProgramFiles%\RealmJoin\choco-shim\choco.exe` that routes such calls back into the in-process engine instead of to classic Chocolatey. The shim is not added to the system `PATH`; it is only made available to package scripts while they run.

## Compatibility

The Native Choco Runtime is designed as a **drop-in replacement**:

* Existing RealmJoin packages (including everything from the [Package Store](../../app-management/packages/package-store/)) install and uninstall the same way.
* Package arguments / params configured in the RealmJoin Portal continue to work.
* The [RealmJoin Core Choco Extension](../recommended-packages.md#realmjoin-core-choco-extension) helper cmdlets used inside package scripts remain available.
* [RealmJoin ESP](realmjoin-esp.md) / Autopilot are supported: on a fresh device with the native runtime enabled, `winchoco` packages are installed natively during enrollment, with their dependencies resolved automatically.

{% hint style="warning" %}
As this runtime is in beta, we recommend validating your most important packages on a pilot ring before rolling it out tenant-wide. Please report any behavioural differences to RealmJoin support so we can address them before general availability.
{% endhint %}

## How to use it

The runtime is selected through a RealmJoin **setting**, so you can control it centrally instead of touching individual clients. RealmJoin settings cascade, which means you can set a **tenant-wide default** and, where needed, **override it for specific groups** (and the objects within them).

{% hint style="info" %}
Setting Key: `Chocolatey.UseNativeRuntime`

Setting Value: `true` / `false`
{% endhint %}

The following settings control the behaviour:

<table><thead><tr><th>Setting</th><th width="120">Default</th><th>Meaning</th></tr></thead><tbody><tr><td><code>Chocolatey.Enabled</code></td><td><code>false</code></td><td>RealmJoin manages Chocolatey-typed packages on the device.</td></tr><tr><td><code>Chocolatey.UseNativeRuntime</code></td><td><code>false</code></td><td>Master switch. When <code>false</code>, installs still go through the classic <code>choco.exe</code>. When <code>true</code>, all <code>winchoco</code> installs go through the in-process native runtime.</td></tr><tr><td><code>Chocolatey.DisableShim</code></td><td><code>false</code></td><td>Only relevant when <code>UseNativeRuntime = true</code>. When <code>true</code>, any package script that calls an external <code>choco.exe</code> fails loudly instead of being routed through the shim — useful to surface scripts that still reach for an external binary.</td></tr></tbody></table>

{% stepper %}
{% step %}
### Enable it for a pilot group first

Open the settings of a RealmJoin **group** that contains a small set of pilot devices and set `Chocolatey.UseNativeRuntime` to `true` there. Because group settings take precedence over the tenant-wide default, only those devices switch to the new engine.
{% endstep %}

{% step %}
### Validate your packages

Let the pilot devices run their normal package assignments and upgrades. Confirm that installations succeed and check the logs if anything looks off (see [Package Installation Issues](../../troubleshooting/package-installation-issues/)).
{% endstep %}

{% step %}
### Roll it out tenant-wide

Once you are confident, set `Chocolatey.UseNativeRuntime` to `true` as the **tenant-wide default** so that all clients use it. Individual groups can still opt out if you need to keep them on the classic engine temporarily.
{% endstep %}
{% endstepper %}

{% hint style="info" %}
Configuration follows the same tenant-setting / group-override model as the other agent settings described under [General settings](../../realmjoin-settings/general.md) (for example the **Client Configuration** and **LAPS Configuration** tenant settings).
{% endhint %}

## What is the default

During the 4.21.6 Beta the Native Choco Runtime is **disabled by default** (`Chocolatey.UseNativeRuntime = false`). Clients continue to use the classic, bundled Chocolatey 0.10.3 engine until an administrator enables the native runtime — either tenant-wide or for a specific group. This lets you adopt the new runtime at your own pace and roll it back just as easily while the feature is in beta.

## Migrating existing devices

The native runtime and classic Chocolatey **coexist** on a device for as long as needed. When you enable the native runtime on a device that already has classic Chocolatey-installed packages:

* Existing RealmJoin-managed packages keep working and are **not** reinstalled just because the runtime changed — their installed state carries over across the switch, so there is no reinstall storm.
* New installs and upgrades go through the native runtime; the classic installation stays on disk, untouched, until it is explicitly removed.

{% hint style="info" %}
Fleet-wide removal of classic Chocolatey is planned as a separate, orchestrated step. Until then, the native runtime is happy to coexist with a leftover classic installation, so there is no hard deadline to clean it up.
{% endhint %}

For an individual device (for example during support or QA), an administrator can move a machine off classic Chocolatey with the shim's `migrate` verb from an **elevated** shell:

{% code overflow="wrap" %}
```powershell
# Preview what would happen, without making changes
& "C:\Program Files\RealmJoin\choco-shim\choco.exe" migrate --dry-run

# Reinstall stateful packages via the native runtime, then remove classic
& "C:\Program Files\RealmJoin\choco-shim\choco.exe" migrate --yes
```
{% endcode %}

{% hint style="warning" %}
`choco migrate` is an **admin helper for a single device** (support, dev/QA, one-off cleanup). It is **not** the mechanism for rolling the change out across a fleet — use the tenant/group settings for that.
{% endhint %}

## Logs & troubleshooting

Native runtime installs write a per-package log to:

```
C:\ProgramData\RealmJoin\choco\logs\<package-id>\<timestamp>_<version>_<operation>.log
```

(kept to the 10 most recent entries per package). This is separate from classic Chocolatey's `C:\ProgramData\chocolatey\logs\`. When collecting logs for a support request, include the `C:\ProgramData\RealmJoin\` folder as described in [Package Installation Issues](../../troubleshooting/package-installation-issues/).

### File & path reference

<table><thead><tr><th>Path</th><th>Purpose</th></tr></thead><tbody><tr><td><code>C:\ProgramData\RealmJoin\choco\lib\&#x3C;id></code></td><td>Native runtime package install root.</td></tr><tr><td><code>C:\ProgramData\RealmJoin\choco\extensions\&#x3C;id></code></td><td>Auto-imported PowerShell helper modules.</td></tr><tr><td><code>C:\ProgramData\RealmJoin\choco\logs\&#x3C;id></code></td><td>Per-install logs (last 10 per package).</td></tr><tr><td><code>C:\Program Files\RealmJoin\choco-shim\choco.exe</code></td><td>The <code>choco.exe</code> shim.</td></tr></tbody></table>
