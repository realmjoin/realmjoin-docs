
# Updating Packages

The process of updating an existing package is fairly simple. Assumed you only update to a newer setup file.

## GitClone of Current Repository

Using a Git tool of your choice, clone the current repository onto your local client. If you already have a local clone make sure to perform a pull request to update it and avoid conflicts.

## Content Update

Place the updated binaries inside the `blobs` folder. Make sure to include the new version number in the file names and delete the old binaries. Furthermore update the code in the `rj_install.ps1` or `chocolateyInstall.ps1` scripts.

## Versioning

Make sure to update:

1. The package version in the `.nuspec` or `rj_install.ps1` file, either the revision number or the complete software version.
2. The version of the executable/installer/zip file, if any content was changed. This is mandatory because when the binaries from the `blobs` folder are pushed to the CDN during the deploy process, possibly existing files with the same name are never overwritten.

## Push and Deploy

After all updates and bug fixes are implemented, the changes have to be committed and pushed into the master repository. The build job will automatically start and the new version of the package may then be deployed and tested as usual.
