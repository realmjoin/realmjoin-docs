# Package Configuration and Assignments

{% embed url="https://www.youtube.com/watch?v=BdF3rvMbjFs" %}

## Managed Subscription

Packages subscribed as managed come with managed user groups. There are different types of groups available that can be chosen based on your scenario.

{% hint style="info" %}
Managed packages are the preferred way to deploy software to your users. You can combine it with automated package updates and lifecycle to ensure your users receive latest features and patches.
{% endhint %}

### **Main (Required)**

RealmJoin or Intune will automatically install the application. These applications are mandatory and both solutions will continuously attempt to install the application, if not found on the device.

### **Available**

{% tabs %}
{% tab title="RealmJoin" %}
The application will appear in the RealmJoin Agent tray and will require the user to initiate the download and installation manually.

<figure><img src="../../.gitbook/assets/image (1) (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="Intune" %}
The application will appear in Company Portal -> Apps and will require the user to initiate the download and installation manually.

<figure><img src="../../.gitbook/assets/image (2) (1) (1).png" alt=""><figcaption></figcaption></figure>
{% endtab %}
{% endtabs %}

### Preview

Users and devices in the Preview group will receive the latest version of the package before the other groups. Preview settings are configurable through the [Automation tab](package-details.md#automation).

### Uninstall

RealmJoin or Intune will uninstall the package from the assigned users and devices. Adding a user or device to the Uninstall group will remove them from all other groups.

### Update

The Update group is created on demand. The Update group will automatically onboard loose installations of a software title into management. Devices will be removed from the group when the update is not required anymore. The group is managed by the RealmJoin portal and cannot be modified manually.

Click [**Enable update group**](package-deployment.md#enable-additional-and-restore-default-groups) and a new Entra ID Group with the suffix "(update)" will be created. Software installations will be also assigned to this group. RealmJoin dynamically discovers installed copies of the software that are unmanaged and adds the devices to the group.

Thus, new versions will also be installed on these devices to assert deployment of security patches across your environment.

<figure><img src="../../.gitbook/assets/app-deploy-2.png" alt=""><figcaption><p>Update Group Enabled</p></figcaption></figure>

### Exclude

Needs to be explicitly activated through "More" > "Exclude assignments" (like shown in the [picture below](package-deployment.md#enable-additional-and-restore-default-groups)). Users in the specified group will be excluded from assignments all over the package and associated managed groups.&#x20;

{% hint style="info" %}
This option should only be used in specific cases and is not intended to be used to manage assignment conflicts. You should always manage assignments with clear user to group assignments, without the need of using an exclude mechanic. We strongly advise against multi-layer assignment constructs.&#x20;
{% endhint %}

#### Usage

The Exclude assignment of groups is used to ensure that users in the assigned exclude group are not managed within the package managed groups. It will not remove users from managed groups within the same package. Instead, it makes sure that certain packages are never assigned to the same user simultaneously.&#x20;

For example, you can use the Exclude function to prevent a user, assigned to a 64-bit Adobe Reader package group, from also receiving the 32-bit version. Simply assign the used 64-bit package group as an exclude to the 32-bit package. &#x20;

{% hint style="warning" %}
In managed packages, group management is handled by the RealmJoin Portal, which uses the GUID of each group after creation. This enables the portal to identify the provisioning type associated with each group. As a result, it is possible to establish a prioritization mechanism among groups. This ensures deterministic behavior in scenarios where a user is mistakenly assigned to multiple provisioning groups.

The prioritization order is (high to low):&#x20;

Uninstall - \[Exclude] - \[Update] - Preview - Available - Required
{% endhint %}

### Enable additional and restore default groups

<figure><img src="../../.gitbook/assets/image (43) (1).png" alt=""><figcaption></figcaption></figure>

Via the "More"-Button you can activate the optional update group, manage exclude assignments and also restore the default managed groups in case they were deleted.&#x20;

### Changing Assignments

{% hint style="warning" %}
Users and devices should only be in one RealmJoin managed group at any given time.
{% endhint %}

Users and devices can easily be moved across groups using the _Managed users_ function.

<figure><img src="../../.gitbook/assets/image (3) (1) (1).png" alt=""><figcaption></figcaption></figure>

Selecting Main, Preview, Available and Uninstall will add the user to the chosen group and remove the user from all other groups relevant to the package.

Selecting Assign will add users to the Main group by default.

## Basic Subscription

Basic packages do not have any associated Microsoft Entra groups. You will have to manually assign groups, devices or users.

Groups, devices and users that are assigned to a Basic package will be assigned as Available by default and can be changed using the \[change settings] button.

<figure><img src="../../.gitbook/assets/image (6) (1) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (7) (1) (1).png" alt=""><figcaption></figcaption></figure>
