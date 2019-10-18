
# Types of RealmJoin packages

There are four different kinds of packages that can be deployed to the enrolled devices using RealmJoin. It is recommended to use the most generic package types (craft and Chocolatey) if possible.

## Craft packages

Basically, a craft package is just a container to transfer a batch or PowerShell script and related files to a device. Typical examples would be to set system or user based settings in the registry, prepare files with user specific details like Outlook signatures or Office templates or to install drivers.

If PowerShell is used, the primary PowerShell script will be executed by calling:

```
powershell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -File "rj_install.ps1" arg1 arg2
```

If batch is used, the primary batch script will be executed by calling:

```
rj_install.cmd arg1 arg2
```

It is important to know that craft packages can run in user or system context, which can be specified during the package crafting process.  
Packages that are run in **user** mode are installed using the current user without administrative rights, even if the user is local administrator on the device.
Packages that are run in the system mode use the **SYSTEM** account on the device.
  
### Environment Variables

* Graph_User_BusinessPhone
* Graph_User_City
* Graph_User_CompanyName
* Graph_User_Country
* Graph_User_Department
* Graph_User_DisplayName
* Graph_User_GivenName
* Graph_User_Id
* Graph_User_JobTitle
* Graph_User_Mail
* Graph_User_MobilePhone
* Graph_User_OfficeLocation
* Graph_User_PostalCode
* Graph_User_State
* Graph_User_StreetAddress
* Graph_User_Surname

## Chocolatey packages

Chocolatey packages are created with the Chocolatey engine, which is using the NuGet infrastructure.

### NuGet

NuGet is a open-source package manager to enable developers to create, share and use libraries and packages within the .NET framework. NuGet provides the tools and services to create, host and consume packages for the .NET framework.  
In addition to providing over 80.000 of publicly-available packages, NuGet allows developers to host packages privately in their favourite environment. The available hosting options are listed here [NuGet packages hosting](https://docs.microsoft.com/en-us/nuget/hosting-packages/overview).  
Independent from the method, the NuGet hosted packages are made available to the consumers.  
For a more detailed documentation of NuGet see the [Microsoft NuGet documentation](https://docs.microsoft.com/en-us/nuget/#pivot=start&panel=start-all) and <https://www.nuget.org/> for available packages.

### Chocolatey

Chocolatey is a PowerShell execution engine that provides a single, unified interface for the management of software on Windows, utilizing the NuGet infrastructure. It might be compared to linux' **apt-get** when it comes to (un-)installing software. With just a simple command line, software packages (publicly and privately hosted) can be installed with a high level of automation. RealmJoin uses Chocolatey to manage packages cleanly, silently and without any user intervention needed during the installation process.

Chocolatey packages contain all necessary files, e.g. installs, zip-files, scripts etc., in one compiled package. During package installation, Chocolatey checks for dependencies (specified during package assignment in RealmJoin) and takes care of those, silently installing the needed packages.  
Chocolatey uses NuGet.Core to retrieve packages from the source. Before installing, Chocolatey takes snapshots, then runs automation scripts (PowerShell) if provided in the package.

In the next step, installers or executables are run. After the installation, Chocolatey prepares uninstall information based on the pre-installation snapshots of registry and file/folder structure.
In case of Windows installer based software, it will be installed into the default path, mostly **Program Files**. Other packages are installed into **ChocolateyInstall\Lib**.  
The Chocolatey install command can be run with various parameters to e.g. suppress prompts, specify an installation directory. The full list of options can be found in the [Chocolatey wiki](https://github.com/chocolatey/choco/wiki/CommandsInstall#options-and-switches).  
  
> [!Note]
> If you want to provide command line parameters for the software that should be installed, they have to be correctly escaped to prevent Chocolatey from trying to interpret them as install options.  
For a more detailed documentation of Chocolatey see the [official Chocolatey wiki on Github](https://github.com/chocolatey/choco/wiki).

## Microsoft Application Virtualization

Microsoft Application Virtualization (App-V) is an application virtualization solution from Microsoft. The App-V platform allows applications to be streamed to any client from a virtual application server. It is not needed to install the application locally, only the App-V client needs to be.  
App-V packages, are the most exotic packages supported by RealmJoin. They are created as the difference between an out-of-the-box Windows 10 and an out-of-the-box Windows 10 with the software installed. It therefore contains all the differences in data, keys and file structure that result from the installation.

App-V sandboxes the execution environment, hosting a virtual file system, registry keys, services and so on, based on the App-V package. All the data specific to the software version is enclosed in the sandbox, resulting in no changes on the clients operation system. This also allows to use different version of the same software parallel, even if they contain contradicting settings and key values. App-V might be considered as an intermediate step towards a virtual machine.

Generally spoken, App-V is the most sophisticated package type in RealmJoin, while highly customized, allowing most applications to be run.  
For a more detailed view on App-V see the [Microsoft documentation on Application Virtualization](https://technet.microsoft.com/en-us/library/hh826068.aspx).

## Organic

Organic packages contain raw and unprocessed application setups. When handling those, RealmJoin is basically just used as a transport vehicle to move the zipped container to a specified location. Depending on its payload, the installer then has to be manually started by the user (if user mode) or a remote administrator or field service.

The idea of organic packages is based on the experience that large infrastructures sometimes need specialized software only used by up to five users. Because lots of these applications is not identified as relevant to the overall company strategy but users often insist to have it, there was a need to offer a fast and cost effective way to transport the setup in a controlled and auditable way to the client but to have its installation be a manual process.

With organic packages the organization knows exactly which software based on the detailed binaries and versions is in use on the client machines. If there is a security issue with one of these versions, all information is at hand. And if the user needs a new device, the special software packages are again available.

The used binaries are scanned for malware when transferred to the RealmJoin infrastructure. Because of their highly individualized nature and manual on-device management those packages are not maintained in a standard process, possible effects have to be addressed locally.
