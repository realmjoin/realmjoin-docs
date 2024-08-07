# Multi User Devices

Multi-User Devices allow an administrator to provision devices intended to be used by more than one user. A tool for Multi-User Devices is **Device Enrollment Manager** (short DEM).

DEM is an Intune permission that can be applied to an Azure Active Directory user account and lets the user enroll up to 1,000 devices. A DEM account is useful for scenarios where devices are enrolled and prepared before handing them out to the users of the devices.

RealmJoin Client can be used to allow self service software installations on Multi-User Devices.

## Licenses

Devices enrolled by DEM accounts need to be licensed. Therefore, each DEM account needs an Intune user or device license assigned.

Example:

* Enterprise Mobility + Security (user license) or
* A simple device license

![](<../../.gitbook/assets/spaces\_-LoFsqW9gZ0AjMnSuPaT\_uploads\_git-blob-47c2a54892a3e4fa7b50f6cc14d1c3fb376dcefb\_dem1 (1).png>)

## Preparations

Before you can start with a device enrollment you have to do some preparations.

### Create DEM User

Create a generic user account that is not assigned to a real person. Please make sure that this account never gets deleted. In that case, enrolled devices will not stay under management anymore. Assign a suitable Intune license as described before.

![](<../../.gitbook/assets/spaces\_-LoFsqW9gZ0AjMnSuPaT\_uploads\_git-blob-d9ea0b7aef42bb8e641fd934ae909a57f19a7b92\_dem2 (1).png>)

### Create User Group for DEM Accounts

A new user group is necessary that contains all DEM users. Ad one (e.g. **CFG - All multi-user device accounts DEM**) and assign the previously created user.

![](<../../.gitbook/assets/spaces\_-LoFsqW9gZ0AjMnSuPaT\_uploads\_git-blob-aa7ab331b291cec2a175fc45db6c7d114c817fa7\_dem3 (1) (1).png>)

### Prepare Group

In **Intune** the following actions are necessary for that group:

* Assign compliance policies and device configurations (that should apply for these devices)
* Assign Intune distributed apps (e. g. RealmJoin Installer)
* Check if DEM group can enroll and register new devices in Tune/Azure AD (e. g. enrollment restrictions and Azure AD Join)

The following steps must be done in **RealmJoin**

* Add RealmJoin configuration policies to that group
* Add Software packages (that should be installed when the device is set up by DEM account)
* Let Glück & Kanja mark this group as **Primary Users** (obtain Azure AD Object ID)

## Device Setup

A new and clean device will be set up with the DEM user account created before:

![](<../../.gitbook/assets/spaces\_-LoFsqW9gZ0AjMnSuPaT\_uploads\_git-blob-578ad5cd4ba355fca1a666221331513599318cfa\_dem5 (1).png>)

Depending on configuration second factor authentication will be enforced:

![](<../../.gitbook/assets/spaces\_-LoFsqW9gZ0AjMnSuPaT\_uploads\_git-blob-02a403937e7746d021079b8e52cef29d6145c65c\_dem6 (1).png>)

Device enrollment and provisioning will start:

![](<../../.gitbook/assets/spaces\_-LoFsqW9gZ0AjMnSuPaT\_uploads\_git-blob-ee84cba5c366ade4e57c27b5f0c868d7968dae9e\_dem7 (1) (1) (1) (1) (1).png>)

Prompt for Windows Hello setup appears (depending on configuration):

![](<../../.gitbook/assets/spaces\_-LoFsqW9gZ0AjMnSuPaT\_uploads\_git-blob-d2f944ba10dc06d977c35583d9c123b972fa1265\_dem8 (1) (1).png>)

After that, RealmJoin will start and install the defined set of software for the DEM account:

![](<../../.gitbook/assets/spaces\_-LoFsqW9gZ0AjMnSuPaT\_uploads\_git-blob-db3e50950cdc154e9a54dd6f26280cee04d69a3e\_dem9 (1).png>)

When logging in via DEM account (primary user) the software should be installed:

![](<../../.gitbook/assets/spaces\_-LoFsqW9gZ0AjMnSuPaT\_uploads\_git-blob-f59dd6e4b4073ec8485a48bb7a23bb0266f0f0ed\_dem10 (1).png>)

## Secondary User Experience

Secondary users are now able to log in:

![](<../../.gitbook/assets/spaces\_-LoFsqW9gZ0AjMnSuPaT\_uploads\_git-blob-5bae77229a33711fec36d362ca64e15572695694\_dem11 (1).png>)

Software assigned and installed by DEM account should be available

Additional software can be installed by this secondary user:

![](<../../.gitbook/assets/spaces\_-LoFsqW9gZ0AjMnSuPaT\_uploads\_git-blob-00a6e4efde40c57f2ac2d4694ce3e3139fd21c11\_dem13 (1).png>)

![](<../../.gitbook/assets/spaces\_-LoFsqW9gZ0AjMnSuPaT\_uploads\_git-blob-3e07ce7d949c749c80ed39867bf0f030fc5a5d63\_dem14 (1).png>)

![](<../../.gitbook/assets/spaces\_-LoFsqW9gZ0AjMnSuPaT\_uploads\_git-blob-c83bb44f418d491bbe9ea18e1675b8efeb872148\_dem15 (1).png>)
