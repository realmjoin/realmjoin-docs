# Deploying the Agent

RealmJoin Agent can be deployed on a device using one of multiple ways - depending on the individual scenario. As a first step, download the RealmJoin installer of your choice and proceed to the desired installation method.

* Stable release (Automatic Deployment recommended instead):\
  [RealmJoin Release Version](https://gkrealmjoin.s3.amazonaws.com/win-release/RealmJoin.msi)
* Beta Channel (near to stable, for long term testing):\
  [RealmJoin Beta Version](https://gkrealmjoin.s3.amazonaws.com/win-beta/RealmJoin.msi)
* Canary Channel (Experimental, first testing):\
  [RealmJoin Canary Version](https://gkrealmjoin.s3.amazonaws.com/win-canary/RealmJoin.msi)

## Automatic Deployment using Microsoft Intune

RealmJoin directly integrates with your Microsoft Intune tenant. No downloading of the client is necessary. This method only deploys the stable release of the agent.

1. Head to the Package Store
2.  Select the RealmJoin Agent on the banner\


    <figure><img src="../.gitbook/assets/image (312).png" alt=""><figcaption></figcaption></figure>
3. Select your preferred deployment method and click "Continue"\
   ![](<../.gitbook/assets/image (313).png>)
4. Add users to the managed app groups for RealmJoin or directly on Intune, depending on preference
5. Intune will automatically deploy the RealmJoin Agent after some time

## Manual Deployment using Microsoft Intune

RealmJoin is able to be deploy through Microsoft Intune by deploying the MSI as a Line-of-Business app. This may be useful if you wish to deploy Beta or Canary versions using Intune.

### Intune Portal

Use the following instructions to deploy the RealmJoin Agent:

1. Navigate to **Microsoft Intune** and select **Apps > All Apps**

<figure><img src="../.gitbook/assets/image (311).png" alt=""><figcaption></figcaption></figure>

2. Then click **+ Add**
3. Under **Other** choose **Line-of-business-app** and click **Select**

![](<../.gitbook/assets/image (236).png>)

4. Next click **Select app package file**
5. As **App package file** browse for **RealmJoin.msi** on your device

![](<../.gitbook/assets/image (139).png>)

6. Then, click **OK**
7. Under **App information** fill in all required fields and set **Ignore app version** to **Yes**

![](<../.gitbook/assets/image (216).png>)

8. Under **Assignments** add groups and users for your RealmJoin app

![](<../.gitbook/assets/image (152).png>)

9. Under **Review + create** check all your settings

![](<../.gitbook/assets/image (121).png>)

10. Finally click **Create**

{% hint style="warning" %}
Like any other application in Intune, ReamJoin can be assigned to the desired user groups as (required) software. It is not necessary to install additional software on the client devices to run RealmJoin. RealmJoin will be deployed on the client devices on the next Intune sync.
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

The RealmJoin.MSI is SHA2 (256 bit) signed by RealmJoin and therefore recognized by Windows as safe to install.

![](<../.gitbook/assets/image (227).png>)

