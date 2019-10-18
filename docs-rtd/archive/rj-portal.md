
# RealmJoin Portal

Device provisioning and RealmJoin configuration is done with the RealmJoin portal. Designed to mirror the style of the new Microsoft administration services,it is the main tool for the management of the RealmJoin clients and users. The web application can be reached under <https://realmjoin-web.azurewebsites.net/> or the beta version under <https://realmjoin-web-staging.azurewebsites.net/>.

[![RJ Dashboard](./media/rj-ac-dashboard.png)](./media/rj-ac-dashboard.png)  

The dashboard provides a quick and beneficial overview. All sections can be accessed by either clicking on the corresponding number or selecting the section in the toolbar on the left.  

## Roles

There are four different roles available for the RealmJoin portal:
  
- Administrator
- Auditor
- Supporter
- Software Agent

### Administrator

A RealmJoin administrator has full rights within the RealmJoin portal.

### Auditor

An auditor has read-only rights within the RealmJoin portal and has access to all settings and assignments.

### Software Agent

A software agent can assign software to users and can change it as well and the software agent has can subscribe the RealmJoin app store. Additionally, a software agent has access to users, clients, groups, software and app store. With these role it is not possible to use AnyDesk and LAPS and it is not possible to reassign primary users.

### Supporter

A supporter can not manage RealmJoin software. A supporter has access to users, clients and groups (reassign primary users as well). Furthermore, a supporter has the possibility to use AnyDesk and LAPS.

## Clients

![RJ clientsicon](./media/rj-ac-clientsicon.png)

The clients tab gives you a transparent overview over all enrolled devices as well as the respective primary user. To enter the devices' states (see section [States](http://docs.realmjoin.com/managing-realmjoin.html#states)) or associate users, just click on the green numbers on the right.  
In this details you find two JSON files with basic information about the client and the primary user. It is possible change the primary device user if there is an inconsistency between the Azure and the RealmJoin portal. This might happen if a device is not correctly reset and issued to a new user afterwards.  
Client:  

```JSON
{
  "id": 3714,
  "clientID": "f19c3d1a-75e3-0000-afe9-f8d3da72e2f1",
  "firstSeen": "2017-09-26T08:10:46.3211008",
  "lastSeen": "2018-03-20T14:50:25.4933509",
  "lastMachineName": "DESKTOP-B0815",
  "lastVersion": "4.11.6+25493.9f206a6d",
  "primaryUserID": 6325,
  "primaryUserName": "Test@test.onmicrosoft.com",
  "stateCount": 7242,
  "userCount": 0
}
```

Primary User:  

```JSON
 {
  "id": 6325,
  "userID": "3239d4dd-0000-0000-90d6-611a7fd93dba",
  "userName": "Test@test.onmicrosoft.com",
  "graphUser": {
    "displayName": "testuser",
    "department": null,
    "jobTitle": null,
    "mail": "Test@test.onmicrosoft.com",
    "city": null,
    "officeLocation": null,
    "businessPhones": [],
    "mobilePhone": null
  }
}
```

> [!NOTE]
> It is important to understand, that the userID is equal to the userID from the Azure identity management, while the clientID is the ID Windows submits during the installation and **NOT** equal to the clientID in Azure/Intune.

## Users

![RJ rj-ac-usersicon](./media/rj-ac-usersicon.png)

**A list of all users assigned to the tenant.** The selectable details on the right include states, group membership, installed software packages, client devices and (to come...) individual settings.  
Users can not be added or assigned to groups using RealmJoin, the management of users and groups has to be done in Azure AD.
Selecting an user opens up the users detail page, which contains information gathered by RealmJoin using the Microsoft Graph API.

## User settings

![RJ usersettingsicon](./media/rj-ac-usersettingsicon.png)

