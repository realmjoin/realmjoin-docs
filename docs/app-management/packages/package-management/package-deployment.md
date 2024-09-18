# Package Assignments

{% embed url="https://www.youtube.com/watch?v=BdF3rvMbjFs" %}

## Subscription

On the Overview Tab of a package, you will find buttons, that allow you to import the package from the store into your environment.

<figure><img src="../../../../.gitbook/assets/image (331).png" alt=""><figcaption><p>Subscribe Buttons</p></figcaption></figure>

They will create a Win32 software package in Intune when pressed. You have two options:

### Managed Deployment

When a Managed packed is chosen, RealmJoin will create Microsoft Entra groups to assign the application to users. These groups can be managed from both the RealmJoin Portal and Microsoft Entra ID. Managed deployment will automatically create four RealmJoin-managed groups:

<figure><img src="../../../../.gitbook/assets/image (335).png" alt=""><figcaption><p>Application Groups</p></figcaption></figure>

The created Entra ID groups can be managed from both the RealmJoin Portal and Microsoft Entra ID.&#x20;

#### **Main (Blank)**

RealmJoin or Intune will automatically install the application. These applications are mandatory and RealmJoin/Intune will continually attempt to install the application if not found on the device.

#### **Available**

{% tabs %}
{% tab title="RealmJoin" %}
The application will appear in the RealmJoin Agent tray and will require the user to initiate the download and installation

<figure><img src="../../../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="Intune" %}
The application will appear in Company Portal -> Apps and will require the user to initiate the download and installation

<figure><img src="../../../.gitbook/assets/image (2).png" alt=""><figcaption></figcaption></figure>
{% endtab %}
{% endtabs %}

#### Preview

Users and devices in the Preview group will receive the latest version of the package before the other groups. Preview settings are configurable through the [Automation tab](package-details.md#automation).

#### Uninstall

RealmJoin or Intune will uninstall the package from the assigned users and devices. Adding a user or device to the Uninstall group will remove them from all other groups.

#### Update

Additionally, RealmJoin provides an Update group that is created on demand. The Update group will automatically onboard loose installations of a software title into management.

Click **Enable Update Group** and a new EntraID Group with the suffix "(update)" will be created and software installations also assigned to this group. RealmJoin will dynamically discover installed copies of the software that are unmanaged and add the device it has been discovered on to the update group.

<figure><img src="../../../.gitbook/assets/app-deploy-1.png" alt=""><figcaption><p>Enable an Update Group</p></figcaption></figure>

Thus, new version of this software will also be installed on these devices to assert deployment of security patches across your environment.

<figure><img src="../../../.gitbook/assets/app-deploy-2.png" alt=""><figcaption><p>Update Group Enabled</p></figcaption></figure>

{% hint style="info" %}
Managed packages are the preferred way to deploy software to your users. You can combine it with automated package updates and ensure your users receive latest features and patches.
{% endhint %}

#### Changing Assignments

{% hint style="warning" %}
Users and devices should only be in one RealmJoin managed group at any given time.
{% endhint %}

Users and devices can easily be moved across groups using the Managed Users function.

<figure><img src="../../../.gitbook/assets/image (3).png" alt=""><figcaption></figcaption></figure>

Selecting Main, Preview, Available and Uninstall will add the user to the chosen group and remove the user from all other groups relevant to the package.

Selecting Assign will add users to the Main group by default.

### Basic

Basic packages do not have any associated Microsoft Entra groups. You will have to manually assign groups, devices or users.

Groups, devices and users that are assigned to a Basic package will have their assigned package deployed as soon as possible.

