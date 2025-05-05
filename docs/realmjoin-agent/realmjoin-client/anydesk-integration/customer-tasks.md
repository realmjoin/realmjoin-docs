# AnyDesk configuration

## Deploy AnyDesk clients

In short, the following actions are required:

* **host end-user client** on a publicly available URL and **add to RealmJoin**
* request **supporter client** as **custom RealmJoin package**

### End-User client

Please host the end-user client on a **publicly available URL**. You can simply use **RealmJoin's Workplace Cloud Storage Solution** for this.

{% hint style="warning" %}
A direct (public available) download from my.anydesk.com is not supported as it might be protected by services like Cloudflare.
{% endhint %}

**Download** the current end-user client from your my.anydesk.com instance.

{% hint style="warning" %}
Note, that **you are** **responsible** for **updating the version on a regular basis.**&#x20;
{% endhint %}

Simply go to [https://portal.realmjoin.com/organization/other-files](https://portal.realmjoin.com/organization/other-files), upload your **EXE** and _copy the link_:

<figure><img src="../../../.gitbook/assets/image (28).png" alt=""><figcaption></figcaption></figure>

Afterwards, please update the AnyDesk configuration in RealmJoin with the new URL as stated in the [article below](customer-tasks.md#anydesk-group-settings-for-user-client).

### Supporter client

Please download your current supporter client (as MSI) and request it as a new RealmJoin software package via the package request formular under [portal.realmjoin.com](https://portal.realmjoin.com).

<figure><img src="../../../.gitbook/assets/image (29).png" alt=""><figcaption></figcaption></figure>

Once the package is ready assign it to the desired users/supporters. Old AnyDesk versions will be uninstalled automatically.

{% hint style="warning" %}
Note, that **you are responsible** for **updating the custom client** and **request updated versions** of your **package on a regular basis**.&#x20;
{% endhint %}

{% hint style="danger" %}
The RealmJoin package "AnyDesk Custom Client" (also known as "AnyDesk Supporter Client Setup Launcher") is no longer supported (announced in February 2024). Please use the new process stated above and delete the old package.&#x20;
{% endhint %}

## Group settings for end-user client

Use a JSON policy to **configure AnyDesk in the group settings**. The following JSON contains all configurations:

**Key**: Integration.AnyDesk\
**Value**:

```json
{
  "Enabled": true,  # activate integration
  "BootstrapperUrl": "https://xxxx/AnyDeskEndUser.exe", # public download URL
  "CustomClientSuffix": "xxxxxxx", # custom client suffix (see my.anydesk.com)
  "TrayMenuTextEnglish": "Start remote session" # optional: change text in tray menu
}
```

<figure><img src="../../../.gitbook/assets/image (4).png" alt="" width="539"><figcaption></figcaption></figure>

## Back-End Integration

To enable the backend integration the following information is required:

* **AnyDesk License ID**
* **AnyDesk API Password**
* **Custom Client Prefix**

Send this information to [RealmJoin support](mailto:support@realmjoin.com) to have the integration activated.

![Overview in the portal](<../../../../.gitbook/assets/image (187).png>)

