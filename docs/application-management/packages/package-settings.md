---
type: Application Management
description: >-
  The Config tab of a RealmJoin package: Technical Application Owners,
  installation arguments, expert settings for RealmJoin and Intune packages,
  and how dependencies and installation order are resolved.
---

# Package Settings

The **Config** tab of the [package details page](package-details.md) holds the settings of a subscribed package. Automatic updates are configured on the Automation tab, see [Automation](package-updates.md#automation).

<figure><img src="../../.gitbook/assets/image (328).png" alt=""><figcaption><p>Package Config</p></figcaption></figure>

The tab shows these cards:

* **Technical Application Owners** - Who is notified about this package.
* **Main app** - The settings of the main package: arguments, an internal team comment (RealmJoin only) and the **Expert settings** button.
* **Preview app** - The same settings for the preview package, shown while a [preview](package-updates.md#staged-updates-with-preview) is running.

Settings made here apply to the whole package. Individual assignments can deviate from them, see [Assignment settings](package-deployment.md#assignment-settings).

## Technical Application Owners

You can assign multiple **Technical Application Owners** (TAO) to a package by adding their email addresses with **Add recipient**.

To send them **automated notification emails** about package updates, turn on the **Enable** switch.

## Arguments

**Arguments on client execution** allow you to pass command line switches to an application installation. This is commonly used to customize your package with language options, a license key etc. that need to be present at installation time.

{% hint style="info" %}
If a user already has the current subscribed version of a package installed and the package arguments are updated, the package will automatically re-run for that user using the new configuration.

If **Auto upgrade** is **OFF** and the user has an older version installed than the currently assigned one, the new configuration will **not** be applied.\
If **Auto upgrade** is **ON**, the user will receive both the new version and the updated configuration.
{% endhint %}

Some packages include a **Technical Help**, to explain possible **Arguments** and other Requirements.

![Technical Help for a Package](<../../.gitbook/assets/image (72).png>)

Intune packages for macOS have no arguments.

### Special arguments for Intunewin packages

For Intunewin packages we offer a configurable package update UI notification which lets the user interact with the install / update of an application and gives control over the process.

<figure><img src="../../.gitbook/assets/Screenshot 2026-03-04 at 14.39.28.png" alt=""><figcaption></figcaption></figure>

You can configure this dialog with the following settings in the arguments section:

```
--rjNotifyUser // Activate dialog
```

```
--rjNotifyAllowDefer[=n] // snooze option with x possible deferrals
```

```
--rjNotifyTimeout=n // when no user action is performed -> automatic snooze after x seconds (if deferral allowed), otherwise update
```

<figure><img src="../../.gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>

## Internal team comment

For RealmJoin packages, the **Internal team comment** field holds notes for your administrators. It is not shown to users.

## Expert Settings

The **Expert settings** button on the Main app or Preview app card opens advanced options for the package. RealmJoin and Intune packages offer different settings. Viewing them requires `CanSeeAppExpertSettings`, changing them `CanEditAppExpertSettings`.

<figure><img src="../../.gitbook/assets/image (354).png" alt=""><figcaption><p>Expert Settings</p></figcaption></figure>

{% tabs %}
{% tab title="RealmJoin packages" %}
<table><thead><tr><th width="200">Setting</th><th>Explanation</th></tr></thead><tbody><tr><td>Allow reinstallation</td><td>Allows the user to <strong>reinstall</strong> the package at any time, overriding the current installation.<br>E.g.: suitable for packages that help fixing client issues via self-service (time sync, ...).</td></tr><tr><td>Allow background installation</td><td>Executes <strong>package updates directly</strong> after configuration updates have been detected on the device (standard RealmJoin sync interval: 30 minutes). Updates start without warning (no snooze option).<br>Do not use this option for regular packages as this might interrupt users when using the software.</td></tr><tr><td>Require compliance</td><td>The package is only <strong>installed</strong> once RealmJoin can verify that the device is <strong>compliant</strong> in Intune. This might stop the rollout for some time. The installation of the package and all other mandatory packages with higher order numbers are queued and only installed when the device is compliant.</td></tr><tr><td>Pre-release</td><td>Legacy setting, not available for managed packages. See <a href="https://docs-classic.realmjoin.com/rj-portal/software-packages">RealmJoin Classic</a>.</td></tr><tr><td>Auto upgrade</td><td><p><strong>Automatically upgrades</strong> existing installations when a <strong>newer version</strong> is assigned. If the assigned version is higher than the one on the device, RealmJoin re‑runs the package to update it.</p><p>Disable this option for packages with their own update mechanisms (e.g.: VPN client updated via gateway). When off, only new installations receive the newer version.</p><p>The RealmJoin Agent updates Required <em>and</em> Available packages.</p></td></tr><tr><td>Allow available uninstall</td><td>Allows users to <strong>uninstall</strong> the package when it is assigned as <strong>Available</strong>.</td></tr><tr><td>Only in VDI / Ignore in VDI</td><td>Execute this package on <strong>VDI</strong> devices (Windows 365 and Azure Virtual Desktop) only, or skip it there.</td></tr><tr><td>Only on hybrid-joined devices / Ignore on hybrid-joined devices</td><td>Execute this package on <strong>hybrid-joined devices</strong> only, or skip it there.</td></tr><tr><td>Ignore on private devices</td><td>Skip <strong>private</strong> devices (not Entra ID joined).</td></tr><tr><td>Group name</td><td>The <strong>category</strong> in which the package appears in the RealmJoin Tray menu.</td></tr><tr><td>Depends on</td><td><p>Packages the RealmJoin Agent installs <strong>before</strong> this package, e.g. a runtime such as the Microsoft Visual C++ Redistributable.</p><p>Enter the <strong>Unique RJ ID</strong> of one package, or a JSON array of IDs:<br><code>["generic-microsoft-vcredist-2019","generic-microsoft-net-core-desktop-runtime-6"]</code></p><p>Every dependency must be assigned to the same users or devices (Required or Available). See <a href="#dependencies-and-installation-order">Dependencies and installation order</a>.</p></td></tr><tr><td>Order</td><td>Integer that sorts the installation within one <a href="#installation-order">dependency level</a>. Lower numbers run first (e.g. <strong>10</strong> before <strong>100</strong>). <strong>0</strong> means "no order" and runs after all numbered packages of the same level.</td></tr><tr><td>Priority cascade</td><td>Managed packages only. Decides which assignment wins when a user or device matches both the Main and the Available group of this package:<br><strong>Use tenant default (recommended)</strong> - follows the tenant-wide switch in Settings > General > App Config.<br><strong>Managed cascade</strong> - Available wins over Main.<br><strong>Classic cascade</strong> - Main wins over Available.<br>See <a href="package-deployment.md#managed-and-classic-priority-cascade">Priority cascade</a> for details.</td></tr><tr><td>Deployment rate</td><td><p>Lets users <strong>defer</strong> the installation until a fixed date. The options are <strong>NoChange</strong> (no deferral), <strong>Tomorrow</strong> (+1 day), <strong>Fast</strong> (+3 days) and <strong>Slow</strong> (+7 days). For Fast and Slow, a date on a weekend is moved past the weekend. The dialog shows the resulting date.</p><p>The date is stored as a fixed value when you save, it does not move with the device's last check-in. After that date, the installation runs without further deferral.</p><p><strong>Note:</strong> Installations are staged: they are triggered several times a day with a certain probability per trigger. This ensures a smoother rollout and makes good use of BranchCache and Delivery Optimization.</p></td></tr><tr><td>Main app restrictions</td><td><p>Defines <strong>who</strong> runs the package and <strong>when</strong> (<strong>phase</strong>).</p><p>Users: <strong>Only primary user</strong> (the device's primary user as shown in the RealmJoin Portal), <strong>Only secondary users</strong> or <strong>Both</strong>.</p><p>Phases (default: <em>Normal, Initial &#x26; Manual</em>):</p><p><strong>Logon</strong>: The package runs after the user has logged on.<br><strong>Manual</strong>: The package runs when the user starts the installation manually via the tray menu.<br><strong>Initial</strong>: The package runs during the initial client deployment.<br><strong>Normal</strong>: Neither Logon, Manual nor Initial; deployment during normal use of a device.</p></td></tr><tr><td>User part restrictions</td><td>Same options as before, but for the user part of the package (if it has one), e.g. settings or scripts executed in the user's context instead of the system context.</td></tr></tbody></table>
{% endtab %}

{% tab title="Intune packages" %}
<figure><img src="../../.gitbook/assets/pkg-expert-settings-intune.png" alt="Expert settings dialog of an Intune Windows app"><figcaption><p>Expert settings of an Intune Windows app</p></figcaption></figure>

<table><thead><tr><th width="200">Setting</th><th>Explanation</th></tr></thead><tbody><tr><td>Auto upgrade</td><td><strong>Automatically upgrades</strong> existing installations when a newer version is assigned. Intune only updates <strong>Required</strong> assignments. To keep <strong>Available</strong> apps up to date, enable the <a href="update-group.md">Update Group</a>.</td></tr><tr><td>Featured app</td><td>Shows the app as a featured app in the Company Portal.</td></tr><tr><td>Allow available uninstall</td><td>Windows only. Allows users to uninstall the app from the Company Portal when it is assigned as Available.</td></tr><tr><td>Installation time required (mins)</td><td>Windows only. The maximum run time of the installation.</td></tr><tr><td>Pre-install script / Post-install script</td><td>macOS PKG apps only. Shell scripts that run before the installation or after a successful installation. Leave empty to use the package default, if any.</td></tr><tr><td>Categories</td><td>The categories under which the app appears in the Company Portal. Only shown if your tenant has <a href="package-store/package-store-details.md#app-categories">app categories</a>.</td></tr></tbody></table>
{% endtab %}
{% endtabs %}

### Dependencies and installation order

_Depends on_ and _Order_ decide which packages the RealmJoin Agent installs before a RealmJoin package and in which sequence. The agent resolves both on the device, against the packages in the device's RealmJoin configuration. That configuration contains only the RealmJoin packages assigned to the device and its user. Intune apps are not part of it and cannot be dependencies.

#### Enter dependencies

1. Open the package that needs the dependency, e.g. the application.
2. Look up the **Unique RJ ID** of each dependency in the [package properties](package-details.md#package-properties) on the left side of that dependency's package page, e.g. `generic-7zip`. If the dependency was subscribed with a suffix, the suffix is part of the ID.
3. Open **Config** > **Expert settings** of the dependent package and enter the IDs in **Depends on**:
   * one package: `generic-microsoft-vcredist-2019`
   * several packages: a JSON array with double quotes, `["generic-microsoft-vcredist-2019","generic-microsoft-net-core-desktop-runtime-6"]`
4. Save. The **Dependent Packages** section on the [Overview tab](package-details.md#overview) of the dependent package now lists every entered ID that matches a package in your tenant, linked to that package.

The dialog accepts letters, digits, `.`, `#`, `_` and `-` in an ID, and up to 511 characters in total. A comma-separated list, single quotes or spaces are rejected with _The Depends on must be a package name or a JSON array of package names._ The dialog does not check whether an ID exists or is assigned. An ID that is missing from **Dependent Packages** after saving matches no package in your tenant.

The **Main app** and the **Preview app** have separate expert settings. If the package has a [preview](package-updates.md#staged-updates-with-preview), enter the dependencies on both.

#### Requirements on the device

* **Assign every dependency** to the same users or devices as the dependent package, as Required or Available. Available is sufficient: the agent installs an Available dependency as soon as a package that needs it is installed. To keep a dependency out of the tray menu, enable **Hidden** in its [assignment settings](package-deployment.md#assignment-settings).
* **A dependency that is not in the configuration is skipped**, and the dependent package is installed without it. This is the case if the dependency is not assigned, the ID is wrong, the user or device is in its [Exclude](package-deployment.md#exclude) group, it is assigned for [Uninstall](package-deployment.md#uninstall), or it is filtered out by _Only in VDI / Ignore in VDI_, _Only on hybrid-joined devices / Ignore on hybrid-joined devices_ or _Ignore on private devices_.
* **A restricted dependency blocks the dependent package.** If a dependency that is not installed yet is not allowed to run in the current phase or for the current user (_Main app restrictions_, e.g. only _Manual_ or only the primary user), the agent does not install the dependent package either. Give dependencies the same or broader restrictions than the packages that need them.
* **Background installation** installs only packages that have _Allow background installation_ enabled themselves. A dependency without this setting is not installed in such a run, the dependent package is. Enable the setting on the dependencies of packages that use it.
* **Dependencies are resolved recursively**: a dependency can have dependencies of its own. A circular dependency (A needs B, B needs A) is detected and that loop is ignored; both packages are still installed.

#### Installation order

Before each installation run, the agent builds a tree from all assigned packages:

* Every assigned package is on **level 0**, its dependencies on level 1, their dependencies on level 2, and so on.
* A package that appears on several levels, e.g. a runtime needed by several applications, counts on its **deepest** level only and is installed once.

The agent then installs the packages one after another: the deepest level first, and within one level sorted by **Order** (lower first, 0 last). _Order_ therefore cannot move a package ahead of packages on a deeper level. This sorting applies to every installation run; its effect is most visible during the initial rollout, when all Required packages are installed in one run. The [RealmJoin ESP](../../realmjoin-agent/realmjoin-client/realmjoin-esp.md) uses the same sequence.

Example, all packages assigned as Required:

| Package | Order | Depends on | Level |
| ------- | ----- | ---------- | ----- |
| A       | 1     | –          | 0     |
| B       | 101   | C          | 0     |
| C       | 100   | –          | 1     |

The installation sequence is **C, A, B**: C is on level 1 and is installed before all level 0 packages, although its order number is higher than that of A.

#### Updates, failures and uninstallation

* **Updates and changed arguments:** Whenever the agent installs the dependent package (first installation, [Auto upgrade](#expert-settings), changed [arguments](#arguments), reinstallation from the tray), it first installs every dependency that is not in its assigned state: not installed, an older version, or changed arguments. This happens regardless of the dependency's own _Auto upgrade_ setting.
* **Failed dependency:** The run continues with the next package, including the dependent package. The agent installs the failed dependency again in a later run as long as the dependent package still has to be installed, or if the dependency itself is assigned as Required. Assign dependencies as Required if they must be retried independently.
* **Uninstallation:** Dependencies are not considered. Uninstalling a package leaves its dependencies installed. An [Uninstall](package-deployment.md#uninstall) assignment on a dependency removes it from the configuration, so packages that need it are installed without it from then on.

#### Dependencies set by RealmJoin

* The user part of a package (_User part restrictions_) always depends on its main package, so the main package is installed first.
* If the [RealmJoin Core Choco Extension](../../realmjoin-agent/recommended-packages.md#realmjoin-core-choco-extension) is assigned, every Chocolatey package depends on it automatically.

#### Troubleshooting

The agent writes the planned operations of every installation run to [`tray.log`](../../troubleshooting-and-faq/troubleshooting/package-installation-issues/logfiles-structure.md) as a table _Operations on n packages_. It shows the level, the order, the planned operation and the constraints of each package: `Dependency` marks a package installed as a dependency, `DependencyRestricted` a package blocked by a restricted dependency. At trace log level, the dependency tree is logged as _Analyzing dependencies_; IDs that are not in the configuration appear there as `<id>: Dependency not found!`, circular dependencies as `Recursive dependency!`.
