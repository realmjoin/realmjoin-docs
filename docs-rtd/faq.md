
# FAQ

## Which links should I bookmark?

* RealmJoin Admin Portal:  
    <https://realmjoin-web.azurewebsites.net/>
* Gitlab Packages:  
    <https://gitlab.glueckkanja.net/>
* General RealmJoin website:  
    <https://realmjoin.com/>
* Documentation:  
    <https://docs.realmjoin.com/>

## Am I able to maintain my own packages and updates?

Yes. RealmJoin offers packaging-as-a-service but you may also check in ready-to-use packages. In addition it is possible to use additional deployment repositories completely maintained independently.

## Which platforms are supported?

RealmJoin v4 is only available for Windows 10.

## I do not see my groups in the Admin Console

The sync between Azure AD and RealmJoin is scheduled every 15 minutes and based on your custom pattern rule set.

## Does RealmJoin support Multi User Devices?

Yes. Starting with version 4.13 RealmJoin allows applications to be installed not only for the primary device user but also secondary users. See section [advanced options/ multi user devices](http://docs.realmjoin.com/managing-realmjoin.html#advanced-options) in the chapter Managing RealmJoin chapter for details on multi user package assignment.

## How to enter the Debug Mode in RealmJoin client?

Press and hold **Strg** + **Shift** and click the RealmJoin icon in the taskbar.  
For a detailed description of **Debug mode** see chapter [Troubleshooting](troubleshooting.md).

## I accidentally uninstalled RealmJoin-deployed software using the Windows Apps control

Force reinstall by using the **debug mode**.

## Can I get rid of Bloatware using RealmJoin?

TBD
<!--Bloatware: 
Installer von Bloatware uninstaller, nicht einfach, da auch von MS Seite über den Store Software vorinstalliert wird
StandardBloatware, und Hersteller eigene Software, kann schwierig bereinigt werden, ggf neu aufzusetzen
"Win 10 Push Button Reset" soll zu Clean Windows f�hren, dann ist man im OOBE (f�r AAD Join), aber ist noch nicht fix-->

## Is RealmJoin providing an uninstall of software?

A general uninstall feature is currently not implemented. Chocolatey packages provide a generic uninstall component which would be usable for RealmJoin.  
But because of the volatile history of unattended and the sometimes unpredictable issues with incomplete uninstalls we have decided against using it.

There are typically three reasons to uninstall software:

* The license should be re-used for a different user. In this case it's easy to just create a package to enable/disable a license for a user.
* The software needs to be removed because of [choose your reason]. In this case a dedicated remove-software-package can be created.
* There is a newer version of the software. This is not a reason to use an uninstall command but instead it is a common practice for every software package used by RealmJoin to 'clean' any precursory binaries or settings.

## Should I use the applications internal auto updater or not?

This highly depends on the application itself as well as your internal processes. For some applications, that might be prone to attacking and are very well maintained by the vendor - like Google Chrome - we recommend to use the applications internal update. For other software, it might be more useful to include a regular update via RealmJoin into your processes.  

## Re-Install failed software installations

RealmJoin tries to redo failed installations on the next three logons. If the installations still fails the package is marked as permanent-failed. To reinstall it at a later time use **Retry base installation** in **debug mode**.

## Since the packages are based on open protocols, can others access my packages?

Yes. NuGet and Chocolatey repositories are based on open protocols. Using search commands one is able to find all repositories that are hosted on the GK tenant. Since packages **should not** contain personalized information like licenses or user specific data, there is no potential harm in e.g. installing a Office package with a different companies name in the package description.  
It is in principle possible to host the RealmJoin

## What firewall/proxy settings do I have to configure?

Please check the [infrastructure requirements](http://docs.realmjoin.com/infrastructure.html#network) for detailed information on the RealmJoin connections.  

## Does G&K have any recommendations on workflows?

Yes. Our suggestions can be found in the **workflow** section of this documentation.  

## What is the recommendation for reporting?

See section **States** in the chapter Managing RealmJoin [Managing RealmJoin - States](http://docs.realmjoin.com/managing-realmjoin.html#states). It is possible to get virtually any information from each client in JSON-form. There are several applications available to evaluate the data, for example PowerBI, which allows to sort and process the data in logical and visually pleasing ways.  

## In the future, may RealmJoin packages be used in Intune?

If in the future, Microsoft Intune becomes more capable and the installation of software is as versatile and organized as with RealmJoin, you may use the existing packages in Intune. Since RealmJoin does only need Chocolatey and PowerShell to run the installers, there might be possibilities to use Intune to install software.  

## Is RealmJoin GDPR compliant?

Glück & Kanja takes data protection very seriously. All contracts with customers and partners take data protection into consideration.

## Does the RealmJoin BitLocker enforcement work on virtual machines?

For virtual machines the encryption is only enforced, if the virtual machine variable $env:RjDisableVmDetection=1 is set.  
This setting can be bypassed in the OOBE screen with the command ``setx /m RjDisableVmDetection 1 `` in a cmd shell.  

## Is it possible to see the code of store applications?

It is possible to request reading rights for a specific application package from Glück & Kanja. The installation script of already installed packages can be found under ``$env:ProgramData\chocolatey\lib\<packageId>\Tools``

## Can I force the weblinks in the RealmJoin tray to use a specific process?

Yes. To do so, the target has to be set to the process and optional args can be provided. Additionally, for edge, the protocol handler can be used:

- Key: "WebLinks" (directing to process):

```JSON
   {
"Name": "Citrix-Applikationen",
"Target": "iexplore",
"Args": "https://url.net",
"Platform": "any"
},
{
"Name": "Citrix-Applikationen",
"Target": "microsoft-edge:https://url.net",
"Platform": "any"
}

```

See chapter [Settings and Policies](policies.md) for further information.
