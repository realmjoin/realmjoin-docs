---
description: >-
  AnyDesk configuration for RealmJoin: host the end-user client on a public URL
  and request the supporter client as a custom package.
---

# AnyDesk configuration

## Deploy AnyDesk clients

In short, the following actions are required:

* **host end-user client** on a publicly available URL and **add to RealmJoin**
* request **supporter client** as **custom RealmJoin package**

### End-User client

Please host the end-user client on a **publicly available URL**. You can use [**RealmJoin's Workplace Cloud Storage Solution**](../../../realmjoin-settings/workplace-cloud-storage.md) for this, but it is not required.

{% hint style="warning" %}
A direct (public available) download from my.anydesk.com is not supported as it might be protected by services like Cloudflare.
{% endhint %}

**Download** the current end-user client from your my.anydesk.com instance and **host** it using a service provider of your choice (Azure, AWS, ...). The only requirement is that the URL must be **publicly reachable** without any authentication.

Afterwards, please update the AnyDesk configuration in RealmJoin with the new URL as stated in the [section below](customer-tasks.md#group-settings-for-end-user-client).

{% hint style="warning" %}
Note, that **you are** **responsible** for **updating the version on a regular basis.**
{% endhint %}

#### Hosting the end-user client using RealmJoin WCS

If you choose to host it using **RealmJoin's Workplace Cloud Storage Solution**, please first ensure the [feature is set up correctly](../../../realmjoin-settings/workplace-cloud-storage.md#setup). Then simply go to [https://portal.realmjoin.com/organization/other-files](https://portal.realmjoin.com/organization/other-files), upload your **EXE** and _copy the link_ and use that URL for the [configuration setting](customer-tasks.md#group-settings-for-end-user-client).

<figure><img src="../../../.gitbook/assets/image (28) (1).png" alt=""><figcaption></figcaption></figure>



### Supporter client

Please download your current supporter client (as MSI) and request it as a new RealmJoin software package via the package request formular under [portal.realmjoin.com](https://portal.realmjoin.com).

<figure><img src="../../../.gitbook/assets/image (29) (1).png" alt=""><figcaption></figcaption></figure>

Once the package is ready assign it to the desired users/supporters. Old AnyDesk versions will be uninstalled automatically.

{% hint style="warning" %}
Note, that **you are responsible** for **updating the custom client** and **request updated versions** of your **package on a regular basis**.
{% endhint %}

{% hint style="danger" %}
The RealmJoin package "AnyDesk Custom Client" (also known as "AnyDesk Supporter Client Setup Launcher") is no longer supported (announced in February 2025). Please use the new process stated above and delete the old package.
{% endhint %}

## Group settings for end-user client

Use a JSON policy to **configure AnyDesk in the group settings**. The following two JSON's contain all configurations:

**Key**: Integration.AnyDesk\
**Value**:

```json
{
  "Enabled": true,  # activate integration
  "BootstrapperUrl": "https://xxxx/AnyDeskEndUser.exe", # public download URL
  "CustomClientSuffix": "xxxxxxx", # custom client suffix (see my.anydesk.com)
}
```

<figure><img src="../../../.gitbook/assets/image (1) (3).png" alt=""><figcaption></figcaption></figure>

**Key**: Integration.AnyDesk.Ui\
**Value**:

```json
{
  "TrayMenuTextEnglish": "Start remote session" # optional: change text in tray menu
}
```

<figure><img src="../../../.gitbook/assets/image (1) (3) (1).png" alt=""><figcaption></figcaption></figure>

## Back-End Integration

To enable the backend integration the following information is required:

* **AnyDesk License ID**
* **AnyDesk API Password**
* **Custom Client Prefix**

Send this information to [RealmJoin support](mailto:support@realmjoin.com) to have the integration activated.

![Overview in the portal](<../../../.gitbook/assets/image (196).png>)
