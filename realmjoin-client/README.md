# RealmJoin Client

## Overview

RealmJoin Client is an optional component that you can use alongside RealmJoin Portal on Windows 10/11 clients. It enables additional scenarios, like

* [Local Admin Password Solution (LAPS)](local-admin-password-solution-laps/)
* [Notifications ](notifications.md)
* [AnyDesk integration](anydesk-integration/)
* Invetory tasks (collecting device/client information)

It can also be used to deploy windows software and configurations that that can not be easily delivered using MS Endpoint Manager / Intune.

## Compliance Checks

RealmJoin uses the **user identity** and checks with it at a Cloud-Service for an **Extended Policy** and optionally for a **Secondary Identity**, then the RealmJoin Security Assessment **checks if the system is qualified** (Encryption, Patch Level, Firewall, Anti-Virus, etc. - optionally, an Intune-Health-Check may be sufficient). If the user's device is eligible **software- and configuration-Policy** will be applied (Mandatory Applications, etc.).

This can trigger[ package installations](notifications.md#package-installation) and the display of[ RealmJoin's own ESP ](realmjoin-esp.md)page.

## Processes

RealmJoin is responsible for two different processes running on the device:

* The **realmjoin.exe** process is started up automatically on Logon. The process is always running and sends upstream data every 15 minutes.
* The **realmjoinservice.exe** is called when a package requires the **SYSTEM mode** to be processed. It is not running by default.

