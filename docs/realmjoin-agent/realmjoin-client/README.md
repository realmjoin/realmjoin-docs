# Features

RealmJoin Agent is an optional component that you can use alongside RealmJoin Portal on Windows 10/11 clients. It enables additional features such as:

* [RealmJoin ESP](realmjoin-esp.md)
* [RealmJoin Application / Configuration Deployment and Lifecycle](../../app-management/packages/package-store/package-store-details.md#realmjoin-deployment)
* [Local Admin Password Solution (LAPS)](local-admin-password-solution-laps/)
* [Notifications](showing-notifications.md)
* [AnyDesk Integration](anydesk-integration/)
* Audit tasks (collecting device/client information)
* Advanced Telemetry

## Compliance Checks

RealmJoin uses the **user identity** and checks it at a Cloud-Service for an **Extended Policy** and optionally for a **Secondary Identity**, then the RealmJoin Security Assessment **checks if the system is qualified** (Encryption, Patch Level, Firewall, Anti-Virus, etc. - optionally, an Intune-Health-Check may be sufficient). If the user's device is eligible **software- and configuration-Policy** will be applied (Mandatory Applications, etc.).

This can trigger[ package installations](deploy-apps.md#package-installation) and the display of[ RealmJoin's own ESP ](realmjoin-esp.md)page.

## Processes

RealmJoin is responsible for two different processes running on the device:

* The **`realmjoin.exe`** process is started up automatically on Logon. The process is always running and sends upstream data every 15 minutes.
* The **`realmjoinservice.exe`** is called when a package requires the **SYSTEM mode** to be processed. It is not running by default.

