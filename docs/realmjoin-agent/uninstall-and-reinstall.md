---
type: RealmJoin Agent
description: >-
  Remove the RealmJoin Agent from a Windows device, or reinstall it to repair a
  device on which the Agent no longer works as expected.
---

# Uninstalling and Reinstalling the Agent

This page describes how to remove the RealmJoin Agent from a single device and how to reinstall it as a troubleshooting step. To remove RealmJoin from your whole tenant, see [Offboarding](../troubleshooting-and-faq/offboarding.md).

{% hint style="warning" %}
If the Agent is deployed through Intune (see [Deploying the Agent](installation.md)), **remove the device from the assignment first**. Intune detects the Agent by the file `C:\Program Files\RealmJoin\RealmJoin.exe` and reinstalls it on its next check-in as long as the device is still assigned.
{% endhint %}

## Uninstalling the Agent

{% stepper %}
{% step %}
### Remove the Intune assignment

Remove the device from the managed app group of the **RealmJoin Agent (Device)** package, or exclude it from any additional assignment such as "All devices".

Removing the assignment only stops Intune from reinstalling the Agent. It does not remove the Agent from the device.
{% endstep %}

{% step %}
### Run the uninstaller

Run the uninstaller with administrative rights, either interactively or through a script running as SYSTEM.

{% tabs %}
{% tab title="Windows Settings" %}
Open **Settings** → **Apps** → **Installed apps**, select **RealmJoin** and choose **Uninstall**.
{% endtab %}

{% tab title="Command line" %}
In an elevated command prompt:

```
"C:\Program Files\RealmJoin\RealmJoin.exe" -uninstall
```
{% endtab %}

{% tab title="PowerShell (Intune script)" %}
Run as SYSTEM, for example as an Intune platform script or remediation:

```powershell
$exe = Join-Path $env:ProgramFiles "RealmJoin\RealmJoin.exe"
if (Test-Path $exe) {
    $p = Start-Process -FilePath $exe -ArgumentList "-uninstall" -Wait -PassThru
    exit $p.ExitCode
}
```
{% endtab %}
{% endtabs %}

The uninstaller closes the RealmJoin tray, removes the RealmJoin service, the logon task, the shortcuts and the entry in **Installed apps**.
{% endstep %}

{% step %}
### Restart the device

The program files in `C:\Program Files\RealmJoin` are removed during the next restart.
{% endstep %}
{% endstepper %}

{% hint style="info" %}
**Uninstalling the "RealmJoin Setup Launcher" MSI does not remove the Agent.** The MSI only starts the Agent's own installer. Always use the uninstaller described above.
{% endhint %}

### What remains on the device

Uninstalling removes the Agent itself, but not what the Agent has set up:

* Applications installed through RealmJoin stay installed, as does Chocolatey.
* The package state in `HKLM\SOFTWARE\RealmJoin`, the data in `C:\ProgramData\RealmJoin` and the logs in `C:\Windows\Logs\RealmJoin` are kept.
* The device stays visible in the RealmJoin Portal.

If you need to remove all remaining traces of RealmJoin from a device, [contact us](../legal/support.md) for our clean-up script.

## Reinstalling the Agent for troubleshooting

If the Agent no longer works as expected on a device, for example the tray does not start or the device stops syncing, a reinstall replaces the Agent's program files, service and logon task.

Because the package state is kept, **applications are not reinstalled** and the device keeps its RealmJoin configuration.

{% stepper %}
{% step %}
### Collect logs

Collect the log files before you start, so the cause can still be analysed afterwards. See [Collecting Logfiles](../troubleshooting-and-faq/troubleshooting/package-installation-issues/collecting-logfiles.md).
{% endstep %}

{% step %}
### Uninstall the Agent

Run the uninstaller as described in [Uninstalling the Agent](#uninstalling-the-agent). Keep the Intune assignment in place if Intune should reinstall the Agent.
{% endstep %}

{% step %}
### Restart the device

{% hint style="warning" %}
Do not skip the restart. Until the device restarts, `RealmJoin.exe` is still present: Intune still considers the Agent installed, and the installer skips the installation.
{% endhint %}
{% endstep %}

{% step %}
### Install the Agent again

{% tabs %}
{% tab title="Through Intune" %}
If the device is still assigned to the **RealmJoin Agent (Device)** package, Intune detects that the Agent is missing and reinstalls it on its next check-in. To speed this up, trigger a sync from the Company Portal or from the device's page in Intune.
{% endtab %}

{% tab title="Manually" %}
Download the [installer for the stable release](https://gkrealmjoin.s3.amazonaws.com/win-release/RealmJoin.exe) and run it from an elevated command prompt:

```
RealmJoin.exe -install
```

See [Deploying the Agent](installation.md#interactive-installation-via-command-line) for other channels.
{% endtab %}
{% endtabs %}
{% endstep %}
{% endstepper %}

{% hint style="info" %}
If the problem persists after a reinstall, [contact us](../legal/support.md) and include the log files you collected.
{% endhint %}
