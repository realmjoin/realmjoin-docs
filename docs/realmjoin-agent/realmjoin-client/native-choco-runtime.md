---
description: >-
  The Native Choco Runtime is RealmJoin's own package installation engine that
  replaces the outdated Chocolatey 0.10.3 binary while staying fully compatible
  with existing packages.
---

# Native Choco Runtime

{% hint style="info" %}
The Native Choco Runtime was introduced with **RealmJoin Agent 4.21.6 (Beta)**. While in beta it is **opt-in**: existing clients keep using the classic Chocolatey engine until you explicitly enable the native runtime.
{% endhint %}

## What it is

When the RealmJoin Agent installs software packages outside of Intune (see [package installation](deploy-apps.md#package-installation)), it has traditionally relied on [Chocolatey](https://chocolatey.org/) as the underlying package engine. RealmJoin shipped a pinned, heavily patched build of the open-source Chocolatey CLI — version **0.10.3** — bundled as `choco.exe` under `C:\ProgramData\chocolatey\`.

The **Native Choco Runtime** replaces that bundled Chocolatey binary with RealmJoin's **own, purpose-built implementation**. It _shims_ Chocolatey: it understands the same package format and behaves the same way from a package author's and administrator's point of view, but it no longer depends on the ageing Chocolatey 0.10.3 codebase.

In other words, packages you already use keep working unchanged — only the engine underneath them changes.



## Compatibility

The Native Choco Runtime is designed as a **drop-in replacement**:

* Existing RealmJoin packages (including everything from the [Package Store](../../app-management/packages/package-store/)) install and uninstall the same way.
* Package arguments / params configured in the RealmJoin Portal continue to work.
* The [RealmJoin Core Choco Extension](../recommended-packages.md#realmjoin-core-choco-extension) helper cmdlets used inside package scripts remain available.
* Log files are still written to the usual locations used for [troubleshooting package installations](../../troubleshooting/package-installation-issues/).

{% hint style="warning" %}
As this runtime is in beta, we recommend validating your most important packages on a pilot ring before rolling it out tenant-wide. Please report any behavioural differences to RealmJoin support so we can address them before general availability.
{% endhint %}

## How to use it

The runtime is selected through a RealmJoin **setting**, so you can control it centrally instead of touching individual clients. RealmJoin settings cascade, which means you can set a **tenant-wide default** and, where needed, **override it for specific groups** (and the objects within them).

{% hint style="info" %}
Setting Key: Chocolatey.UseNativeRuntime

Setting Value: true/false
{% endhint %}

{% stepper %}
{% step %}
### Enable it for a pilot group first

Open the settings of a RealmJoin **group** that contains a small set of pilot devices and enable the Native Choco Runtime there. Because group settings take precedence over the tenant-wide default, only those devices switch to the new engine.
{% endstep %}

{% step %}
### Validate your packages

Let the pilot devices run their normal package assignments and upgrades. Confirm that installations succeed and check the logs if anything looks off (see [Package Installation Issues](../../troubleshooting/package-installation-issues/)).
{% endstep %}

{% step %}
### Roll it out tenant-wide

Once you are confident, enable the Native Choco Runtime as the **tenant-wide default** so that all clients use it. Individual groups can still opt out if you need to keep them on the classic engine temporarily.
{% endstep %}
{% endstepper %}

{% hint style="info" %}
Configuration follows the same tenant-setting / group-override model as the other agent settings described under [General settings](../../realmjoin-settings/general.md) (for example the **Client Configuration** and **LAPS Configuration** tenant settings).
{% endhint %}

## What is the default

During the 4.21.6 Beta the Native Choco Runtime is **disabled by default**. Clients continue to use the classic, bundled Chocolatey 0.10.3 engine until an administrator enables the native runtime — either tenant-wide or for a specific group. This lets you adopt the new runtime at your own pace and roll it back just as easily while the feature is in beta.
