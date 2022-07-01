---
description: RealmJoin Ecosystem Change Tracking
---

# v4.19.5

**Beta** - Juky 1st 2022

* Deployment: improve handling of the config file after initial deployment when not restarting or signing out
* LAPS: handle an edge case when an unknown local user is encountered

# v4.19.4
* Deployment: do not initialize Choco when running background installations
* BranchCache: ignore status on CloudPCs
* Deployment: use user authentication for initial deployment on CloudPCs instead of certificate authentication

# v4.19.3
* Telemetry: handle an edge case when a BitLocker volume with an active conversion is currently locked
* Deployment: fixes n/a for BranchCache on deployment screen
* Tray: do not start as SYSTEM or DefaultUser*

# v4.19.2
* Telemetry: handle an edge case when enumerating uninstall entries
* Telemetry: handle an edge case when enumerating credential manager

# v4.19.1
* Deployment: add support for CloudPCs (W365)
* Deployment: add full support for setting `FirstRun.AfterSuccessAction = "None"`
* Internal: optimize HTTP connection handling
* Telemetry: include system-wide environment variables

# v4.19.0
* Deployment: Introduces new templating feature to pre-provision machines
* Backend: Introduces new endpoints for canary and beta channels
* LAPS: Fixes a rare issue when listing unresolvable SIDs

## RealmJoin v4.18.6

**Release** - February 7th 2022

* Fixes complexity issues with password presets 2 and 3
* Fixes a bug which broke the Notifier feature

## RealmJoin v4.18.4

**Beta** - December 21st 2021

* Deployment: Adds version info to OOBE deployment screen

## RealmJoin v4.18.3

* Deployment: Fixes missing BranchCache data in OOBE deployment screen

## RealmJoin v4.18.2

