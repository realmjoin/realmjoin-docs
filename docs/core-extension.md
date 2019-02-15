
# Core Extension

## Ensure Core Extension in RealmJoin portal

To ensure the extensions are correctly deployed on all clients, please add the core extensions Chocolatey package to the back-end with **order 1** and assign it to the global core group.

## Enable extension CmdLets in Craft packages

Out of Chocolatey packages, the usage of the extension CmdLets has to be enabled:
  
```powershell
Import-Module (Get-ItemPropertyValue -Path "Registry::HKLM\SOFTWARE\RealmJoin\Variables" -Name RealmjoinCraftSupportModulePath)
```

## Useable RealmJoin variables

The following variables can be used in RealmJoin PowerShell scripts:

| Variable | Content |
| ---- | ---- |  
| $RJ_PackageID |e.g. generic-google-chrome |
| $RJ_Version | |
| $packageName | e.g. Google Chrome |
| $RJ_ChocolateyPackage ||
| $packageTempDir | current %TEMP% for this package |
| $packageToolsFolder | current folder where the chocoinstall.ps1 is started in |

## AppV Packages

### Enable-ChocolateyRealmjoinAppv

#### Syntax

```powershell
Enable-ChocolateyRealmjoinAppv
```

### Install-ChocolateyRealmjoinAppvPackage

#### Syntax

```powershell
Install-ChocolateyRealmjoinAppvPackage [[-fileName] <string>] [[-fileChecksum] <string>] [[-DynamicDeploymentConfiguration] <string>] [<CommonParameters>]

```

#### Parameters

```no-highlight
Name                           Aliases Description Required? Pipeline Input? Default Value
----                           ------- ----------- --------- --------------- -------------
DynamicDeploymentConfiguration None                false     false                        
fileChecksum                   None                false     false                        
fileName                       None                false     false                        
```

### Uninstall-ChocolateyRealmjoinAppvPackage

#### Syntax

```powershell
Uninstall-ChocolateyRealmjoinAppvPackage [[-name] <string>] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name Aliases Description Required? Pipeline Input? Default Value
---- ------- ----------- --------- --------------- -------------
name None                false     false                        
```

### Get-ChocolateyRealmjoinAppvPackageVfsPath

#### Syntax

```powershell
Get-ChocolateyRealmjoinAppvPackageVfsPath [[-appvPackage] <Object>] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name        Aliases Description Required? Pipeline Input? Default Value
----        ------- ----------- --------- --------------- -------------
appvPackage None                false     false                      
```

## Logs and Transforms

### Get-ChocolateyRealmjoinLocaleId

#### Syntax

```powershell
Get-ChocolateyRealmjoinLocaleId [[-localeString] <string>] [[-defaultLocaleId] <int>] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name            Aliases Description Required? Pipeline Input? Default Value
----            ------- ----------- --------- --------------- -------------
defaultLocaleId None                false     false                        
localeString    None                false     false                        
```

### Get-ChocolateyRealmjoinLocaleMsiTransform

#### Syntax

```powershell
Get-ChocolateyRealmjoinLocaleMsiTransform [[-localeString] <string>] [[-localeTransformsFolder] <string>] [[-defaultLocaleId] <int>] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name                   Aliases Description Required? Pipeline Input? Default Value
----                   ------- ----------- --------- --------------- -------------
defaultLocaleId        None                false     false                        
localeString           None                false     false                        
localeTransformsFolder None                false     false                        
```

### Get-ChocolateyRealmjoinLogFilePath

#### Syntax

```powershell
Get-ChocolateyRealmjoinLogFilePath [[-operation] <string>] [[-target] <string>] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name      Aliases Description Required? Pipeline Input? Default Value
----      ------- ----------- --------- --------------- -------------
operation None                false     false                        
target    None                false     false                        
```

## Chocolatey Packages

### Install-ChocolateyRealmjoinPackage

#### Syntax

```powershell
Install-ChocolateyRealmjoinPackage [[-installerFileName] <string>] [[-installerFileChecksum] <string>] [[-msiTransforms] <string[]>] [[-msiTransformsCabs] <string[]>] [[-additionalArgs] <string[]>] [[-silentArgs] <string[]>] [[-validExitCodes] <int[]>] [[-installers] <psobject[]>] [[-preActions] <scriptblock>] [[-postActions] <scriptblock>] [[-installPackage] <bool>] [[-noInstallMessage] <string>] [-installerFileNameIsLocalPath] [<CommonParameters>]
```

