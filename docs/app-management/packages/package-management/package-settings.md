---
description: This page details the different settings available for deployed packages
---

# Package Settings

### Automation

<figure><img src="../../../../.gitbook/assets/image (219).png" alt=""><figcaption><p>Package Automation</p></figcaption></figure>

For managed packages, you can use the Automation tab to configure automatic publishing of new version of packages from the package store to your environment.

* **Automate Main Channel** - Automatically deploy new versions of this package to your users. ("Main" subscription)
* **Automate Preview Channel** - Automatically deploy new versions of this package to your pilot users. ("Preview" subscription)

{% hint style="info" %}
The Preview Channel will only advance to a newer software version after deploying the current version in Preview to the Main Channel.&#x20;

This is intended behavior to ensure that a testing / review process using the Preview Channel is not accidentally invalidated by a newer software version entering Preview.
{% endhint %}

The Preview Channel will take the newest version available from the App Store pushing its current version to the main channel.

{% hint style="success" %}
Recommendation:&#x20;

* Automate only **Main Channel** for software that can upgrade without prior testing, like web browsers from major vendors.
* Automate only **Preview Channel** for software you want to test before deploying. Push the validated version to Main Channel after testing and start testing the next version in Preview.

You can always manually push a newer version available in Package Store directly to **Preview** or **Main Channel** to skip a version you don't want published.
{% endhint %}

* **... defer X days** - Wait for this number of days to pass before publishing a new version to the channel. This is useful to avoid stress for users/clients if multiple package versions are published rapidly.
* **Deploy At Night** - Schedule automatic deployment during nighttime
* **Select target timezone** - If you use **Deploy At Night**, use this Time Zone to indicate when "at night" is.

These values can be globally preconfigured for newly imported packages in [Settings](../../../realmjoin-settings/settings.md). Configuring them on a per package basis will overwrite the global defaults.



### Config

<figure><img src="../../../../.gitbook/assets/image (315).png" alt=""><figcaption><p>Package Config</p></figcaption></figure>

#### Technical Application Owners

You can assign multiple **Technical Application Owners** (TAO) to a package by storing their email-address to reach out. This is optional and currently is purely for information/administrative purposes.&#x20;

You need to **enable** the switch below TAOs to subscribe to changes/updates.&#x20;

#### Arguments

**Arguments** allow you to pass command line switches to an application installation. This is commonly used to define language options or license key that need to be present at installation time.

Some packages include **Technical Help**, to explain possible **Arguments** and other Requirements.

![Technical Help for a Package](<../../../../.gitbook/assets/image (47).png>)

#### Expert Settings

{% hint style="info" %}
RealmJoin App Deployment and Agent required
{% endhint %}

The RealmJoin Client packages allow **Expert Settings** which modify an app's deployment behavior. These can be reached via the **Config** tab.

<figure><img src="../../../.gitbook/assets/image (5).png" alt=""><figcaption><p>Expert Settings</p></figcaption></figure>

