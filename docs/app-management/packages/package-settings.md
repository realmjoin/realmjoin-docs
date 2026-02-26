---
description: This page details the different settings available for deployed packages
---

# Package Settings

### Automation

<figure><img src="../../.gitbook/assets/image (228).png" alt=""><figcaption><p>Package Automation</p></figcaption></figure>

For managed packages, the Automation tab lets you set up automatic deployment of the latest package versions from the package store to your environment.

* **Automate Main Channel** - Automatically deploy new versions of this package to your users. ("Main" subscription)
* **Automate Preview Channel** - Automatically deploy new versions of this package to your pilot users. ("Preview" subscription)

{% hint style="info" %}
The Preview Channel will only advance to a newer software version after deploying the current version in Preview to the Main Channel.&#x20;

This is intended behavior to ensure that a testing / review process using the Preview Channel is not accidentally invalidated by a newer software version entering Preview.
{% endhint %}

The Preview Channel will take the newest version available from the App Store pushing its current version to the main channel.

{% hint style="success" %}
Recommendation:&#x20;

* Automate only **Main Channel** for software that can upgrade without prior testing, such as web browsers from major vendors.
* Automate only **Preview Channel** for software you want to test before deploying. Push the validated version to Main Channel after testing and start testing the next version in Preview.

You can always manually push a newer version available in Package Store directly to **Preview** or **Main Channel** to skip a version you don't want published.
{% endhint %}

* **... defer X days** - Wait for this number of days to pass before publishing a new version to the channel. This is useful to avoid stress for users/clients if multiple package versions are published rapidly.
* **Deploy At Night** - Schedule automatic deployment during nighttime
* **Select target time zone** - If you use **Deploy At Night**, use this Time Zone to indicate when "at night" is.

These values can be globally preconfigured for newly imported packages in [Settings](../../realmjoin-settings/settings.md). Configuring them on a per package basis will overwrite the global defaults.



### Config

<figure><img src="../../.gitbook/assets/image (324).png" alt=""><figcaption><p>Package Config</p></figcaption></figure>

#### Technical Application Owners

If wanted, you can assign multiple **Technical Application Owners** (TAO) to a package via storing their email-addresses.

For receiving **automated notification emails** for package updates, you can **enable** the switch below in addition.

#### Arguments

**Arguments** allow you to pass command line switches to an application installation. This is commonly used to customize your package with language options, a license key etc. that need to be present at installation time.

{% hint style="info" %}
If a user already has the current subscribed version of a package installed and the package arguments are updated, the package will automatically re-run for that user using the new configuration.

If **Auto upgrade** is **OFF** and the user has an older version installed than the currently assigned one, the new configuration will **not** be applied.\
If **Auto upgrade** is **ON**, the user will receive both the new version and the updated configuration.
{% endhint %}

Some packages include a **Technical Help**, to explain possible **Arguments** and other Requirements.

![Technical Help for a Package](<../../.gitbook/assets/image (56).png>)

#### Expert Settings

{% hint style="info" %}
RealmJoin App Deployment required.\
For full feature set of "Expert settings": RealmJoin Agent required.
{% endhint %}

