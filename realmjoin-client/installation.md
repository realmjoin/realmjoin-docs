# Deploying the Client

RealmJoin Client can be deployed on a device using one of multiple ways - depending on the individual scenario. As a first step, download the RealmJoin installer of your choice and preceed to the desired installation method.

Stable release:\
[RealmJoin Release Version](https://gkrealmjoin.s3.amazonaws.com/win-release/RealmJoin.msi)

Beta Channel (near to stable, for long time testing):\
[RealmJoin Beta Version](https://gkrealmjoin.s3.amazonaws.com/win-beta/RealmJoin.msi)

Canary Channel (Experimental, first testing):\
[RealmJoin Canary Version](https://gkrealmjoin.s3.amazonaws.com/win-canary/RealmJoin.msi)

## Install using Microsoft Intune

RealmJoin has to deploy through Microsoft Intune by deploying the MSI as a Line-of-Business app. The following article is a step-by-step guide to deploy RealmJoin.

### Azure Intune Portal

Use the following instructions to deploy RealmJoin:

* Log in to your [Azure portal](https://portal.azure.com/)
* Navigate to **Microsoft Intune** and select **Client apps**

![](<../.gitbook/assets/image (6) (1).png>)

* Then select **Apps** and click **+Add**

![](<../.gitbook/assets/image (5) (1).png>)

* Under **Other** choose **Line-of-business-app** and click **Select**

![](<../.gitbook/assets/image (12) (1) (1) (2).png>)

* Next click **Select app package file**
* As **App package file** browse for **RealmJoin.msi** on your device

![](<../.gitbook/assets/image (19) (1) (1).png>)

* Then, click **OK**
* Under **App information** fill in all required fields and set **Ignore app version** to **Yes**

![](<../.gitbook/assets/image (15) (1) (1).png>)

* Under **Assignments** add groups and users for your RealmJoin app

![](<../.gitbook/assets/image (10) (1) (1).png>)

* Under **Review + create** check all your settings

![](<../.gitbook/assets/image (14) (1) (1).png>)

* Finally click **Create**

{% hint style="warning" %}
Like any other application in Intune, ReamJoin can be assigned to the desired user groups as (required) software. It is not necessary to install additional software on the client devices to run RealmJoin. RealmJoin will be deployed on the client devices on the next Azure sync.
{% endhint %}

### Windows Defender Exceptions

RealmJoin has worked with the Microsoft Defender Team to be whitelisted from malware detection. Since Defender is using more and more machine learning mechanisms to identify potential threats and RealmJoin has several features like cloud downloaded application installations, RealmJoin might be recognized by **Windows Defender** as a possible threat.

While this behavior is not certain, it is recommended to implement additional Windows Defender exceptions. Create a new device configuration profile, type **Device restriction**, or edit your existing profile and add the following **Windows Defender Antivirus Exceptions**:

| Defender Exceptions                             |
| ----------------------------------------------- |
| **Files and Folders**                           |
| `%ProgramFiles%\RealmJoin`                      |
| `%ProgramFiles%\RealmJoin\RealmJoin.exe`        |
| `%ProgramFiles%\RealmJoin\RealmJoinService.exe` |
| `%ProgramFiles%\RealmJoin\RealmJoinUpdate.exe`  |
| **Processes**                                   |
| `%ProgramFiles%\RealmJoin`                      |
| `%ProgramFiles%\RealmJoin\RealmJoin.exe`        |
| `%ProgramFiles%\RealmJoin\RealmJoinService.exe` |
| `%ProgramFiles%\RealmJoin\RealmJoinUpdate.exe`  |

{% hint style="info" %}
It\`s important to configure the same path in **Files and Folders** and **Processes**. In some cases, Microsoft only checks one of this Defender Exceptions.
{% endhint %}

## Interactive Installation

If an administrator wants to install RealmJoin on a device without mass deployment or the Microsoft Intune infrastructure, he/she may download the MSI and do an interactive installation or copy one of the command lines below to download and run in a single step.

### Command Line Installation

You may download and install RealmJoin in a single step by using the following command lines. This may help especially when testing scenarios or new software packages in virtual machines.

#### Release Channel:

```
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "((new-object net.webclient).DownloadFile('https://gkrealmjoin.s3.amazonaws.com/win-release/RealmJoin.exe', 'realmjoin.exe'))" && .\realmjoin.exe
```

#### Beta Channel:

```
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "((new-object net.webclient).DownloadFile('https://gkrealmjoin.s3.amazonaws.com/win-beta/RealmJoin.exe', 'realmjoin.exe'))" && .\realmjoin.exe
```

#### Canary Channel:

```
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "((new-object net.webclient).DownloadFile('https://gkrealmjoin.s3.amazonaws.com/win-canary/RealmJoin.exe', 'realmjoin.exe'))" && .\realmjoin.exe
```

### Silent Installation

When installing RealmJoin during unattended OS installation or any other non-interactive deployment method you may decide not to have any UI interaction during installation. To install RealmJoin in such a scenario, use the silent installation option:

```
reamjoin.exe -install
```

## Additional Infos

### Signed MSI

The RealmJoin.MSI is SHA2 (256 bit) signed by GK and therefore recognized by Windows as safe to install.

![](<../.gitbook/assets/image (16) (1) (1).png>)

