---
# required metadata

title: Packaging In-Depth
description:
keywords:
author:
editor: lars.thiele
gk.date: 2019-06-18
---

# Packaging In-Depth

## Preface

Most of the command lines below need to be run with administrative rights. As RealmJoin itself will install Chocolatey and machine Craft packages from within the System context, the command lines can also be run from a system command prompt to resemble the production situation as close as possible.  
To open a system command prompt, the tool `psexec` from the [Windows Sysinternals](https://docs.microsoft.com/en-us/sysinternals/) tools can be used: `psexec /d /i /s cmd.exe`

### Updating to the latest RealmJoin core extension

In some cases, it may be necessary to update to the latest version of the RealmJoin core extension for the latest development features to become available:  
`choco upgrade realmjoin-core.extension -y --force`

## Testing Chocolatey Packages from Source

To test a Chocolatey package from source without packing, building or deploying it, a helper within the RealmJoin core extension can be used. Change to the folder were the package sources are located (i.e. where the `.nuspec` file is located) and run the following command (**as administrator**):  
`"%ProgramData%\chocolatey\extensions\realmjoin-core\choco-install-local-nuspec-file.bat"`

This command will also accept parameters like `-uninstall` (to uninstall instead of installing) and `-params` (to pass args like they would be specified in the RealmJoin back-end package definition).

Also, the contents of the `blobs` folder will automatically be copied to the temporary location where they would normally be downloaded to. Therefore the download of blob files from the RealmJoin CDN might fail (in case a file has never been deployed to the CDN), but the installation should still complete successfully as Chocolatey will detect that a file with the correct name and checksum is already available locally.

Except for very specific cases, this command should also work from a folder shared with a virtual machine from outside (e.g. VMware Shared Folders or [local drives shared with Hyper-V guests in enhanced session mode](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/learn-more/use-local-resources-on-hyper-v-virtual-machine-with-vmconnect)). This might be helpful if package development and testing are done on two different (virtual) machines.

## Packing Chocolatey Packages Locally for Testing

In specific cases (if the `blobs` folder is not being used at all or if it's contents have already been deployed to the RealmJoin CDN before, see above), a package can also be packed locally for testing by running the following command from the folder where the `.nuspec` file is located:  
`choco pack`

On the testing machine, a normal file system folder can be added as a Chocolatey repository, e.g.:  
`choco source add -n=rjlocaltemp -s"c:\temp"`

The resulting package (`.nupkg`) from step 1 can then be copied to this folder and be installed by Chocolatey natively:  
`choco install customername-packagename -y --force`

## Importing the Chocolatey and RealmJoin Cmdlets into a PowerShell Session

To import all Chocolatey and RealmJoin cmdlets into a PowerShell session, the following PowerShell command can be used:  
`Import-Module "$env:ProgramData\chocolatey\helpers\chocolateyInstaller.psm1"`  
This will also import the RealmJoin core extension module and can be useful to run some of it's cmdlets interactively, e.g. `Get-ChocolateyRealmjoinRegistryUninstallInfo`

If run with administrative rights, there are a few more development cmdlets available to load package information from a `.nuspec` file and to even run a Chocolatey script (e.g. `chocolateyInstall.ps1`) directly from within the PowerShell session:

* `Initialize-RealmjoinChocoDevChocoEnvironment [[-nuspecFile] <string>] [[-packageName] <string>] [[-packageVersion] <string>] [[-packageTitle] <string>] [[-packageFolder] <string>] [[-params] <string>] [<CommonParameters>]`
* `Invoke-RealmjoinChocoDevScript [[-scriptToRun] <string>] [[-params] <Object>] [-uninstall] [-copyBlobs]`

For further details, please take a look at the files in `%ProgramData%\chocolatey\lib\realmjoin-core.extension` and specifically at the code in the following files:

* `extensions\choco-install-local-nuspec-file.bat`
* `extensions\choco-install-local-nuspec-file.ps1`
* `tools\RealmjoinChocoDevUtils\RealmjoinChocoDevUtils.bat`
* `tools\RealmjoinChocoDevUtils\RealmjoinChocoDevUtils.psm1`

## Thoughts About Updates and Uninstalls

A short summary of how the RealmJoin packaging team usually handles software updates and/or uninstalls when package software:

* We do not expect uninstalls to be generally **really** necessary (see section [FAQ](../appendix/faq.md)). But if it's not too complicated we usually anyway implement the uninstall part for Chocolatey packages as it aids testing etc. (`chocolateyUninstall.ps1` usually just calls `chocolateyInstall.ps1 -uninstall` to keep all logic inside `chocolateyInstall.ps1`).
* The second time that `Get-ChocolateyRealmjoinRegistryUninstallInfo` is used inside `chocolateyInstall.ps1` of our standard packages only uninstalls **newer** or **same** versions of the software (`-versionGe` means versions **greater** or **equal**), as this is usually not being handled well by the installers themselves.
* In case of updating an older version of an installed software, we expect this to be handled well by the installer itself. Therefore we do not do any uninstalls in this case (the vendor's installer might even contain logic to migrate settings etc. if it finds an older version already installed).
* If an uninstaller is unable to handle software updates properly, `chocolateyInstall.ps1` will be customized to handle this itself (e.g. by always uninstalling any related software before installing).
* In case we should ever **really** need to uninstall a Chocolatey package (despite our first assumption), we usually build a **craft** package that more or less literally calls `choco uninstall abc-xyz -y --skip-autouninstaller`.
* Calling `choco uninstall` from within Chocolatey packages **seems** to work, but there is no guarantee here and we recommend to use craft packages for this purpose.

## Core Extension

### Ensure Core Extension in RealmJoin portal

To ensure the extensions are correctly deployed on all clients, please add the core extensions Chocolatey package to the back-end with **order 1** and assign it to the global core group.

### Enable extension CmdLets in Craft packages

Out of Chocolatey packages, the usage of the extension CmdLets has to be enabled:
  
```powershell
Import-Module (Get-ItemPropertyValue -Path "Registry::HKLM\SOFTWARE\RealmJoin\Variables" -Name RealmjoinCraftSupportModulePath)
```

### Useable RealmJoin variables

#### Chocolatey variables

* $packagePrefix = flavour prefix of this package
* $packageName = name of this package
* $packageVersion = version of this package
* $packageVersionObject = [System.Version]$env:packageVersion
* $packageVersionNoRevisionObject = New-Object System.Version -ArgumentList $packageVersionObject.Major, $packageVersionObject.Minor, $packageVersionObject.Build
* $packageParameters = parameters as specified in the assignment arguments
* $packageFolder = folder in which the package is extracted
* $packageToolsFolder = sub directory "tools" of a Chocolatey package, contains the install script. Defined as: Join-Path $env:packageFolder "tools"
* $packageTempDir = temp directory which is used for the package. Defined as: Join-Path $env:TEMP (Join-Path $env:chocolateyPackageName $env:chocolateyPackageVersion)
* $PackageID = unique ID of the package
**Environment variables**
* $env:RJ_Version
* $env:RJ_UserSID = SID of the user who started this package installation. Can be used in system crafts if parameters are initialized
* $env:RJ_ChocolateyPackage = glueckkanja-test-choco
* $env:RJ_InstalledVersion = 1.0.0.1
* $envRJ_PackageID = glueckkanja-test-choco
* $env:RJ_DeploymentPhase = contains information on the installation.  
Can be:

  ```
  Blank

  RunningFirstDeployment
  RunningFirstDeploymentAuto
   - Now the installations start
  CompletedFirstDeployment

  RunningDeployment
   - Now the installations start
  CompletedDeployment

  ManualDeployment
   - Now the installations start
  ```

### AppV Packages

#### Enable-ChocolateyRealmjoinAppv

This command will enable AppV on current client with BranchCache as supported.

##### Syntax

```powershell
Enable-ChocolateyRealmjoinAppv
```

#### Install-ChocolateyRealmjoinAppvPackage

This command will add and publish an AppV package

##### Syntax

```powershell
Install-ChocolateyRealmjoinAppvPackage [[-fileName] <string>] [[-fileChecksum] <string>] [[-DynamicDeploymentConfiguration] <string>] [<CommonParameters>]

```

##### Parameters

```no-highlight
Name                           Aliases Description Required? Pipeline Input? Default Value
----                           ------- ----------- --------- --------------- -------------
DynamicDeploymentConfiguration None                false     false                        
fileChecksum                   None                false     false                        
fileName                       None                false     false                        
```

#### Uninstall-ChocolateyRealmjoinAppvPackage

This command will uninstall an AppV Package.

##### Syntax

```powershell
Uninstall-ChocolateyRealmjoinAppvPackage [[-name] <string>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name Aliases Description Required? Pipeline Input? Default Value
---- ------- ----------- --------- --------------- -------------
name None                false     false                        
```

#### Get-ChocolateyRealmjoinAppvPackageVfsPath

##### Syntax

```powershell
Get-ChocolateyRealmjoinAppvPackageVfsPath [[-appvPackage] <Object>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name        Aliases Description Required? Pipeline Input? Default Value
----        ------- ----------- --------- --------------- -------------
appvPackage None                false     false                      
```

### Logs and Transforms

#### Get-ChocolateyRealmjoinLocaleId

Returns the corresponding LocaleId of a given locale string

##### Syntax

```powershell
Get-ChocolateyRealmjoinLocaleId [[-localeString] <string>] [[-defaultLocaleId] <int>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name            Aliases Description Required? Pipeline Input? Default Value
----            ------- ----------- --------- --------------- -------------
defaultLocaleId None                false     false                        
localeString    None                false     false                        
```

#### Get-ChocolateyRealmjoinLocaleMsiTransform

Based on the given LocaleId this command will return the path of the localized transform file

##### Syntax

```powershell
Get-ChocolateyRealmjoinLocaleMsiTransform [[-localeString] <string>] [[-localeTransformsFolder] <string>] [[-defaultLocaleId] <int>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name                   Aliases Description Required? Pipeline Input? Default Value
----                   ------- ----------- --------- --------------- -------------
defaultLocaleId        None                false     false                        
localeString           None                false     false                        
localeTransformsFolder None                false     false                        
```

#### Get-ChocolateyRealmjoinLogFilePath

This command will return the realmjoin-specific logfile path including a package-specific logfile depending on the execution context.

##### Syntax

```powershell
Get-ChocolateyRealmjoinLogFilePath [[-operation] <string>] [[-target] <string>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name      Aliases Description Required? Pipeline Input? Default Value
----      ------- ----------- --------- --------------- -------------
operation None                false     false                        
target    None                false     false                        
```

### Chocolatey Packages

#### Install-ChocolateyRealmjoinPackage

This command will install a software (installer file from cloud blob storage).

##### Syntax

```powershell
Install-ChocolateyRealmjoinPackage [[-installerFileName] <string>] [[-installerFileChecksum] <string>] [[-msiTransforms] <string[]>] [[-msiTransformsCabs] <string[]>] [[-additionalArgs] <string[]>] [[-silentArgs] <string[]>] [[-validExitCodes] <int[]>] [[-installers] <psobject[]>] [[-preActions] <scriptblock>] [[-postActions] <scriptblock>] [[-installPackage] <bool>] [[-noInstallMessage] <string>] [-installerFileNameIsLocalPath] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name                         Aliases Description Required? Pipeline Input? Default Value
----                         ------- ----------- --------- --------------- -------------
additionalArgs               None                false     false                        
installPackage               None                false     false                        
installerFileChecksum        None                false     false                        
installerFileName            None                false     false                        
installerFileNameIsLocalPath None                false     false                        
installers                   None                false     false                        
msiTransforms                None                false     false                        
msiTransformsCabs            None                false     false                        
noInstallMessage             None                false     false                        
postActions                  None                false     false                        
preActions                   None                false     false                        
silentArgs                   None                false     false                        
validExitCodes               None                false     false                        
```

#### Uninstall-ChocolateyRealmjoinPackage

This command will uninstall a software package.

##### Syntax

```powershell
Uninstall-ChocolateyRealmjoinPackage [[-uninstallerFile] <string>] [[-additionalArgs] <string[]>] [[-silentArgs] <string[]>] [[-validExitCodes] <int[]>] [[-subPackageName] <string>] [[-uninstallers] <psobject[]>] [[-uninstallInfo] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name            Aliases Description Required? Pipeline Input? Default Value
----            ------- ----------- --------- --------------- -------------
Confirm         cf                  false     false                        
WhatIf          wi                  false     false                        
additionalArgs  None                false     false                        
silentArgs      None                false     false                        
subPackageName  None                false     false                        
uninstallInfo   None                false     true (ByValue)               
uninstallerFile None                false     false                        
uninstallers    None                false     false                        
validExitCodes  None                false     false                        
```

#### Import-ChocolateyRealmjoinPackageParameters

##### Syntax

```powershell
Import-ChocolateyRealmjoinPackageParameters [[-params] <string>] [-setVariables] [-clearVariables] [-returnKeyValuePairs] [-returnParameterHashset] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name                   Aliases Description Required? Pipeline Input? Default Value
----                   ------- ----------- --------- --------------- -------------
clearVariables         None                false     false                        
params                 None                false     false                        
returnKeyValuePairs    None                false     false                        
returnParameterHashset None                false     false                        
setVariables           None                false     false                        
```

#### Test-ChocolateyRealmjoinRegistryUninstallExists

With this command you can test if a software exist on your system. This test based on the uninstall info from **Get-ChocolateyRealmjoinRegistryUninstallInfo**.

##### Syntax

```powershell
Test-ChocolateyRealmjoinRegistryUninstallExists [[-keyNameFilter] <string>] [[-displayNameFilter] <string>] [[-publisherFilter] <string>] [[-versionGe] <version>] [[-versionGt] <version>] [[-versionLe] <version>] [[-versionLt] <version>] [[-filterScriptblock] <scriptblock>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name              Aliases Description Required? Pipeline Input? Default Value
----              ------- ----------- --------- --------------- -------------
displayNameFilter None                false     false                        
filterScriptblock None                false     false                        
keyNameFilter     None                false     false                        
publisherFilter   None                false     false                        
versionGe         None                false     false                        
versionGt         None                false     false                        
versionLe         None                false     false                        
versionLt         None                false     false                        
```

#### Get-ChocolateyRealmjoinRegistryUninstallInfo

With this command you can get the common uninstall infos as PSObject of all items.

##### Syntax

```powershell
Get-ChocolateyRealmjoinRegistryUninstallInfo [[-keyNameFilter] <string>] [[-displayNameFilter] <string>] [[-publisherFilter] <string>] [[-versionGe] <version>] [[-versionGt] <version>] [[-versionLe] <version>] [[-versionLt] <version>] [[-filterScriptblock] <scriptblock>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name              Aliases Description Required? Pipeline Input? Default Value
----              ------- ----------- --------- --------------- -------------
displayNameFilter None                false     false                        
filterScriptblock None                false     false                        
keyNameFilter     None                false     false                        
publisherFilter   None                false     false                        
versionGe         None                false     false                        
versionGt         None                false     false                        
versionLe         None                false     false                        
versionLt         None                false     false                        
```

#### Get-ChocolateyRealmjoinRegistryUninstallStrings

With this command you will get an object with key name, file and arguments of an uninstall info match. You will get this info from **Get-ChocolateyRealmjoinRegistryUninstallInfo**.

##### Syntax

```powershell
Get-ChocolateyRealmjoinRegistryUninstallStrings [-uninstallKeyNameFilter] <string> [<CommonParameters>]
```

##### Parameters

```no-highlight
Name                   Aliases Description Required? Pipeline Input? Default Value
----                   ------- ----------- --------- --------------- -------------
uninstallKeyNameFilter None                true      false                        
```

#### Get-ChocolateyRealmjoinWebFile

Downloads given filename (archive) from cloud blob storage.

##### Syntax

```powershell
Get-ChocolateyRealmjoinWebFile [[-fileName] <string>] [[-fileChecksum] <string>] [[-remoteFileName] <string>] [-extractArchive] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name           Aliases Description Required? Pipeline Input? Default Value
----           ------- ----------- --------- --------------- -------------
extractArchive None                false     false                        
fileChecksum   None                false     false                        
fileName       None                false     false                        
remoteFileName None                false     false                        
```

#### Invoke-RealmjoinChocoPackageInstallation

##### Syntax

```powershell
Invoke-RealmjoinChocoPackageInstallation [[-packageName] <string>] [[-params] <hashtable>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name        Aliases Description Required? Pipeline Input? Default Value
----        ------- ----------- --------- --------------- -------------
packageName None                false     false                        
params      None                false     false                        
```

### Command line

#### Join-RealmjoinCommandLine

##### Syntax

```powershell
Join-RealmjoinCommandLine [[-CommandOnly] <string>] [[-ArgumentsOnly] <string>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name          Aliases Description Required? Pipeline Input? Default Value
----          ------- ----------- --------- --------------- -------------
ArgumentsOnly None                false     false                        
CommandOnly   None                false     false                        
```

#### Split-RealmjoinCommandLine

##### Syntax

```powershell
Split-RealmjoinCommandLine [[-CommandLine] <string>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name        Aliases Description Required? Pipeline Input? Default Value
----        ------- ----------- --------- --------------- -------------
CommandLine None                false     false                        
```

#### Get-RealmjoinCommandLineWithLauncher

##### Syntax

```powershell
Get-RealmjoinCommandLineWithLauncher [[-CommandLine] <string>] [[-CommandOnly] <string>] [[-ArgumentsOnly] <string>] [-ReturnSplit] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name          Aliases Description Required? Pipeline Input? Default Value
----          ------- ----------- --------- --------------- -------------
ArgumentsOnly None                false     false                        
CommandLine   None                false     false                        
CommandOnly   None                false     false                        
ReturnSplit   None                false     false                        
```

#### Restart-RealmjoinComputer

A system restart can be initiated. By default with a delay of 10 seconds, which can be overwritten by the corresponding parameter. Optional you can provide a message by parameter. Behind the scene a scheduled task is created which performs a shutdown with parameter for restart.

##### Syntax

```powershell
Restart-RealmjoinComputer [[-Delay] <timespan>] [[-Message] <string>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name    Aliases Description Required? Pipeline Input? Default Value
----    ------- ----------- --------- --------------- -------------
Delay   None                false     false                        
Message None                false     false                        
```

#### Get-RealmjoinComputerSystemBiosVersion

##### Syntax

```powershell
Get-RealmjoinComputerSystemBiosVersion
```

#### Get-RealmjoinComputerSystemModel

##### Syntax

```powershell
Get-RealmjoinComputerSystemModel [-IncludeDebugInfoIfUnsure] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name                     Aliases Description Required? Pipeline Input? Default Value
----                     ------- ----------- --------- --------------- -------------
IncludeDebugInfoIfUnsure None                false     false                        
```

### Custom States

#### Out-RealmjoinCustomState

This command will create a custom state with a mandatory name and input object.

##### Syntax

```powershell
Out-RealmjoinCustomState [-Name] <string> [[-InputObject] <Object>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name        Aliases Description Required? Pipeline Input? Default Value
----        ------- ----------- --------- --------------- -------------
InputObject None                false     true (ByValue)               
Name        None                true      false                        
```

#### Remove-RealmjoinCustomState

This command will remove a custom state

##### Syntax

```powershell
Remove-RealmjoinCustomState [-Name] <string> [<CommonParameters>]
```

##### Parameters

```no-highlight
Name Aliases Description Required? Pipeline Input? Default Value
---- ------- ----------- --------- --------------- -------------
Name None                true      false                        
```

### Scheduled Tasks

Using predefined RealmJoin cmdlets, it is possible to register scheduled tasks in system or user scope. The cmdlet provides a XML template, that is modified following the used parameters. Tasks also might be unscheduled.

#### Register-RealmjoinCustomStateScheduledTask

This command will register a scheduled task with package title a its name for creation.

##### Syntax

```powershell
Register-RealmjoinCustomStateScheduledTask [[-RepetitionInterval] <timespan>] [[-TaskName] <string>] [[-PublishStateScriptFile] <string>]
```

##### Parameters

```no-highlight
Name                   Aliases Description Required? Pipeline Input? Default Value
----                   ------- ----------- --------- --------------- -------------
PublishStateScriptFile None                false     false           ".\publishState.ps1"                        
RepetitionInterval     None                false     false           "1.00:00:00"             
TaskName               None                false     false           $env:packageTitle             
```

#### Unregister-RealmjoinCustomStateScheduledTask

This command will remove the custom state scheduled task by its name.

##### Syntax

```powershell
Unregister-RealmjoinCustomStateScheduledTask [[-TaskName] <string>] [[-PublishStateScriptFile] <string>]
```

##### Parameters

```no-highlight
Name                   Aliases Description Required? Pipeline Input? Default Value
----                   ------- ----------- --------- --------------- -------------
PublishStateScriptFile None                false     false                        
TaskName               None                false     false                        
```

#### Get-RealmjoinInvocationParameters

##### Syntax

```powershell
Get-RealmjoinInvocationParameters [[-Invocation] <InvocationInfo>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name       Aliases Description Required? Pipeline Input? Default Value
----       ------- ----------- --------- --------------- -------------
Invocation None                false     false                        
```

#### Get-RealmjoinPathRooted

##### Syntax

```powershell
Get-RealmjoinPathRooted [[-Path] <string>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name Aliases Description Required? Pipeline Input? Default Value
---- ------- ----------- --------- --------------- -------------
Path None                false     false                        
```

#### New-RealmjoinScheduledTaskBootTrigger

This command will create a boot scheduled task trigger

##### Syntax

```powershell
New-RealmjoinScheduledTaskBootTrigger [[-Enabled] <bool>] [[-StartBoundary] <datetime>] [[-EndBoundary] <datetime>] [[-RepetitionInterval] <timespan>] [[-RepetitionDuration] <timespan>] [[-Delay] <timespan>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name               Aliases Description Required? Pipeline Input? Default Value
----               ------- ----------- --------- --------------- -------------
Delay              None                false     false                        
Enabled            None                false     false                        
EndBoundary        None                false     false                        
RepetitionDuration None                false     false                        
RepetitionInterval None                false     false                        
StartBoundary      None                false     false                        
```

#### New-RealmjoinScheduledTaskDailyTrigger

This command will create a daily scheduled task trigger

##### Syntax

```powershell
New-RealmjoinScheduledTaskDailyTrigger [[-Enabled] <bool>] [[-StartBoundary] <datetime>] [[-EndBoundary] <datetime>] [[-RepetitionInterval] <timespan>] [[-RepetitionDuration] <timespan>] [[-RandomDelay] <timespan>] [[-DaysInterval] <uint32>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name               Aliases Description Required? Pipeline Input? Default Value
----               ------- ----------- --------- --------------- -------------
DaysInterval       None                false     false                        
Enabled            None                false     false                        
EndBoundary        None                false     false                        
RandomDelay        None                false     false                        
RepetitionDuration None                false     false                        
RepetitionInterval None                false     false                        
StartBoundary      None                false     false                        
```

#### New-RealmjoinScheduledTaskLogonTrigger

This command will create a logon scheduled task trigger.

##### Syntax

```powershell
New-RealmjoinScheduledTaskLogonTrigger [[-Enabled] <bool>] [[-StartBoundary] <datetime>] [[-EndBoundary] <datetime>] [[-RepetitionInterval] <timespan>] [[-RepetitionDuration] <timespan>] [[-Delay] <timespan>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name               Aliases Description Required? Pipeline Input? Default Value
----               ------- ----------- --------- --------------- -------------
Delay              None                false     false                        
Enabled            None                false     false                        
EndBoundary        None                false     false                        
RepetitionDuration None                false     false                        
RepetitionInterval None                false     false                        
StartBoundary      None                false     false                        
```

#### New-RealmjoinScheduledTaskTimeTrigger

This command will create a custom scheduled task trigger.

##### Syntax

```powershell
New-RealmjoinScheduledTaskTimeTrigger [[-DelayFromNow] <timespan>] [[-Enabled] <bool>] [[-StartBoundary] <datetime>] [[-EndBoundary] <datetime>] [[-RepetitionInterval] <timespan>] [[-RepetitionDuration] <timespan>] [[-RandomDelay] <timespan>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name               Aliases Description Required? Pipeline Input? Default Value
----               ------- ----------- --------- --------------- -------------
DelayFromNow       None                false     false                        
Enabled            None                false     false                        
EndBoundary        None                false     false                        
RandomDelay        None                false     false                        
RepetitionDuration None                false     false                        
RepetitionInterval None                false     false                        
StartBoundary      None                false     false                        
```

#### New-RealmjoinScheduledTaskXml

This command will create a scheduled task with a given action and trigger

##### Syntax

```powershell
New-RealmjoinScheduledTaskXml [[-Principal] <ScheduledTaskPrincipal>] [[-Action] <Object[]>] [[-Trigger] <Object[]>] [[-Enabled] <bool>] [[-ExecutionTimeLimit] <timespan>] [[-TaskName] <string>] [-DeleteAfterFirstRun] [-Register] [-StartOnce] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name                Aliases Description Required? Pipeline Input? Default Value
----                ------- ----------- --------- --------------- -------------
Action              None                false     false                        
DeleteAfterFirstRun None                false     false                        
Enabled             None                false     false                        
ExecutionTimeLimit  None                false     false                        
Principal           None                false     false                        
Register            None                false     false                        
StartOnce           None                false     false                        
TaskName            None                false     false                        
Trigger             None                false     false                        
```  

### Shortcuts

The following cmdlets allow to remove, create or modify shortcuts ot/on the desktop or the global start menu.  

#### New-RealmjoinShortcut

This command will create shortcuts. If you do so, this shortcut will follow a defined **TargetPath** and a defined **shortcutPath**

##### Syntax

```powershell
New-RealmjoinShortcut [-shortcutPath] <string> [-targetPath] <string> [[-targetArguments] <string>] [[-workingDirectory] <string>] [[-description] <string>] [[-iconLocation] <string>] [[-hotKey] <string>] [[-windowStyle] <int>] [-forCurrentUser] [-onDesktop] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name             Aliases Description Required? Pipeline Input? Default Value
----             ------- ----------- --------- --------------- -------------
description      None                false     false                        
forCurrentUser   None     Shortcuts are enabled for current user           false     false                        
hotKey           None                false     false                        
iconLocation     None                false     false                        
onDesktop        None     Path will create on the desktop           false     false                        
shortcutPath     None                true      false                        
targetArguments  None                false     false                        
targetPath       None                true      false                        
windowStyle      None                false     false                        
workingDirectory None                false     false                        
```

#### Remove-RealmjoinShortcut

This command will remove shortcuts

##### Syntax

```powershell
Remove-RealmjoinShortcut [-shortcutPath] <string> [-forCurrentUser] [-onDesktop] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name           Aliases Description Required? Pipeline Input? Default Value
----           ------- ----------- --------- --------------- -------------
forCurrentUser None      Remove and disable a shortcut for current user          false     false                        
onDesktop      None      Remove a shortcut from desktop          false     false                        
shortcutPath   None                true      false                        
```

#### Format-RealmjoinShortcutPath

##### Syntax

```powershell
Format-RealmjoinShortcutPath [-shortcutPath] <string> [-forCurrentUser] [-onDesktop] [-doNotCheckCreateFolder] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name                   Aliases Description Required? Pipeline Input? Default Value
----                   ------- ----------- --------- --------------- -------------
doNotCheckCreateFolder None                false     false                        
forCurrentUser         None                false     false                        
onDesktop              None                false     false                        
shortcutPath           None                true      false                        
```

#### Start-RealmjoinSoftwarePackageInstallation

##### Syntax

```powershell
Start-RealmjoinSoftwarePackageInstallation [[-packageName] <string>] [<CommonParameters>]
```

##### Parameters

```no-highlight
Name        Aliases Description Required? Pipeline Input? Default Value
----        ------- ----------- --------- --------------- -------------
packageName None                false     false
```
