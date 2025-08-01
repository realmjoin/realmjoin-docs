# Package Configuration and Assignment

{% embed url="https://www.youtube.com/watch?v=BdF3rvMbjFs" %}

## Managed Subscription

Packages subscribed as managed come with automatically created and RealmJoin managed user groups. There are different types of groups available that can be chosen based on the specifics of the scenario.

{% hint style="info" %}
Managed packages are the preferred way to deploy software to your users. You can combine it with automated package updates and ensure your users receive latest features and patches.
{% endhint %}

#### **Main (Required)**

RealmJoin or Intune will automatically install the application. These applications are mandatory and RealmJoin/Intune will continually attempt to install the application if not found on the device.

#### **Available**

{% tabs %}
{% tab title="RealmJoin" %}
The application will appear in the RealmJoin Agent tray and will require the user to initiate the download and installation

<figure><img src="../../.gitbook/assets/image (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="Intune" %}
The application will appear in Company Portal -> Apps and will require the user to initiate the download and installation

<figure><img src="../../.gitbook/assets/image (2) (1) (1).png" alt=""><figcaption></figcaption></figure>
{% endtab %}
{% endtabs %}

#### Preview

Users and devices in the Preview group will receive the latest version of the package before the other groups. Preview settings are configurable through the [Automation tab](package-details.md#automation).

#### Uninstall

RealmJoin or Intune will uninstall the package from the assigned users and devices. Adding a user or device to the Uninstall group will remove them from all other groups.

#### Exclude

Needs to be activated. Users in this group will be excluded from assignments. This should only used in specific cases. glueckkanja strongly advises against multi-layer assignment constructs.&#x20;

#### Update

Additionally, RealmJoin provides an Update group that is created on demand. The Update group will automatically onboard loose installations of a software title into management.

Click **Enable Update Group** and a new EntraID Group with the suffix "(update)" will be created and software installations also assigned to this group. RealmJoin will dynamically discover installed copies of the software that are unmanaged and add the device it has been discovered on to the update group.

<figure><img src="../../.gitbook/assets/image (43).png" alt=""><figcaption><p>Additional groups can be activated</p></figcaption></figure>



Thus, new version of this software will also be installed on these devices to assert deployment of security patches across your environment.

<figure><img src="../../.gitbook/assets/app-deploy-2.png" alt=""><figcaption><p>Update Group Enabled</p></figcaption></figure>

{% hint style="success" %}
In managed packages, group management is handled by the RealmJoin portal, which uses the GUID of each group after creation. This enables the portal to identify the provisioning type associated with each group. As a result, it is possible to establish a prioritization mechanism among groups. This ensures deterministic behaviour in scenarios where a user is mistakenly assigned to multiple provisioning groups.

The prioritization order is (high to low):&#x20;

\[Exclude] - Uninstall - Update - Preview - Available - Required
{% endhint %}

#### Changing Assignments

{% hint style="warning" %}
Users and devices should only be in one RealmJoin managed group at any given time.
{% endhint %}

Users and devices can easily be moved across groups using the Managed Users function.

<figure><img src="../../.gitbook/assets/image (3) (1).png" alt=""><figcaption></figcaption></figure>

Selecting Main, Preview, Available and Uninstall will add the user to the chosen group and remove the user from all other groups relevant to the package.

Selecting Assign will add users to the Main group by default.

### Basic

Basic packages do not have any associated Microsoft Entra groups. You will have to manually assign groups, devices or users.

Groups, devices and users that are assigned to a Basic package will be assigned as Available by default and can be changed using the \[change settings] button.\


<figure><img src="../../.gitbook/assets/image (6) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (7).png" alt=""><figcaption></figcaption></figure>