<table><thead><tr><th width="154">Setting</th><th width="478">Explanation</th><th>Agent only</th></tr></thead><tbody><tr><td>Allow reinstallation</td><td>This option allows the user to <strong>reinstall</strong> and therefore override their current installation of the <strong>package</strong> at any time.<br>E.g.: suitable for packages that help fixing client issues via self-service (time sync, ...).</td><td>Yes</td></tr><tr><td>Allow background installation</td><td>Executes <strong>package updates directly</strong> after configuration updates have been detected on the corresponding device (standard RJ sync interval: 30 minutes). Updates start without warning (no snooze option).<br>Do not use this option for regular packages as this might interrupt users when using the corresponding software.</td><td>Yes</td></tr><tr><td>Require compliance</td><td>The package is <strong>installed</strong> as soon as RealmJoin is able to verify that the device is <strong>considered "compliant"</strong>. This might stop the roll out for some time. The installation of the package and all other mandatory packages with higher order numbers are getting queued and only installed when the client is compliant.</td><td>Yes</td></tr><tr><td>Pre-Release</td><td>Legacy setting - see <a href="https://docs-classic.realmjoin.com/rj-portal/software-packages">RealmJoin Classic</a>.</td><td>Yes</td></tr><tr><td>Auto upgrade</td><td><p><strong>Automatically upgrades</strong> a package when a <strong>newer version</strong> becomes available. If the subscribed version is higher than the one on the device, RealmJoin re‑runs the package to update it.</p><p><br>Disable this option for packages with their own update mechanisms (e.g.: VPN client updated via gateway). When off, only new device installs receive the updated version.<br><br><strong>Behavior by platform:</strong></p><p><strong>RealmJoin Agent:</strong> Updates required <em>and</em> available packages.<br><strong>Intune:</strong> Updates required packages only.</p></td><td>No</td></tr><tr><td>Only in VDI / Ignore in VDI </td><td>Execute this package on <strong>VDIs</strong> (W365 and Azure Virtual Desktop/WVD) devices only or exclude them from the installation.</td><td>Yes</td></tr><tr><td>Only on hybrid-joined devices / Ignore on hybrid-joined devices</td><td>Execute this package on <strong>hybrid-joined devices</strong> only or exclude them from the installation.</td><td>Yes</td></tr><tr><td>Ignore on private devices</td><td><strong>Exclude private</strong> devices (not Entra ID joined) from the installation.</td><td>Yes</td></tr><tr><td>Group name</td><td><strong>Category</strong> in which the package will show up in RealmJoin tray menu.</td><td>Yes</td></tr><tr><td>Depends on</td><td><p>Specifies prerequisite packages that must be installed before this package. RealmJoin installs all listed dependencies first. Ensure dependent packages are also assigned (e.g. marked as available).<br>Example: A runtime environment such as "Microsoft VC Redistributable Runtime" required for a software to run.</p><p><br>Enter the package ID (see RJ portal "Unique RJ ID" on the desired package) in the following format:<br><code>["package-id"]</code></p><p>For multiple packages:<br><code>["package-id1","package-id2"]</code></p><p>Example:<br><code>["generic-microsoft-vcredist-2019","generic-microsoft-net-core-desktop-runtime-6"]</code></p></td><td>Yes</td></tr><tr><td>Order</td><td>Defines the installation sequence using an integer value. Lower numbers run first (e.g., <strong>10</strong> installs before <strong>100</strong>).<br>A value of <strong>0</strong> means “no sequence” and runs only after all numbered packages.<br>Order numbers are applied <strong>only during the initial client rollout</strong>.</td><td>Yes</td></tr><tr><td></td><td><p><strong>Do not use </strong><em><strong>Dependency</strong></em><strong> and </strong><em><strong>Order</strong></em><strong> on the same package.</strong><br>During initial rollout (or any mandatory rollout after login), RealmJoin first installs all dependency packages, then installs the original packages. This two‑stage process overrides and can nullify any defined order numbers.</p><p><strong>For example:</strong></p><ul><li>Package A, order 1</li><li>Package B, order 101 and depending on Package C, order 100.</li><li>If all packages are assigned as mandatory, the installation sequence will be C, A, B</li></ul><p>User settings within application packages are treated as a set dependency. </p></td><td></td></tr><tr><td>Deployment rate</td><td>Select the deployment rate which <strong>allows or blocks</strong> users from <strong>deferring</strong> the package <strong>installation</strong> until the displayed date. You have the choice between "Slow" (+7), "Fast" (+3) and "Tomorrow" (+1).<br>Example: When choosing "Tomorrow", the current date + one day will be stored as fixed value. Users can defer until this date. Afterwards, the installation will just execute without further control. Note that the date is not dynamic (so, not depending on the client's last check in time).   <br><strong>Note:</strong> The installation on devices includes a staged mechanism: installations will occur multiple times a day with a specific probability per trigger. This ensures a smoother rollout and utilizes BC/DO features effectively.</td><td>Yes</td></tr><tr><td>Main app restrictions</td><td><p>This option allows to define <strong>who</strong> can run a package installation and <strong>when</strong> it will happen (<strong>phase</strong>).</p><p></p><p>Define whether this package should run just for the primary user of a device (visible and changeable in RealmJoin portal), only secondary users or for both of them.</p><p></p><p>Choose between the following phases or combinations of them. Default is "Normal, Initial &#x26; Manual".<br></p><p><strong>Logon</strong>: The package runs after the user has logged on.</p><p><strong>Manual</strong>: The package will run when the user starts installation via tray menu manually.</p><p><strong>Initial</strong>: The package only runs during the initial client deployment.</p><p><strong>Normal</strong>: Neither Logon, nor Manual, nor Initial. Deployment during the normal usage of a client.</p></td><td>Yes</td></tr><tr><td>User part restrictions</td><td>Same options as before - but for the user part (if available for the corresponding package). E.g.: contains settings or scripts executed under the current user ("user" instead of "system scope").</td><td>Yes</td></tr></tbody></table>

<figure><img src="../../.gitbook/assets/image (5) (1) (1) (1).png" alt=""><figcaption><p>Expert Settings</p></figcaption></figure>

