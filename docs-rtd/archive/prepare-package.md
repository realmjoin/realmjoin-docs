
# Prepare Package

This article is about **Creating Packages**. It will show you the basic steps in creating Craft, Chocolatey, Chocolatey App-V and Organic packages. While all types follow the same rough outline, there are some differences when handling the packages.

We will start this article with a figure to get an overview of the RealmJoin package distribution ecosystem:

[![RJ ecosystem](./media/rj-ecosystem.png)](./media/rj-ecosystem.png)
  
All packaging processes will be demonstrated with a VLC player package.

## Use Jumpstarter to Create a Repository

Glück & Kanja uses a self-developed **Jumpstarter** script which helps creating the template for a new package. It is free to use without support. To start the Jumpstarter run the following code in a cmd shell:

```
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/realmjoin/realmjoin-package-jumpstarter/master/JumpstartRealmJoinPackage.ps1'))"
```

Optional parameters are ``-DoNotCloneRepository`` and ``-DoNotCopyTemplate``.

After the execution the following prompt appears and asks to specify details:

```
Repository path (leave empty for current folder name, Format: {VENDOR}-{PRODUCTNAME}): videolan-vlc
Repository name (leave empty for repository path): Videolan VLC Player
Repository namespace (leave empty for 'generic-packages', Format: {CUSTOMER}-packages): (your namespace)
Personal Access Token:(your token)
Cloning into....[installation messages]
[...]
Possible Packagetypes:
  [0] Copy all samples
  [1] Chocolatey
  [2] Chocolatey and Usersettings
  [3] Craft
Please enter the type of package. (all samples found in: '.realmjoin-gitlab-ci-helpers'): 1
Please enter the PackageVersion (Format: 1.0.0.0): w.x.y.z
```

> [!IMPORTANT]
> **Capitalization and Naming**  
> Use only small letters for the repository path and use 'vendor-program' as folder name.
>
> **Version numbering**  
> Software packages are assigned an individual version number. The package version must be divided in four numbers: W.X.Y.Z
>
> Best practices for version numbering:
>
> * For non-chocolatey packages we suggest, to use **W** as major release number, **X** as major sub-version, **Y** as minor release number and **Z** as (re-)packaging number (when rebuilding the package without changes in software but in the build itself).
> * For Chocolatey packages it is recommended to use the software's version number, and use **Z** as (re-)packing number. If the software itself has a four part version number, Chocolatey suggests to multiply the **Z** by 100 and increase the number by 1 every (re-)packaging. If some parts of the version number have leading zeroes those must be removed.
>
> For example: The software version number is 1.02.3.4, suggested package version would be 1.2.3.400

After Jumpstarter has finished, a new repository is created and the template files are copied into the local package folder. Files which are not necessary for the selected package type will be deleted. If the correct package version and type are selected, it is not necessary to edit the `choco-package.nuspec` and `.gitlab-ci.yml` files. Nevertheless it is highly recommended to check those files for consistency.

Depending on the package type you have chose, navigate to the [Chocolatey Package](create-choco-package.md) or [Craft Package](create-craft-package.md).

### Jumpstarter Beta

RealmJoin and the automatization tools are constantly adapted and refined. Advanced features are implemented and tested in a beta branch. The beta version of the Jumpstarter script can be used by running the following code in a cmd shell:

```
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/realmjoin/realmjoin-package-jumpstarter/raw/beta/JumpstartRealmJoinPackage.ps1'))"
```