* Deployment: Improves handling of failing software updates
* Deployment: Does not update Choco unless _EnableAutoUpdate_ is set
* Deployment: Allows the deployment screen to be disabled by setting [_DisableDeploymentScreen_](core-features/settings.md#policies.disablenetworklocationwizard)__

## RealmJoin v4.18.0

* Official Version for RJ vNext Backend
* LAPS: supports new persisted _Privileged_ account type
* LAPS: fixes issue with the timezone part of _LastPasswordSet_
* Remote Support: Supports link handler for starting remote support
* Telemetry: includes Windows display version (e.g. 21H2)
* Telemetry: fixes bad _ExecutionCount_ value for Choco packages
* Telemetry: workaround an issue when reading Windows Defender value _TroubleShootingStartTime_
* Internal: updates branding texts

## RealmJoin v4.17.5

**Release** - March 26th 2021

* Deployment screen: fixes display of long names
* App deployment: fixes rare dependency issue with certain dependency graphs
* Logging: cleans up some log messages

## RealmJoin v4.17.5

**Beta** - February 24th 2021

* Deployment screen: fixes display of long names
* App deployment: fixes rare dependency issue with certain dependency graphs
* Logging: cleans up some log messages

## RealmJoin v4.17.3

**Release** - February 5th 2021

* Bitlocker: does not require Bitlocker if machine is ServerRdsh
* Deployment screen: optimizes display of Bitlocker UI
* Auth: handles special refresh\_token condition AADSTS70043
* LAPS: supports EFF wordlist for password generation (preset 3)

### v4.17.1

* Notifications: supports for hyperlinks, disable click through, disable transparency and timestamp
* Local admin reporting: reports all user SIDs and resolve group members recursively
* Main menu: adds a small UI hint to IP addresses when the internet connection is metered

### v4.17.0

* Deployment screen: Adds network statistics to Deployment Screen
* Logging: Dumps ClientID to log on startup

## RealmJoin v4.17.3

**Beta** - January 15th 2021

* Bitlocker: does not require Bitlocker if machine is ServerRdsh
* Deployment screen: optimizes display of Bitlocker UI
* Auth: handles special refresh\_token condition AADSTS70043
* LAPS: supports EFF wordlist for password generation (preset 3)

### v4.17.1

* Notifications: supports for hyperlinks, disable click through, disable transparency and timestamp
* Local admin reporting: reports all user SIDs and resolve group members recursively
* Main menu: adds a small UI hint to IP addresses when the internet connection is metered

### v4.17.0

* Deployment screen: Adds network statistics to Deployment Screen
* Logging: Dumps ClientID to log on startup

## RealmJoin v4.16.18

**Release** - August 28th 2020

* Adds retries on LAPS account creation if the genereted password does not meet complexity requirements
* RealmJoin ESP setting for secondary users

## RealmJoin v4.16.17

**Beta -** August 17th 2020

* Adds retries on LAPS account creation if the genereted password does not meet complexity requirements

## RealmJoin v4.16.16

**Release -** March 10th 2020

* Hotfix: Fixes Notification Issues

## RealmJoin v4.16.15

**Release -** February 28th 2020

### v4.16.15

* Various bugfixes

### v4.16.14

* Adds TPM status reporting

### v4.16.11

* Adds Intune sync to "Sync this device"

### v4.16.10

* Adds Windows credential manager status reporting

### v4.16.9

* Shows "Reconnect to Domain" first on "Change Password" when credentials are missing for whatever reason
* Improves Hi-DPI handling

### v4.16.8

* Adds the software execution feature

### v4.16.7

* Improves notification UI
* Improves evaluation of CredentialManager configuration

## RealmJoin v4.16.7

**Beta -** January 15th 2020

### v4.16.7

* Improves notification UI
* Improves evaluation of CredentialManager configuration

### v4.16.6

* Collects computer language settings in telemetry
* Reduces log output

### v4.16.5

* Fixes an inconsistent user experience when NetBIOS Domain Name contains underscores
* **Adds the notification feature**

### v4.16.4

* Improves handling of HTTP timeouts when backing up the BitLocker recovery key

### v4.16.3

* Fixes a deployment restriction issue

### v4.16.2

* Fixes a deployment phase issue
* Improves Hi-DPI handling

### v4.16.1

* Fixes an issue with LAPS account expirations
* **Improves Hi-DPI handling**

### v4.16.0

* Adds an improved BitLocker implementation
* Fixes some special exit codes by adding --ignore-package-exit-codes to choco calls
* Fixes onPremisesExtensionAttributes Graph data

## RealmJoin v4.15.14

**Release -** September 4th 2019

* Hotfix: Some package types install correctly but RealmJoin reports it as failed
* Hotfix: When installing a package, the environment variables for on-premises extension attributes sourced from Graph API were not set correctly

## RealmJoin v4.15.13

**Release -** [J](https://headwayapp.co/realmjoin-platform-changelog/realmjoin-v4-15-13-104423)une 17th 2019

### v4.15.13

* Adds additional software deployment modes

### v4.15.12

* Changes how DomainConnect credentials are persisted to survive Windows 10 upgrades
* Fixes a bug when disabling DomainConnect

### v4.15.11

* Added **optional software installations after logon**
* Collects more detailed choco log files

### v4.15.10

* Fixed an issue with AppLocker when prefetching packages
* Fixed some minor UI issues

### v4.15.9

* Improved prefetching of packages

### v4.15.7

* Added **AnyDesk** integration
* Added new **password templates for LAPS**
* Support **prefetching packages**
* Fixed a bug when evaluating msDS-UserPasswordExpiryTimeComputed

### v4.15.6

* Collect **workplace join infos**
* Collect logs from Raynet installations
* Added a policy to disable VM detection
* Added **customizable toast UI**

### v4.15.5

* **"Sync this device" button**
* Improved **tracking of installations**
* Added layer for **compatibility with software deployments through Intune**
* Bugfixes

### v4.15.1

* Auth dialog will not prompt anymore because of **seamless auth**
* **Deployment toast Snoozing, Stagged deployment and UX updates**

### v4.15.0

* **New deployment screen**
* **New deployment toast notifications**
* Prepare for new Windows 10 features (requires Fall Creators Update)

## RealmJoin v4.15.12

**Beta -** [J](https://headwayapp.co/realmjoin-platform-changelog/realmjoin-v4-15-13-104423)une 7th 2019

### v4.15.12

* Changes how DomainConnect credentials are persisted to survive Windows 10 upgrades
* Fixes a bug when disabling DomainConnect

### v4.15.11

* Added optional software installations after logon
* Collects more detailed chocolatey log files

### v4.15.10

* Fixed an issue with AppLocker when prefetching packages
* Fixed some minor UI issues

### v4.15.9

* Improved prefetching of packages

## RealmJoin v4.15.7

**Beta -** April 30th 2019

### v4.15.7

* Added **AnyDesk** integration
* Added new **password templates for LAPS**
* Support **prefetching packages**
* Fixed a bug when evaluating msDS-UserPasswordExpiryTimeComputed

### v4.15.6

* Collect **workplace join infos**
* Collect logs from Raynet installations
* Added a policy to disable VM detection
* Added **customizable toast UI**

### v4.15.5

* **"Sync this device" button**
* Improved **tracking of installations**
* Added layer for **compatibility with software deployments through Intune**
* Bugfixes

### v4.15.1

* Auth dialog will not prompt anymore because of **seamless auth**
* **Deployment toast Snoozing, Stagged deployment and UX updates**

### v4.15.0

* **New deployment screen**
* **New deployment toast notifications**
* Prepare for new Windows 10 features (requires Fall Creators Update)

## RealmJoin v4.14.10

**Release -** March 1st 2019

### v4.14.10

* Added Location Shortcut URIs to **Trusted Sites**
* **Improve initial setup experience** to wait for ESP and Windows Hello to finish

### v4.14.8

* **Updated MSAL** library
* Add **network and proxy status** to states

### v4.14.7

* **Extending LAPS** functionality with account expiration/staleness

### v4.14.5

* Enumerate all **local admin accounts into states**

### v4.14.4

* Introducing **"Local Administrator Password Solution" (LAPS)**
* Initial Bitlocker State reported

### v4.14.3

* Switch to new **code siging** certificate.

### v4.14.2

* Tweak initial conditions for **Auto-Setup**.
* Wait for Intune to finish deploying when using **Auto-Setup**.

### v4.14.1

* Group **software list** by Category.
* Resolve **cdn.realmjoin.com** and include in telemetry.

### v4.14.0

* Include **UWP Apps** in telemetry.
* Provide the **user's fax number** to packages.
* Add the **computer name** to security dialog.
* Keep **user parts** of packages with user part hidden.

## RealmJoin v4.14.10

**Beta -** February 14th 2019

### v4.14.10

* Added Location Shortcut URIs to **Trusted Sites**
* **Improve initial setup experience** to wait for ESP and Windows Hello to finish

### v4.14.8

* **Updated MSAL** library
* Add **network and proxy status** to states

### v4.14.7

* **Extending LAPS** functionality with account expiration/staleness

### v4.14.5

* Enumerate all **local admin accounts into states**

### v4.14.4

* Introducing **"Local Administrator Password Solution" (LAPS)**
* Initial Bitlocker State reported

## RealmJoin v4.14.3

**Beta -** December 10th 2018

### v4.14.3

* Switch to new **code siging** certificate.

### v4.14.2

* Tweak initial conditions for **Auto-Setup**.
* Wait for Intune to finish deploying when using **Auto-Setup**.

### v4.14.1

* Group **software list** by Category.
* Resolve **cdn.realmjoin.com** and include in telemetry.

### v4.14.0

* Include **UWP Apps** in telemetry.
* Provide the **user's fax number** to packages.
* Add the **computer name** to security dialog.
* Keep **user parts** of packages with user part hidden.

## RealmJoin v4.13.12

**Release -** August 21st 2018

* Add support for **shared computers** and **secondary-identity deployments**.
* Add **user-part scripts** to choco packages.
* Tag software that is available on **"this device only"**.
* Collect **BranchCache information**.
* **Show Primary User** instead of the user's name in the tray menu.
* Provide software packages with `RJ_PrimaryUserID` and `RJ_PrimaryUserName`.
* Collect **.NET framework information**.
* Provide software packages with `onPremisesExtensionAttributes`.
* **Auto-wrap choco args** command line. No need for `-params` anymore.
* Record more choco package infos on client.
* Add `RJ_CallerIsPrimaryUser` to craft package setup.
* Tweak web link list.
* Fix a minor issue when forcing an update channel.
* WebLinks now recieve more environment variables.

## RealmJoin v.4.13.11

**Beta -** August 10th 2018

* WebLinks now recieve more environment variables.
* Fix a crash when not signed in.

## RealmJoin v4.13.10

**Beta -** July 31st 2018

* Tag software that is available on **"this device only"**.
* Collect **BranchCache information**.
* **Show Primary User** instead of the user's name in the tray menu.
* Provide software packages with `RJ_PrimaryUserID` and `RJ_PrimaryUserName`.
* Collect **.NET framework information**.
* Provide software packages with `onPremisesExtensionAttributes`.
* Add support for **shared computers** and **secondary-identity deployments**.
* Add **user-part scripts** to choco packages.
* **Auto-wrap choco args** command line. No need for `-params` anymore.
* Record more choco package infos on client.
* Add `RJ_CallerIsPrimaryUser` to craft package setup.
* Tweak web link list.
* Fix a minor issue when forcing an update channel.

## RealmJoin v4.12.4

**Release -** June 20th 2018

* Add support for migrating old software packages to new IDs.
* Software packages can now be marked as safe for background installation.
* The backend can now request a log file archive from the client.
* Telemetry now includes the AzureAD and Intune DeviceIDs.
* Prepared for App Store Packages.
* All Users Group.
* Log files are now UTF-8 encoded.
* Lots of Internal optimizations.

## RealmJoin v4.12.4

**Beta -** June 11th 2018

* Add support for migrating old software packages to new IDs.
* Software packages can now be marked as safe for background installation.
* The backend can now request a log file archive from the client.
* Telemetry now includes the AzureAD and Intune DeviceIDs.
* Prepared for App Store Packages.
* All Users Group.
* Log files are now UTF-8 encoded.
* Lots of Internal optimizations.

## RealmJoin v4.11.6

**Release -** March 2018

* Log collection now includes the **chocolatey summary log**.
* Provide user info to user craft packages when running in Auto-Setup.
* Improves read/write of the Delivery Optimization GroupID.

## RealmJoin v4.11.4

**Release -** February 2018

* The "**connect to domain**" dialog had its user experience improved.
* Fixes an issue where some craft package were always marked as "new configuration available".
* On some machines the proxy detection failed when using BranchCache.
* Security enhancements

## RealmJoin v4.11.1

**Release -** January 2018

* Fixes an issue where the TenantID/Name environment variables weren't immediately available to system-scoped packages.
* Security enhancements

## RealmJoin v4.11.0

* Software packages can now be configured to wait for **Intune's compliance**check.

## RealmJoin v4.10.14

* Hotfix: On some machines the proxy detection failed when using BranchCache.

## RealmJoin v4.11.1

* Fixes an issue where the TenantID/Name environment variables weren't immediately available to system-scoped packages.
* Security enhancements

## RealmJoin v4.11.0

* Software packages can now be configured to wait for **Intune's compliance check**.

## RealmJoin v4.10.13

* Provide software installs with **user extensions** from GraphAPI
* Add **extension support** for client telemetry
* Stability improvements

## RealmJoin v4.10.10

* The **ATP state** is now collected for reporting
* Improve display of **IPv6 addresses** in tray menu
* Starting without contacting the **Graph-API** is possible, if required
* A custom **protocol handler** is now registered for RealmJoin
* A set of **new environment variable**s is available to software packages
* **Auto-Setup:** RealmJoin can now auto-setup a new AzureAD-Client! No user interaction is required.