**Configurable group settings and policies**. See chapter [Settings and Policies](policies.md) for a list of implemented features. See section [Group Settings](http://docs.realmjoin.com/managing-realmjoin.html#group-settings) for a detailed description on configured policies.

## Groups

![RJ rj-ac-groupsicon](./media/rj-ac-groupsicon.png)

**All in this tenant registered user groups**. RealmJoin synchronizes groups from Azure Active Directory into the RealmJoin back-end. The details on the right contain users within the individual group, packages that are assigned to a group as well as group settings.  
Since not all users in Azure AD might be equipped with RealmJoin, only a specified range of groups are transferred into RealmJoin (depending on the group name). The groups can not be added or altered within RealmJoin, therefore the group naming conventions have to be established in advance.

While there are not strict naming pattern requirements in RealmJoin, we recommend the following convention:
  
```
*APP|CFG - Location-[Vendor-Product-Language-Type-Flavor]*  
```

**Examples:**

```
CFG - Global-Core  
CFG - DE-Core  
CFG - DE7499-Core  
APP - Adobe-Photoshop  
APP - Microsoft-Visio  
APP - Mozilla-Firefox  
APP - Mozilla-Firefox-PreRelease  
APP - Mozilla-Firefox-Optional  
APP - Mozilla-Firefox-Optional-PreRelease  
APP - Mozilla-Firefox-x86  
APP - Mozilla-Firefox-x64  
APP - Mozilla-Firefox-DE7499  
APP - Mozilla-Firefox-withFlash  
```
  
The standard synchronization time is 20 minutes (hh:00, hh:20, hh:40 and all groups that start with **APP -** or **CFG -** are taking into consideration.  
The synchronization time schedule and the prefixes that are taken into account can be adjusted, currently only on request. Groups will not be deleted from the RealmJoin back-end, if they are removed in Azure/Intune.

> [!NOTE]
> The **RealmJoin - All Users** group is automatically created, which contains all users with a RealmJoin installation on at least one of their clients.  

## Group settings

![RJ rj-ac-groupsettingsicon](./media/rj-ac-groupsettingsicon.png)
  
**Configurable group settings and policies.** See chapter [policies](http://docs.realmjoin.com/policies.html#other-configuration-settings) for a list of implemented features.  
To change a policy, you have to first select the group, and then select the group settings number on the right.  
This will open the group settings web page with a filter on the selected group, allowing to create policies for this group. To configure a policy, add the tree path in the **key** field and the setting in the **value** section, e.g.:  
```Policies.SetCurrentUserAdministrator```  
```true```  
to set an user or the users within the group to local administrators or set Key ```WebLinks``` with the following Value:

```JSON
[
  {
    "Name": "RealmJoin",
    "Target": "https://realmjoin.com",
    "Platform": "any"
  },
  {
    "Name": "Google",
    "Target": "https://google.com",
    "Platform": "any"
  }
]
```

This creates new links available in the RealmJoin client tray. The created settings overwrite all default values.

## Software Packages

![RJ rj-ac-packagesicon](./media/rj-ac-packagesicon.png)

**A list of all added packages.** The detail list contains the package version, install order, auto upgradeability and user/group assignment.

### Add packages

The administrator is able to add created craft and Chocolatey packages to RealmJoin using the **Add Choco** / **Add Craft** buttons. This open the package setup window.
  
[![RJ rj-ac-packages](./media/rj-ac-packages.png)](./media/rj-ac-packages.png))
  
There are two ways to add the necessary information:

* Entering the required fields **Name**, **Version**, **Chocolatey Package ID** (Chocolatey packages only), **ID** (Chocolatey Package ID and ID are usually similar), **Location**, **Hash** and **Scope** (all three craft packages only) manually.

* Pasting the JSON code, which can be found in the corresponding package repository (pipeline).  
  
[![RJ package-json-pipeline](./media/rj-package-json.png)](./media/rf-package-json.png)

While adding a package the following configuration entries are available:

- Name  
  * The **name** under which the package is listed in the client and RealmJoin admin console. Otherwise not used as an unique identifier.
- GroupName  
  * An optional group name may be entered. This name has no connection to the user groups, instead it will be shown in the RealmJoin client context menu to group the depicted applications.
- ID  
  * The RealmJoin internal name of the package, for example **generic-videolan-vlc**.
- DependsOn
  * The **DependsOn** option is used to indicate if a package needs another package to be installed to work properly. This may be the case for Office user setting packages, that require an office installation upfront. It is possible to hide packages, so that the client context menu only shows one installation option (see section **Package Assignment**), but all involved packages have to be assigned to the user group for dependencies to work.  
  For a working correlation, the correct package name has to be provided.
     If there is a multiple level-dependency, RealmJoin takes this into consideration. Before the installation process, all dependency-related packages are sorted (also including mandatories) and installed afterwards. The following images show the assignment of package dependency for the Chocolatey package **Microsoft Office 2016 ProPlus**, which will be installed with user settings:

     [![RJ package-dependency](./media/rj-ac-package-dependency.png)](./media/rj-ac-package-dependency.png)

     The user setting package **Microsoft Office 2016 ProPlus ML UserSettings** is assigned as usual, with the ID of the parent package **generic-microsoft-office-2016-proplus** entered as **DependsOn**. During the installation process in the RealmJoin client, RealmJoin understands the need of the **generic-microsoft-office-2016-proplus** package and installs the deployed version of it first.

    [![RJ dependency-installation](./media/rj-install-dependent.png)](./media/rj-install-dependent.png)

    RealmJoin takes 1:n dependency into account. It is possible to add more than one dependency using the syntax:

     ``["package-id-1","package-id-2"]``

- Order
  * The order number is an Int32 type figure and provides RealmJoin with a basic structure to determine the package installation sequence. The lower the number the higher the importance, therefore a 10 will be installed before 100.  
    It has to be noted that a 0 is translated to **no sequence given** and the order number is only taken into account at the first roll out.
- Args
  * If the packaged software has to be installed with arguments. If the package to be deployed is a Chocolatey package, make sure to use the prefix **-params** and correct escaping, since Chocolatey might mistake the arguments to be directed to it, for **craft** packages, the arguments can just be added.  
  It has to be noted, that it is also possible to provide arguments in the package assignment stage (see section below). Globally relevant parameters (e.g. volume license number) should be provided at the package addition step, while more individualized arguments (e.g. language packs) are better specified during the assignment step.  

> [!NOTE]
> Do not use the **dependency** and **order** option on **mandatory** packages parallel. This might prevent the back-end from correctly resolve the order installation:
During the initial rollout, or any rollout of mandatory packages after a login for this purpose, RealmJoin in the first step resolves all dependencies of the packages. If there are any, all packages which are listed as a dependency for a different package are installed.  
In the second step, the original packages are installed. This may cancel out any order numbers.  
E.g.: Package A, order 1. Package B, order 101 and depending on Package C, order 100. If all packages are assigned as mandatory, the installation sequence will be C - A - B.  
  
- Version
  * Version of the package to be installed (for conventions of the version numbering see chapter **Packages**).
- Chocolatey Package ID (Chocolatey packages only)
  * Exact Chocolatey repository name of the package to be installed. The combination of name and version is used ensure that the correct package is installed. Usually similar to the internal RealmJoin **ID**.
- Location (craft only)
  * Location of the package on the back-end.
- Hash (craft only)
  * Hash of the package  
- Scope
  * Craft packages might be installed in the **user** or **system** scope.  

Options:  
- Availability
  * **Allow Reinstall**: This option allows the client user to reinstall and therefore override their current installation of the package. In case of **craft** type packages, the **craft** scripts are re-run.  
  * **Allow Background Install**: The software package may be installed outside of the **black screen** installation, thus not blocking the access to the clients desktop and software.  
  * **Pre-Release**: The pre-release flag as two distinctive features within RealmJoin. It allows:
    a) to add a package with ID and version similar to another existing package in the portal and  
    b), if assigned to a group or user, overwrites all other packages with the same ID assigned to the group or user.  
