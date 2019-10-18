
# Chocolatey Package

After the repository creation and preparation of packaging with Jumpstarter this article will show you all necessary steps to edit, customize and deploy a Chocolatey package.

## Edit Package files

Before you can deploy a package to the RealmJoin app store you have to edit your package. The following section will show you how can edit your package files.

### `.gitlab-ci.yml`

The `.gitlab-ci.yml`file contains the build and deploy information. In the **build** stage, the `build-deploy.ps1` helper script is called, while the argument `-build` indicates the **build** stage and `-choco` indicates the package type Chocolatey.  
In the **deploy** stage, the `build-deploy.ps1` helper script is called, while the argument `-deploy` indicates the **deploy** stage and `-choco` indicates the package type Chocolatey.

There are 6 different sample files (might be already deleted when using the Jumpstarter script and selecting a specific package type), while those starting with `Sample1*` are considered outdated. Therefore, select and edit the most fitting `Sample0*.gitlab-ci.yml` file and delete the other ones. You might need to adjust the content. Remove the prefix of the filename and save it as `.gitlab-ci.yml`.

### `choco-package.nuspec`

The `choco-package.nuspec` file contains the metadata according to the desired software. If you did not use Jumpstarter manually edit the following values:

  * id: **flavour-vendor-program**. This is the chocolatey package ID.
  * version: Package version **W.X.Y.Z**.
  * title: Displayed name of the package.
  * description: Description of the package.

[![RJ package-nuspec](./media/rj-package-nuspec1.png)](./media/rj-package-nuspec1.png)  

### Move binaries

Move the executables, installer or zip files into the subfolder `blobs`. Make sure the file names do not contain spaces or irregular characters but do contain the version number.
  
### Create SHA256 hash

Inside the `blobs` subfolder run `mk_hash.cmd`. Alternatively open a PowerShell, navigate to `blobs` subfolder and execute the following command:

```
Get-ChildItem | % {(Get-FileHash $_.name).hash + " *" + $_.name | out-file ($_.name + ".sha256")}
```

A `*.sha256` file is created for every item in the folder.

### Customize `tools\chocolateyInstall.ps1`

Based on the samples in the file, choose the most fitting one and adapt accordingly. To add silent installation parameters, use the `-silentArgs` parameter. If the setup file is a MSI file, silent installation arguments are automatically added. For additional arguments (like components) use additional `-additionalArgs`.
  
[![RJ package-install](./media/rj-package-install.png)](./media/rj-package-install.png)

### Customize `tools\userInstall.ps1`

If your Chocolatey package contains user settings place a `userInstall.ps1` file inside the `tools` folder. If you used Jumpstarter this file should already exist.

This file may contain various modifications and adjustments, e.g. registry keys.

### Additional Files

Additional files that maybe needed during the installation should be placed inside the `tools` folder. Examples are .reg or .ini files. If those files exceed a file size of approx. 1 MB they should better be placed inside the `blobs` folder.

### Rewrite `Readme.md`

If you have any further information you can write them down in the `Readme.md`, like a short documentation or a internal messages. If you do not need a `Readme.md` you can safely delete it.

### Customize Store Information

For listing the package in the RealmJoin app store four additional files are needed, which should have already been created by using Jumpstarter. If the packages should not be listed in the app store you can safely delete these fours files:

These are the needed files:

* `package-description.md`: Short description of the packaged application
* `package-icon.png`: The application icon. Must be .png, preferably high-res and quadratic.
* `package-info.json`: Contains information for the app store, mainly categories and package settings (e. g. `autoUpgrade`, `hasUserPart`)
* `package-technicalhelp.md`: Explanation of possible package installation arguments and further noteworthy information, like auto update mechanism or autostart.

The following screenshot shows a Google Chrome package in the RealmJoin app store (VLC Player has no Technical Help content, therefore we use Google Chrome in this example.). You can see the Google Chrome icon (`package-icon.png`), a short description about Google Chrome (`package-description.md`) and you can further technical information (`package-technicalhelp.md`). You do not see `package-info.json` because it works in the background.

[![Customize Store Information](./media/rj-store-info.png)](./media/rj-store-info.png)

## Commit and Upload

Commit your changes and push the project to GitLab.

## Deploy a Package

1. Open the project site in the RealmJoin GitLab with a browser.
2. Navigate to **Pipelines**, which can be found under the **CI / CD** section on the left side.
3. For each commit you will see two stages:
    * The first one, **build**, will start automatically
    * After **build** has finished (green checkmark), run the second one, **deploy**. To do that, first click the grey icon next to the green checkmark, then click the play button.

[![RJ Pipelines](./media/rj-pipeline-choco-deploy.png)](./media/rj-pipline-choco-deploy.png)

[![RJ package-deploy](./media/rj-package-choco-deploy.png)](./media/rj-package-choco-deploy.png)

After the successful deployment, the package can be found in the Chocolatey library and can be added to the RealmJoin backend. See chapter [Managing RealmJoin](managing-realmjoin.md) for information on assigning packages.  

## Advanced Packaging Functions

This section gives some details about features that may be used or needed in more complex Chocolatey packages.

### Installers in zip-files

In some cases **.msi** or **.exe** installers require additional files in their execution folder. It is possible to merge the installer and additional files in a zip container and execute the installer without unpacking forehand.

To do so, the zip container is put into the `blobs` folder and a hash value has to be created. In the `chocolateyInstall.ps1`, the install command may be used as usual, but the installer file has to be escaped with **#**, installation parameters can be provided the usual way:

```
 Install-ChocolateyRealmjoinPackage "CONTAINER.zip#INSTALLER.msi" "HASH" -additionalArgs "KEY=12345"
```

### Installation Pre-Actions

The `Install-ChocolateyRealmjoinPackage` command can be run with the execution of pre-actions, which will be executed before the setup starts:

```
Install-ChocolateyRealmjoinPackage "INSTALLER.msi" "HASH" -preActions { Copy-Item -force "$packageToolsFolder\Oracle CONFIG.ini" $setupFolder }
```

### Installation Post-Actions

The `Install-ChocolateyRealmjoinPackage` command can be run with the execution of post-actions, which will be executed after the setup finished successfully:

```
Install-ChocolateyRealmjoinPackage "INSTALLER.msi" "HASH" -postActions { Remove-Item "$env:PUBLIC\Desktop\SHORTCUT.lnk" -ErrorAction SilentlyContinue }
```

### Parameters in Chocolatey packages

To utilize parameters in Chocolatey packages, which have been entered in the optional [args](http://docs.realmjoin.com/managing-realmjoin.html#add-packages) text field, you need to the include the following cmdlet in your `chocolateyInstall.ps1` script:

`Import-ChocolateyRealmjoinPackageParameters`

The Chocolatey extension now parses the argument string and automatically creates and fills the variables with the following pattern:

| Arg name | Variable name |
| -------- | ------------- |
| `/Key:xx-yy-zz` | `$packParamKey` (with value `xx-yy-zz`) |
| `/Language:EN` | `$packParamLanguage` (with value `EN`) |

Those variables may now be used for any purposes within the `chocolateyInstall.ps1` script.
