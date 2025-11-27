# AnyDesk Integration

AnyDesk provides access to devices, including the ability to elevate rights using the RealmJoin [LAPS feature](../local-admin-password-solution-laps/). It can be installed on both Windows and macOS devices.

To establish a connection between two computers, AnyDesk uses ID numbers. Share your ID number with another user (who also needs AnyDesk). The other user will enter your ID number in the AnyDesk menu. Once you accept the connection request, they will have access to your desktop.

The RealmJoin Client for Windows eliminates the need to share ID numbers, as each device in an organization is linked to a unique ID. Administrators can request access to a desktop simply by identifying the device. However, depending on the configuration, the user must still accept the access request.

## Deployment Workflow

Please follow [AnyDesk configuration](customer-tasks.md). Steps in short:

1. Order a license from AnyDesk.
2. Tailor your AnyDesk settings and create custom clients for end-users and supporters by configuring them at my.anydesk.com.
3. Host the end-user client and configure the AnyDesk group settings in [RealmJoin Portal](https://portal.realmjoin.com).
4. Request your custom supporter client as RealmJoin package.
5. [Contact RealmJoin support](mailto:support@glueckkanja.com) to enable the backend integration.

## Start Remote session using tray Icon (Windows)

Once everything has been set up, the tray icon can be used to get support without sharing the ID number or downloading executables by hand. The users are instructed by their support agent to open the tray menu and click _Start remote session_.

{% hint style="info" %}
This text can be changed! Create a setting with the key `Integration.AnyDesk.Ui.TrayMenuTextEnglish` in the backend.
{% endhint %}

![](../../../.gitbook/assets/anydesk-tray-client-windows.png)

This process downloads the appropriate executable and sends the ID number to the RealmJoin Portal. The support agent can then view the ID under device details and connect to the user's desktop.

### Trigger Start Remote Session via shortcut

This process may also be initiated outside of RealmJoin's UI. Simply create a Windows shortcut with the target `realmjoin:remotesupport:default`. This will trigger RealmJoin and behave as if the user had clicked the menu entry.