Those features are usually used for the testing of new packages or updates of existing one: The test-groups or test-users get the pre-release version of a package assigned during the testing.
  
> [!Note]
> Under normal circumstance it is highly advised to prevent a normal user having the same package assigned more than once.

  * The pre-release flagged package is visually highlighted in the portal's package list with an lightning symbol behind the name.

  * **Require Intune Compliance (BETA)**: The package is installed, as soon as RealmJoin is able to verify via the GraphAPI that the machine is considered compliant. This might stop the rollout for some time. The installation of the package, and therefore all other mandatory packages with higher order numbers that are queued to be installed afterwards, is resumed when the client is compliant.

- Auto Upgrade
  * The **Auto Upgrade** feature may be enabled to automatically update the package if a new version is assigned in RealmJoin. If not chosen, the user has to manually select the package to be upgraded. The automatic upgrade does apply to mandatory and non-mandatory packages.

- Staggered Deployment
  * It is possible to use staggered deployment and distribute the risk of updating a software if desired. The two parameters needed are the target date and the amount of days over which the update should take place.
    The clients are not equally distributed in the deployment groups,with fewer deployments in the first part of the timeline and the majority on the last.
    Deployed package versions for each can be found in the user details of the package or the deployed package details of the users.
    Example distribution for n = 10000 and 8 days update time:

    [![RJ autoupdate_sim](./media/rj-autoupdate_sim.png)](./media/rj-autoupdate_sim.png)
  
> [!NOTE]
> To change package name or ID is not a proper way to edit assigned packages. Add a new package instead. Delete the obsolete one.

### Advanced Options

