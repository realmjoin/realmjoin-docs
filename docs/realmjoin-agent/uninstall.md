---
type: RealmJoin Agent
description: >-
  Remove the RealmJoin Agent from a single Windows device and, if needed,
  install it again.
---

# Uninstalling the Agent

The RealmJoin Agent can be removed from a single device with its built-in uninstaller. To remove RealmJoin from your whole tenant, see [Offboarding](../troubleshooting-and-faq/offboarding.md) instead.

{% hint style="warning" %}
Uninstalling the Agent is **not a general troubleshooting step**. Only do it when you actually want to remove the Agent from a device, or when our support asks you to.
{% endhint %}

## Uninstall

1. If the Agent is deployed through Intune, remove the device from the assignment of the **RealmJoin Agent (Device)** package first. Otherwise Intune installs the Agent again on its next check-in.
2. Run the uninstaller from an elevated command prompt:

   ```
   "C:\Program Files\RealmJoin\RealmJoin.exe" -uninstall
   ```
3. Restart the device. The files in `C:\Program Files\RealmJoin` are removed during the restart.

Uninstalling removes only the Agent itself. Applications installed through RealmJoin, their package state and the RealmJoin configuration stay on the device.

## Install again

If you need to install the Agent again, for example on request of our support:

1. Uninstall the Agent as described above, but keep the Intune assignment in place.
2. Restart the device. Until then, `RealmJoin.exe` is still present and Intune considers the Agent installed.
3. Intune installs the Agent again on its next check-in. Without Intune, run the installer manually as described in [Deploying the Agent](installation.md#interactive-installation-via-command-line).

Because packages and configuration are kept, applications are not reinstalled and the device continues where it left off.
