# AnyDesk Integration

AnyDesk allows access to devices including the option to elevate rights by using the RealmJoin [LAPS](../local-admin-password-solution-laps/) feature. AnyDesk can be installed on Windows and macOS.

ID numbers are used by AnyDesk to establish a connection between two computers. Share your ID number with another user (this user needs AnyDesk as well). This user has to enter the ID number in the AnyDesk menu. When you accept the request, the other user will have access to your desktop.

RealmJoin Client for Windows allows to skip the ID number sharing because every ID number in an organization is linked to a single device. An administrator just needs to know the device and can request access to the desktop. However the user has to accept this request, depending on the configuration.

## Deployment Workflow

1. Order a license from AnyDesk.
2. Configure AnyDesk to your desired configuration in the AnyDesk Webinterface and create your custom clients.
3. Configure the AnyDesk Group Settings in [RealmJoin Portal](https://portal.realmjoin.com).
4. [Contact RealmJoin support](mailto:support@glueckkanja.com) to enable the backend integration.

## Using the Tray Icon (Windows)

Once everything has been set up, the tray icon can be used to get support without sharing the ID number or downloading executables by hand. The users are instructed by their support agent to open the tray menu and click _Start remote session_.

{% hint style="info" %}
This text can be changed! Create a setting with the key `Integration.AnyDesk.Ui.TrayMenuTextEnglish` in the backend.
{% endhint %}

![](../../../../.gitbook/assets/anydesk-tray-client-windows.png)

This will download the appropriate executable and send the ID number to the RealmJoin Portal. The support agent will be notified as soon as the process is finished and then may connect to the user's desktop.

### Using this outside of the tray menu

This process may also be initiated outside of RealmJoin's UI. Simply create a Windows shortcut with the target `realmjoin:remotesupport:default`. This will trigger RealmJoin and behave as if the user had clicked the menu entry.
