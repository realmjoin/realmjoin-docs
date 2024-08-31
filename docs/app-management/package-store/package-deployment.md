# Package Deployment



## Subscription

On the Overview Tab of a package, you will find buttons, that allow you to import the package from the store into your environment.

<figure><img src="../../../.gitbook/assets/image (331).png" alt=""><figcaption><p>Subscribe Buttons</p></figcaption></figure>

They will create a Win32 software package in Intune when pressed. You have two options:

### Managed

When a Managed packed is chosen, RealmJoin will create Microsoft Entra groups to assign the application to users. These groups can be managed from either the RealmJoin Portal or Microsoft Entra ID.

<figure><img src="../../../.gitbook/assets/image (335).png" alt=""><figcaption><p>Application Groups</p></figcaption></figure>

**Managed Package Group Category:**

* Main (blank): RealmJoin or Intune will automatically install the application. These applications are mandatory and RealmJoin/Intune will continually attempt to install the application if not found on the device.
* Available:
  *   RealmJoin: The application will appear in the RealmJoin Agent tray and will require the user to initiate the download and installation\


      <figure><img src="../../../.gitbook/assets/image (338).png" alt=""><figcaption><p>RealmJoin Agent</p></figcaption></figure>
  *   Intune: The application will appear in Company Portal > Apps and will require the user to initiate the download and installation\


      <figure><img src="../../../.gitbook/assets/image (339).png" alt=""><figcaption><p>Company Portal</p></figcaption></figure>
* Preview: Users and devices in the Preview group will receive the latest version of the package before the other groups. Preview settings are configurable through the [Automation tab](../package-management/package-details.md#automation).
* Uninstall: RealmJoin or Intune will uninstall the package from the assigned users/devices

Managed packages are the preferred way to deploy software to your users. You can combine it with automated package updates and ensure your users receive latest features and patches.

### Basic

Basic packages do not have any associated Microsoft Entra groups. You will have to manually assign groups, devices or users.