With RealmJoin version 4.13 a new feature was published: Support of multi user devices. To represent these scenarios within the RealmJoin, advanced options are available when configuring a package.

[![RJ advanced options](./media/rj-assign-advanced.png)](./media/rj-assign-advanced.png)

To access this plane, press the **Show Advanced Options** button on the right. All new options will be available:

- **Includes User Script**  
  * In the latest generation of packages, it is not necessary anymore to create a second package for the deployment of corresponding user settings, but such a script can be part of the main package. If this is the case, it will be run automatically if this options is checked. Parameters can be transferred via arguments as established. User scripts will not run for secondary users if the main application is not installed.
- **Main Script Restrictions**: Users
  * This option allows the RealmJoin administrator to define whether this package should run for just the primary device user (default) or also/exclusively for secondary users.  
- **Main Script Restrictions**: Phases  
  *  This options allows the RealmJoin administrator to define whether this package should be run during the initial provisioning of the device or during other phases.  

### Duplicate a package

Whenever a package with identical content is needed multiple times for the same user or group, the RealmJoin portal offers the possibility to use the same package multiple times while preventing conflicting installations.  

A possible scenario: One user group needs the same package with different arguments (for example to map several network drives) and the RJ-Client requires unique package IDs.

- Notation
  * To make the ID unique, a hash is written behind the ID and provided with a meaningful word/index, for example **package-id#Value**.  

[![RJ rj-duplicate-packages](./media/rj-duplicate-packages.png)](./media/rj-duplicate-packages.png)

### Assign Packages

Similar to the profile management with Microsoft Azure AD, packages can be assigned to groups and individual users. To assign a package, enter the group or user detail for the package in the package control panel.
There are four options to override the package configuration when assigning, if in conflict with the package settings, the assignment settings override:

- Availability
  * Packages can be labeled as **mandatory** to make the software package non-optional.
  * Packages might also be labeled as **hidden**, making them invisible in the RealmJoin client context menu. This might be used for mandatory software or for multiple level dependencies, when the user should only be able to install the highest hierarchy and the underlying packages should be installed automatically.  
- Auto Upgrade
  * In addition to the configuration of the package itself (see section above for the feature description), **auto upgrade** can be enabled for the selected group / user individually.
- Staggered Deployment
  * In addition to the configuration of the package itself (see section above for the feature description), **staggered deployment** can be enabled for the selected group / user individually.
- Args
  * In addition to the configuration of the package itself (see section above for the feature description), **Args** can be set for the selected group / user individually.