#### Parameters

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

### Uninstall-ChocolateyRealmjoinPackage

#### Syntax

```powershell
Uninstall-ChocolateyRealmjoinPackage [[-uninstallerFile] <string>] [[-additionalArgs] <string[]>] [[-silentArgs] <string[]>] [[-validExitCodes] <int[]>] [[-subPackageName] <string>] [[-uninstallers] <psobject[]>] [[-uninstallInfo] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

#### Parameters

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

### Import-ChocolateyRealmjoinPackageParameters

#### Syntax

```powershell
Import-ChocolateyRealmjoinPackageParameters [[-params] <string>] [-setVariables] [-clearVariables] [-returnKeyValuePairs] [-returnParameterHashset] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name                   Aliases Description Required? Pipeline Input? Default Value
----                   ------- ----------- --------- --------------- -------------
clearVariables         None                false     false                        
params                 None                false     false                        
returnKeyValuePairs    None                false     false                        
returnParameterHashset None                false     false                        
setVariables           None                false     false                        
```

### Test-ChocolateyRealmjoinRegistryUninstallExists

#### Syntax

```powershell
Test-ChocolateyRealmjoinRegistryUninstallExists [[-keyNameFilter] <string>] [[-displayNameFilter] <string>] [[-publisherFilter] <string>] [[-versionGe] <version>] [[-versionGt] <version>] [[-versionLe] <version>] [[-versionLt] <version>] [[-filterScriptblock] <scriptblock>] [<CommonParameters>]
```

#### Parameters

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

### Get-ChocolateyRealmjoinRegistryUninstallInfo

#### Syntax

```powershell
Get-ChocolateyRealmjoinRegistryUninstallInfo [[-keyNameFilter] <string>] [[-displayNameFilter] <string>] [[-publisherFilter] <string>] [[-versionGe] <version>] [[-versionGt] <version>] [[-versionLe] <version>] [[-versionLt] <version>] [[-filterScriptblock] <scriptblock>] [<CommonParameters>]
```

#### Parameters

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

### Get-ChocolateyRealmjoinRegistryUninstallStrings

#### Syntax

```powershell
Get-ChocolateyRealmjoinRegistryUninstallStrings [-uninstallKeyNameFilter] <string> [<CommonParameters>]
```

#### Parameters

```no-highlight
Name                   Aliases Description Required? Pipeline Input? Default Value
----                   ------- ----------- --------- --------------- -------------
uninstallKeyNameFilter None                true      false                        
```

### Get-ChocolateyRealmjoinWebFile

#### Syntax

```powershell
Get-ChocolateyRealmjoinWebFile [[-fileName] <string>] [[-fileChecksum] <string>] [[-remoteFileName] <string>] [-extractArchive] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name           Aliases Description Required? Pipeline Input? Default Value
----           ------- ----------- --------- --------------- -------------
extractArchive None                false     false                        
fileChecksum   None                false     false                        
fileName       None                false     false                        
remoteFileName None                false     false                        
```

### Invoke-RealmjoinChocoPackageInstallation

#### Syntax

```powershell
Invoke-RealmjoinChocoPackageInstallation [[-packageName] <string>] [[-params] <hashtable>] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name        Aliases Description Required? Pipeline Input? Default Value
----        ------- ----------- --------- --------------- -------------
packageName None                false     false                        
params      None                false     false                        
```

## Command line

### Join-RealmjoinCommandLine

#### Syntax

```powershell
Join-RealmjoinCommandLine [[-CommandOnly] <string>] [[-ArgumentsOnly] <string>] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name          Aliases Description Required? Pipeline Input? Default Value
----          ------- ----------- --------- --------------- -------------
ArgumentsOnly None                false     false                        
CommandOnly   None                false     false                        
```

### Split-RealmjoinCommandLine

#### Syntax

```powershell
Split-RealmjoinCommandLine [[-CommandLine] <string>] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name        Aliases Description Required? Pipeline Input? Default Value
----        ------- ----------- --------- --------------- -------------
CommandLine None                false     false                        
```

### Get-RealmjoinCommandLineWithLauncher

#### Syntax

```powershell
Get-RealmjoinCommandLineWithLauncher [[-CommandLine] <string>] [[-CommandOnly] <string>] [[-ArgumentsOnly] <string>] [-ReturnSplit] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name          Aliases Description Required? Pipeline Input? Default Value
----          ------- ----------- --------- --------------- -------------
ArgumentsOnly None                false     false                        
CommandLine   None                false     false                        
CommandOnly   None                false     false                        
ReturnSplit   None                false     false                        
```

### Restart-RealmjoinComputer

#### Syntax

```powershell
Restart-RealmjoinComputer [[-Delay] <timespan>] [[-Message] <string>] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name    Aliases Description Required? Pipeline Input? Default Value
----    ------- ----------- --------- --------------- -------------
Delay   None                false     false                        
Message None                false     false                        
```

### Get-RealmjoinComputerSystemBiosVersion

#### Syntax

```powershell
Get-RealmjoinComputerSystemBiosVersion
```

### Get-RealmjoinComputerSystemModel

#### Syntax

```powershell
Get-RealmjoinComputerSystemModel [-IncludeDebugInfoIfUnsure] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name                     Aliases Description Required? Pipeline Input? Default Value
----                     ------- ----------- --------- --------------- -------------
IncludeDebugInfoIfUnsure None                false     false                        
```

## Custom States

### Out-RealmjoinCustomState

#### Syntax

```powershell
Out-RealmjoinCustomState [-Name] <string> [[-InputObject] <Object>] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name        Aliases Description Required? Pipeline Input? Default Value
----        ------- ----------- --------- --------------- -------------
InputObject None                false     true (ByValue)               
Name        None                true      false                        
```

### Remove-RealmjoinCustomState

#### Syntax

```powershell
Remove-RealmjoinCustomState [-Name] <string> [<CommonParameters>]
```

#### Parameters

```no-highlight
Name Aliases Description Required? Pipeline Input? Default Value
---- ------- ----------- --------- --------------- -------------
Name None                true      false                        
```

## Scheduled Tasks

### Register-RealmjoinCustomStateScheduledTask

#### Syntax

```powershell
Register-RealmjoinCustomStateScheduledTask [[-RepetitionInterval] <timespan>] [[-TaskName] <string>] [[-PublishStateScriptFile] <string>]
```

#### Parameters

```no-highlight
Name                   Aliases Description Required? Pipeline Input? Default Value
----                   ------- ----------- --------- --------------- -------------
PublishStateScriptFile None                false     false           ".\publishState.ps1"                        
RepetitionInterval     None                false     false           "1.00:00:00"             
TaskName               None                false     false           $env:packageTitle             
```

### Unregister-RealmjoinCustomStateScheduledTask

#### Syntax

```powershell
Unregister-RealmjoinCustomStateScheduledTask [[-TaskName] <string>] [[-PublishStateScriptFile] <string>]
```

#### Parameters

```no-highlight
Name                   Aliases Description Required? Pipeline Input? Default Value
----                   ------- ----------- --------- --------------- -------------
PublishStateScriptFile None                false     false                        
TaskName               None                false     false                        
```

### Get-RealmjoinInvocationParameters

#### Syntax

```powershell
Get-RealmjoinInvocationParameters [[-Invocation] <InvocationInfo>] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name       Aliases Description Required? Pipeline Input? Default Value
----       ------- ----------- --------- --------------- -------------
Invocation None                false     false                        
```

### Get-RealmjoinPathRooted

#### Syntax

```powershell
Get-RealmjoinPathRooted [[-Path] <string>] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name Aliases Description Required? Pipeline Input? Default Value
---- ------- ----------- --------- --------------- -------------
Path None                false     false                        
```

### New-RealmjoinScheduledTaskBootTrigger

#### Syntax

```powershell
New-RealmjoinScheduledTaskBootTrigger [[-Enabled] <bool>] [[-StartBoundary] <datetime>] [[-EndBoundary] <datetime>] [[-RepetitionInterval] <timespan>] [[-RepetitionDuration] <timespan>] [[-Delay] <timespan>] [<CommonParameters>]
```

#### Parameters

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

### New-RealmjoinScheduledTaskDailyTrigger

#### Syntax

```powershell
New-RealmjoinScheduledTaskDailyTrigger [[-Enabled] <bool>] [[-StartBoundary] <datetime>] [[-EndBoundary] <datetime>] [[-RepetitionInterval] <timespan>] [[-RepetitionDuration] <timespan>] [[-RandomDelay] <timespan>] [[-DaysInterval] <uint32>] [<CommonParameters>]
```

#### Parameters

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

### New-RealmjoinScheduledTaskLogonTrigger

#### Syntax

```powershell
New-RealmjoinScheduledTaskLogonTrigger [[-Enabled] <bool>] [[-StartBoundary] <datetime>] [[-EndBoundary] <datetime>] [[-RepetitionInterval] <timespan>] [[-RepetitionDuration] <timespan>] [[-Delay] <timespan>] [<CommonParameters>]
```

#### Parameters

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

### New-RealmjoinScheduledTaskTimeTrigger

#### Syntax

```powershell
New-RealmjoinScheduledTaskTimeTrigger [[-DelayFromNow] <timespan>] [[-Enabled] <bool>] [[-StartBoundary] <datetime>] [[-EndBoundary] <datetime>] [[-RepetitionInterval] <timespan>] [[-RepetitionDuration] <timespan>] [[-RandomDelay] <timespan>] [<CommonParameters>]
```

#### Parameters

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

### New-RealmjoinScheduledTaskXml

#### Syntax

```powershell
New-RealmjoinScheduledTaskXml [[-Principal] <ScheduledTaskPrincipal>] [[-Action] <Object[]>] [[-Trigger] <Object[]>] [[-Enabled] <bool>] [[-ExecutionTimeLimit] <timespan>] [[-TaskName] <string>] [-DeleteAfterFirstRun] [-Register] [-StartOnce] [<CommonParameters>]
```

#### Parameters

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

## Shortcuts

### New-RealmjoinShortcut

#### Syntax

```powershell
New-RealmjoinShortcut [-shortcutPath] <string> [-targetPath] <string> [[-targetArguments] <string>] [[-workingDirectory] <string>] [[-description] <string>] [[-iconLocation] <string>] [[-hotKey] <string>] [[-windowStyle] <int>] [-forCurrentUser] [-onDesktop] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name             Aliases Description Required? Pipeline Input? Default Value
----             ------- ----------- --------- --------------- -------------
description      None                false     false                        
forCurrentUser   None                false     false                        
hotKey           None                false     false                        
iconLocation     None                false     false                        
onDesktop        None                false     false                        
shortcutPath     None                true      false                        
targetArguments  None                false     false                        
targetPath       None                true      false                        
windowStyle      None                false     false                        
workingDirectory None                false     false                        
```

### Remove-RealmjoinShortcut

#### Syntax

```powershell
Remove-RealmjoinShortcut [-shortcutPath] <string> [-forCurrentUser] [-onDesktop] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name           Aliases Description Required? Pipeline Input? Default Value
----           ------- ----------- --------- --------------- -------------
forCurrentUser None                false     false                        
onDesktop      None                false     false                        
shortcutPath   None                true      false                        
```

### Format-RealmjoinShortcutPath

#### Syntax

```powershell
Format-RealmjoinShortcutPath [-shortcutPath] <string> [-forCurrentUser] [-onDesktop] [-doNotCheckCreateFolder] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name                   Aliases Description Required? Pipeline Input? Default Value
----                   ------- ----------- --------- --------------- -------------
doNotCheckCreateFolder None                false     false                        
forCurrentUser         None                false     false                        
onDesktop              None                false     false                        
shortcutPath           None                true      false                        
```

### Start-RealmjoinSoftwarePackageInstallation

#### Syntax

```powershell
Start-RealmjoinSoftwarePackageInstallation [[-packageName] <string>] [<CommonParameters>]
```

#### Parameters

```no-highlight
Name        Aliases Description Required? Pipeline Input? Default Value
----        ------- ----------- --------- --------------- -------------
packageName None                false     false
```