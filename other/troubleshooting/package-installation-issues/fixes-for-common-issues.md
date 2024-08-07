# Fixes for common issues

{% hint style="danger" %}
**Only use these fixes in the described scenarios!**&#x20;

**These are not intended to be applied blindly as they may do more harm if applied unnecessarily.**
{% endhint %}

## BranchCache issues

* Error message `There is not enough space on the disk` (may also occur localized, depending on Windows OS language) in download phase, chocolatey exit code `404`:
  1. Open an elevated PowerShell
  2. Run `Clear-BCCache -Force`
* Error message `The supplied object has not been initialized` (may also occur localized, depending on Windows OS language) in download phase, chocolatey exit code `404`:
  1. Open an elevated PowerShell
  2. Run `Reset-BC -Force`

## Missing / wrong Package arguments <a href="#user-content-missing-wrong-package-arguments" id="user-content-missing-wrong-package-arguments"></a>

1. Check the `chocolatey.log` file for the value(s) of `packageParameters` in the section `RJAppDeployToolkit: Resulting Variables`
   * These are the actual value(s) used for the installation and passed by the RealmJoin backend.
2. If they are not the value(s) you would expect, check the package assingment in the RealmJoin portal for group / user override values.

## Broken chocolatey config <a href="#user-content-broken-chocolatey-config" id="user-content-broken-chocolatey-config"></a>

1. Delete contents of folder `C:\ProgramData\chocolatey\config`
2. Delete System Variable
   * Use GUI: Run `sysdm.cpl` -> Tab `Advanced` -> `Environment Variables...`
   * Use (admin) cmd: `REG delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /V ChocolateyInstall`
3. Reboot
4. RealmJoin tray will reinstall chocolatey, let the system settle for 5-10 minutes.
5. If you experience missing items in the RealmJoin tray menu, reboot again.

## General Setup issues <a href="#user-content-general-setup-issues" id="user-content-general-setup-issues"></a>

**As these are very individual, this is just a collection of general troubleshooting steps to help narrow down the issue.**

* Check for log file(s) in `C:\WINDOWS\Logs\RealmJoin\Packages\<package-id>\`.
  * Try to analyze the log file(s) and find the issue.
* If no log file is present, or not helpful, try manually running the setup in GUI mode, to see possible error messages.
  * IMPORTANT: RealmJoin system packages are always installed using the built-in `NT AUTHORITY\SYSTEM` account, so it is best to use a tool like `psexec` to run the installation from that account.
  * Most of the time running the installation using a standard local admin account will provide the same error so running from `NT AUTHORITY\SYSTEM` may not be necessary.

### Package not available to install / not showing in RealmJoin tray menu <a href="#user-content-package-not-available-to-install-not-showing-in-realmjoin-tray-menu" id="user-content-package-not-available-to-install-not-showing-in-realmjoin-tray-menu"></a>

* Check if package is correctly assigned to user or user is member of assigned group
* Check if package is not assigned hidden (use Debug Mode to see hidden assigned packages)
* Check if user is primary user of the client, alternatively check if package is configured to be available to secondary users