- Advanced Options  
  * See section [advanced options in the "Add Packages" section](http://docs.realmjoin.com/managing-realmjoin.html#advanced-options).

[![RJ rj-ac-packageoverrides](./media/rj-ac-packageoverrides.png)](./media/rj-ac-packageoverrides.png)

## Application Resources

There are several ways to provide the applications for the distribution via RealmJoin. The RealmJoin infrastructure allows to choose from three approaches, depending on the individual packaging needs of every application.

### Create the package

With the RealmJoin infrastructure and the light-touch approach to packaging, it is possible for each customer to have a dedicated packaging team and create packages as needed. The process of creating packages is described in the [corresponding chapter](http://docs.realmjoin.com/managing-realmjoin.html#states) of this documentation.  

### Subscribe from the AppStore

Glück & Kanja offer an ever-expanding library of already packaged up-to-date applications for uncomplicated rollout.  
The enabled RealmJoin administrator can subscribe to the desired applications, which will be instantly available for distribution.  
The shopping cart icon will open the AppStore. A complete list of all applications and currently available versions is shown, that might be filtered by name.  

![RJ AppStore](./media/rj_app_store_menu.PNG)  

Selecting a application will show some basic information and offer the possibility to subscribe, therefore adding it in your own software library and assign it to groups and users.  

[![RJScreen4.15](./media/rj-ui1.png)](./media/rj-ui1.png))  

After subscribing, the application will immediately added to list of available packages, and the entry might be edited if necessary. Applications from the AppStore will show technical details like optional parameters and suggestions for the assignment.  

[![RJScreen4.15](./media/rj-ui1.png)](./media/rj-ui1.png)
  
To use the AppStore, please get in touch with Glück & Kanja for enablement.  

### Request packaging

If an application is not listed in the AppStore, or is in need of customization, a packaging request can be sent to Glück & Kanja.  
The request option can be found via the last menu item:  
![RJ rj-ac-uploadericon](./media/rj-ac-uploadicon.png)  

Please provide the necessary binaries as well as all installation requirements and additional information. It is essential for in-time processing, that the request only contains the necessary binaries and a detailed installation guide. After submitting the request information (please do not forget a contact persons email address if the requesting admin account do not has a monitored inbox), you will be able to upload your zip file containing the binaries. After the upload, a ticket will automatically be created and the packaging request will be handled by the Glück & Kanja staff.

> [!NOTE]
> Without attaching a file, no request will be created. If the request does not contain binaries, a **dummy.txt** file has to be attached.  
  
![RJ rj-ac-uploader](./media/rj-ac-upload.png)

## AppStore

![RJ rj-ac-statesicon](./media/rj-ac-storeicon.png)

Glück & Kanja maintains an ever-expanding library of ready-to-go applications that might instantly be added to the list of available packages and assigned to groups or users.  
For details, please check the [AppStore section](http://docs.realmjoin.com/requestsoftware.html#appstore) in the [application sources chapter](http://docs.realmjoin.com/requestsoftware.html).  

## States

![RJ rj-ac-statesicon](./media/rj-ac-statesicon.png)

The **states** detail of the client or user control panel provides a list of the devices of the user and how frequently data was upstreamed.
The **Branch Cache** column indicates how much this client has contributed to the package distribution over the **Branch Cache** feature (see [Infrastructure](infrastructure.md)). Selecting the white arrow in the green circle returns the complete upstream file. It contains all the information about the device, OS, Defender Pattern States and installed packages that are transferred to the back-end, where some of it is evaluated.
  
[![RJ rj-ac-states](./media/rj-ac-states.png)](./media/rj-ac-states.png)

It is possible to extend the states by custom states. See section [Custom States](http://docs.realmjoin.com/appendix.html#a-name-customstates-a-custom-states) in the Appendix chapter for details.

## Settings

### List of states

#### Information on the device

> Basic Client Information

```JSON
{
  "Type": "win",
  "ClientID": "75cf4d56-0676-ae02-73ad-a1af9b89f269",
  "VersionTray": "4.9.15-canary+14869.bf207295",
  "VersionService": "4.9.15-canary+14869.bf207295",
  "OperatingSystem": {
    "Name": "Windows 10 Enterprise",
    "Edition": "Enterprise",
    "CompositionEdition": "Enterprise",
    "Version": "10.0.14393.0",
    "ReleaseID": "1607",
    "BuildBranch": "rs1_release",
    "Build": 14393,
    "BuildRevision": 0,
    "InstallDate": "2017-08-16T12:53:01Z",
    "Bits": 64,
    "Activated": false
  },
  "MachineName": "DESKTOP-VH66R7X",
  "DomainName": "LEGACYDOMAIN",
  "JoinedDomainName": "legacydomain.local",
  "HostName": "DESKTOP-VH66R7X",
  "Timestamp": "2017-09-14T07:07:39.2543111+00:00",
  "User": {
    "LocalName": "JONDOE",
    "LocalLogonAt": "2017-09-14T07:07:06.3167385+00:00",
    "IsAdministrator": false
  },
  "Firewall": {
    "ProfileStates": [
      "ON",
      "ON",
      "ON"
    ]
  },
```

  |   Key	| Value  	|  SubKey 	|  SubValue 	|  
  |   -----	|  ----- 	  |   -----	    |   -----	      |
  |  "Type": 	|  "win", 	|   	|   	|   	
  |   "ClientID":	|   "75cf4d56-0676-ae02-73ad-a1af9b89f269",	|   	|   	|  
  |    "VersionTray": 	|    "4.9.15-canary+14869.bf207295",	|   	|   	|   
  |   "VersionService":	|   "4.9.15-canary+14869.bf207295", 	|   	|   	|   
  |    "OperatingSystem":	|   { 	|   	|   	|  
  |   	|   	|   "Name": 	|  "Windows 10 Enterprise", 	|   
  |   	|   	|   "Edition":	|  "Enterprise", 	|   
  |   	|   	|   "CompositionEdition":	|  "Enterprise", 	|   
  |   	|   	|   "Version": 	|   "10.0.14393.0",	|   
  |   	|   	|  "ReleaseID": 	|   "1607",	|   
  |   	|   	|  "BuildBranch": 	|  "rs1_release", 	|   
  |   	|   	|  "Build": 	|   14393, 	|   	
  |   	|   	|  "BuildRevision": 	|   0, 	|   
  |   	|   	|  "InstallDate": 	|   "2017-08-16T12:53:01Z", 	|  	
  |   	|   	|  "Bits": 	|   64,	|   
  |   	|   	|  "Activated": 	|   false,	|   
  |   	| },  	|   	|   	|   
  | "MachineName":  	| "DESKTOP-VH66R7X",  	|   	|   	|
  | "DomainName": 	| "LEGACYDOMAIN",  	|   	|   	|   
  | "JoinedDomainName": 	| "legacydomain.local",  	|   	|   	|   
  | "HostName": 	| "DESKTOP-0815VHX",  	|   	|   	|   
  | "Timestamp": 	| "2017-09-14T07:07:39.2543111+00:00",  	|   	|   	|   
  | "User": 	| {  	|   	|   	|   
  |  	|   	|   "LocalName":	|   "JONDOE",	|   
  |  	|   	|   "LocalLogonAt":	|  "2017-09-14T07:07:06.3167385+00:00", 	|   
  |  	|   	|   "IsAdministrator":	|  false 	|   
  |  	|  }, 	|  	|   	|   
  | "Firewall": 	| { 	|  	|   	|   
  |  	|  	| "ProfileStates": 	| [  <br> "ON",<br> "ON",<br> "ON"<br>	]|   
  | 	| }, 	|  	|   	|   

> Antivirus information and patterns

```JSON
  "AvProducts": {
    "Installed": [
      {
        "Name": "Windows Defender",
        "State": 397568,
        "Details": {
          "AMEngineVersion": "1.1.14003.0",
          "AMProductVersion": "4.10.14393.0",
          "AMServiceEnabled": true,
          "AMServiceVersion": "4.10.14393.0",
          "AntispywareEnabled": true,
          "AntispywareSignatureAge": 29,
          "AntispywareSignatureLastUpdated": "2017-08-15T14:37:45+00:00",
          "AntispywareSignatureVersion": "1.249.1077.0",
          "AntivirusEnabled": true,
          "AntivirusSignatureAge": 29,
          "AntivirusSignatureLastUpdated": "2017-08-15T14:37:46+00:00",
          "AntivirusSignatureVersion": "1.249.1077.0",
          "BehaviorMonitorEnabled": true,
          "ComputerID": "829DE85B-7B39-4093-85F1-6AEF62AC65DD",
          "ComputerState": 0,
          "FullScanAge": 4294967295,
          "FullScanEndTime": null,
          "FullScanStartTime": null,
          "IoavProtectionEnabled": true,
          "LastFullScanSource": 0,
          "LastQuickScanSource": 0,
          "NISEnabled": true,
          "NISEngineVersion": "2.1.13804.0",
          "NISSignatureAge": 0,
          "NISSignatureLastUpdated": "2017-09-14T07:06:25.604+00:00",
          "NISSignatureVersion": "117.8.0.0",
          "OnAccessProtectionEnabled": true,
          "QuickScanAge": 4294967295,
          "QuickScanEndTime": null,
          "QuickScanStartTime": null,
          "RealTimeProtectionEnabled": true,
          "RealTimeScanDirection": 0,
          "PSComputerName": null
        }
      }
    ]
  },
```

   "AvProducts": {  

  |   Key	| Value  	|  SubKey 	|  SubValue 	|       |         |
  |   ---	|  --- 	  |   ---	    |   ---	      | ---    |---     |
  |   "Installed": 	| [ |   	|   	|   	| |
  |   "Name": 	| "Windows Defender", |   	|   	|   	| |
  |   "State":	|   397568,	|   	|   	|  | |
  |    "Details": 	|   {	|   	|   	|   | |
  |   	|    "AMEngineVersion": 	|   "1.1.14003.0",	|   	|   | |
  |   	|    "AMProductVersion": 	|  "4.10.14393.0",	|   	|   | |
  |   	|    "AMServiceEnabled": 	|  true,	|   	|   | |
  |   	|    "AMServiceVersion": 	|   "4.10.14393.0",	|   	|   | |
  |   	|    "AntispywareEnabled": 	|   true,	|   	|   | |
  |   	|    "AntispywareSignatureAge": 	|    29,	|   	|   | |
  |   	|    "AntispywareSignatureLastUpdated": 	|   "2017-08-15T14:37:45+00:00",	|   	|   | |
  |   	|    "AntispywareSignatureVersion": 	| "1.249.1077.0",	|   	|   | |
  |   	|    "AntivirusEnabled": 	|   true,	|   	|   | |
  |   	|    "AntivirusSignatureAge": 	|   29,	|   	|   | |
  |   	|    "AntivirusSignatureLastUpdated": 	|    "2017-08-15T14:37:46+00:00",	|   	|   | |
  |   	|    "AntivirusSignatureVersion": 	|  "1.249.1077.0",	|   	|   | |
  |   	|    "BehaviorMonitorEnabled": 	|   true,	|   	|   | |
  |   	|    "ComputerID": 	|   "829DE85B-7B39-4093-85F1-6A62AC65DD",|   	|   | |
  |   	|    "ComputerState": 	|   0,	|   	|   | |
  |   	|    "FullScanAge": 	|    4294967295,	|   	|   | |
  |   	|    "FullScanEndTime": 	|   null,	|   	|   | |
  |   	|    "FullScanStartTime": 	|   null,	|   	|   | |
  |   	|    "IoavProtectionEnabled": 	|  true,	|   	|   | |
  |   	|    "LastFullScanSource": 	|   "1.1.14003.0",	|   	|   | |
  |   	|    "NISEnabled": 	|   true,	|   	|   | |
  |   	|    "NISEngineVersion": 	|  "2.1.13804.0",	|   	|   | |
  |   	|    "NISSignatureAge": 	|  0,	|   	|   | |
  |   	|    "NISSignatureLastUpdated": 	|   "2017-09-14T07:06:25.604+00:00",	|   	|   | |
  |   	|    "NISSignatureVersion": 	|    "117.8.0.0",	|   	|   | |
  |   	|    "OnAccessProtectionEnabled": 	|  true,	|   	|   | |
  |   	|    "QuickScanAge": 	|    4294967295,	|   	|   | |
  |   	|    "QuickScanEndTime": 	|    null,	|   	|   | |
  |   	|    "QuickScanStartTime": 	|    null,	|   	|   | |
  |   	|    "RealTimeProtectionEnabled": 	|  true,|   	|   | |
  |   	|    "RealTimeScanDirection": 	|  0,	|   	|   | |
  |   	|    "PSComputerName": 	|    null	|   	|   | |
  |   	|      }	|   	|   	|   | |
  |   	|      }	|   	|   	|   | |
  |   	|     ]	|   	|   	|   | |

  > Bitlocker status

```JSON
  "Bitlocker": {
    "DriveStates": [
      {
        "ComputerName": "DESKTOP-0815VHX",
        "MountPoint": "C:",
        "EncryptionMethod": 0,
        "AutoUnlockEnabled": null,
        "AutoUnlockKeyStored": null,
        "MetadataVersion": 0,
        "VolumeStatus": 0,
        "ProtectionStatus": 0,
        "LockStatus": 0,
        "EncryptionPercentage": 0,
        "WipePercentage": 0,
        "VolumeType": 0,
        "CapacityGB": 59.50976,
        "KeyProtector": []
      }
    ]
  },
  "OsUpdates": {
    "RefreshTime": "2017-08-16T14:38:44.1388364+00:00",
    "PendingUpdates": {},
    "Settings": {
      "DeferQualityUpdates": 1,
      "DeferQualityUpdatesPeriodInDays": 21,
      "BranchReadinessLevel": 32,
      "DeferFeatureUpdates": 1,
      "DeferFeatureUpdatesPeriodInDays": 60
    }
  },
  ```  
  "BitLocker": {  
  |   Key	| Value  	|  SubKey 	|  SubValue 	|  | |
  |   ---	|  --- 	  |   ---	    |   ---	      | --- |--- |
  |  "DriveStates": 	|  [ 	|   	|   	|   	| |
  |  	|  { 	|   	|   	|   	| |
  |  	|  "ComputerName": 	| "DESKTOP-0815VHX", 	|   	|   	| |
  |  	|  "MountPoint": 	|   "C:",	|   	|   	| |
  |  	|  "EncryptionMethod": 	|   0,	|   	|   	| |
  |  	|  "AutoUnlockEnabled": 	|  null,  	|   	|   	| |
  |  	|  "AutoUnlockKeyStored": 	|   null,	|   	|   	| |
  |  	|  "MetadataVersion": 	|  0, 	|   	|   	| |
  |  	|  "VolumeStatus": 	|  0, 	|   	|   	| |
  |  	|  "ProtectionStatus": 	|  0, 	|   	|   	| |
  |  	|  "LockStatus": 	|   0,	|   	|   	| |
  |  	|  "EncryptionPercentage": 	|  0, 	|   	|   	| |
  |  	|  "WipePercentage": 	|   0,	|   	|   	| |
  |  	|  "VolumeType": 	|   0,	|   	|   	| |
  |  	|  "CapacityGB": 	|   59.50976, 	|   	|   	| |
  |  	|  "KeyProtector": 	|   []	|   	|   	| |


  > BranchCache and Software

  ```JSON
  "BranchCache": {
    "DataCacheCurrentActiveCacheSize": 1424903614,
    "CurrentClientMode": "DistributedCache"
  },
  > Installed Chocolatey Version. Not upgraded automatically, RealmJoin uses specific version
  "Chocolatey": {
    "RequiredVersion": "0.10.3",
    "InstalledVersion": "0.10.3",
    "Status": "Ready"
  },
  > Software installed via RealmJoin
  "SoftwarePackages": {
    "Installed": [
      {
        "ID": "chocolatey",
        "Version": "0.10.3",
        "ArgsHash": null
      },
      {
        "ID": "realmjoin-core.extension",
        "Version": "1.0.0.0",
        "ArgsHash": null
      },
      {
        "ID": "contoso-adobe-reader-dc-classic",
        "Version": "15.6.30306.0",
        "ArgsHash": null
      },
      {
        "ID": "contoso-fonts",
        "Version": "1.0.0.5",
        "ArgsHash": null
      },
      {
        "ID": "contoso-microsoft-office-2016-proplus-x64-en-de",
        "Version": "16.0.2.0",
        "ArgsHash": null
      },
      {
        "ID": "contoso-office-templates-de",
        "Version": "3.0.1.0",
        "ArgsHash": null
      }
    ]
    > Software installed by other means (Admin, Appx)
    "Inventory": [
      {
        "Name": "7-Zip 18.01 (x64 edition)",
        "Version": "18.01.00.0",
        "Publisher": "Igor Pavlov",
        "EstimatedSize": 5123,
        "UserScope": false
      },
      {
        "Name": "Adobe Acrobat Reader DC (2015) MUI",
        "Version": "15.006.30417",
        "Publisher": "Adobe Systems Incorporated",
        "EstimatedSize": 552266,
        "UserScope": false
      },
      {
        "Name": "Chocolatey GUI",
        "Version": "0.16.0.0",
        "Publisher": "Chocolatey",
        "EstimatedSize": 43896,
        "UserScope": false
      },
      {
        "Name": "Dropbox",
        "Version": "44.4.58",
        "Publisher": "Dropbox, Inc.",
        "EstimatedSize": 0,
        "UserScope": false
      }
    ]
  },
  > Configured DO Group ID
  "DeliveryOptimization": {
    "DefaultGatewayDiscovered": null,
    "GroupID": "00000099-0000-0000-0000-002cc8f1c3bd"
  },
  > Advanced Threat Protection status
  "Atp": {
    "IsOnboarded": true,
    "OnboardingInfo": {
      "previousOrgIds": [],
      "orgId": "fa29db65-000c-0000-9409-369df149b5ba",
      "geoLocationUrl": "https://winatp-gw-weu.microsoft.com/",
      "datacenter": "WestEurope",
      "vortexGeoLocation": "EU",
      "version": "1.13"
      },
  > Individual Custom States
  "CustomStates": {
    "ComputerSystem_Information": {
      "Manufacturer": "Microsoft",
      "Model": "Virtual Machine",
      "SystemSku": "None",
      "SerialNumber": "8024-3966-0000-6152-8582-7818-84",
      "VersionGetRealmjoinComputerSystemModel": "180116",
      "BiosVersion": "Hyper-V UEFI Release v1.0",
      "TimestampOutRealmjoinCustomState": "2018-03-07T15:34:28.0907833Z"
    }
  }
}
```

## Package upload

![RJ rj-ac-uploadericon](./media/rj-ac-uploadicon.png)

To request new packages to be provided by G&K, use the uploader in the RealmJoin admin console. Please provide the necessary binaries as well as all installation requirements and additional information as a **Readme.txt** file.  
After submitting the information (**do not forget a contact person!**), you will be able to upload your zip file containing the binaries and the additional information. This will trigger a packaging request in the G&K ticketing system.
  
[![RJ rj-ac-uploader](./media/rj-ac-upload.png)](./media/rj-ac-upload.png)

> [!NOTE]
> To prevent spam and unsolicited requests, if no file is attached, the request is not processed. In case of a file-less request, a dummy.txt file has to be attached.
<!--
# TBD  
Roles and self service in the admin console.
Roles werden noch eingeführt, aktuell nur Admin oder kein Admin
### Increased self service
SelfService im Backend/Admin Console geplant, niedrige Prio -->
