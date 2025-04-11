# AnyDesk configuration

## AnyDesk Group Settings for User Client

Use a JSON policy to configure AnyDesk in the Group Settings. There are three different policies to configure AnyDesk.

The following JSON contains all configurations:

**Key** = Integration\
**Value** = `{"AnyDesk: { "Enabled": true, "BootstrapperUrl": "https://.../.../AnyDesk.exe", "Ui": {TrayMenuTextEnglish": "Start remote session} } }`

{% hint style="danger" %}
Please make sure that you host your AnyDesk file(s) yourself on a publicly available URL and put this URL as "BootstrapperURL" in your configuration. \
The suggested way to do so is by using RealmJoin's Workplace Cloud Storage solution: \
[https://docs.realmjoin.com/realmjoin-settings/workplace-cloud-storage](https://docs.realmjoin.com/realmjoin-settings/workplace-cloud-storage)
{% endhint %}

It is also possible to split this single JSON from above, in three different JSON policies:

**Key** = Integration.AnyDesk.Enabled\
**Value** = true

and

**Key** = Integration.AnyDesk.BootstrapperUrl\
**Value** = `https://.../.../AnyDesk.exe`

and

**Key** = Integration.AnyDesk.UI.TrayMenuTextEnglish\
**Value** = "Start remote session"

The following JSON is possible as well:

**Key** = Integration.AnyDesk\
**Value** = `{"Enabled":true, BootstrapperUrl": "https://.../.../AnyDesk.exe", "UI":{"TrayMenuTextEnglish": "Start remote session"} }`

## Back-End Integration

To enable the backend integration you will need your **AnyDesk License ID**, your **AnyDesk API Password** and the **Custom-Client-Prefix**. Send these to the [RealmJoin support](mailto:support@realmjoin.com) to have the backend integration activated.

![Overview in the portal](<../../../../.gitbook/assets/image (187).png>)

