
# Settings and Policies

After installing the RealmJoin client on the device, a configuration is saved locally. This configuration is encrypted and cannot be modified by the user. RealmJoin compares the hash value of the local configuration to the hash value of the configuration for this user on the back-end. If the hash deviates, the configuration is re-synced from the server to the local device. The configuration is signed with the server's public key, therefore the local RealmJoin client can validate the configuration.

## Delivery Optimization for Windows Update

**Windows Update Delivery Optimization** (or WUDO) is a self-organized solution for distributed caches for Windows Updates. In default mode, WUDO identifies peers as part of a WAN based on their external IP. In case of stretched out WANs with just one breakout point, this leads to a high network load and a bottleneck.  
To improve the handling, Microsoft Intune can be used to set WUDO to **DownloadMode=2**, where peers are grouped by a groupID. The ID (GUID) is set for each device using network fingerprinting and the MAC address of the default gateway and therefore creating a more localized group. RealmJoin can be used to set the groupID for each client.

The following registry key is set to define the DOGroupID:  
  
### Network-Fingerprint-GUID in Reg-Key

```
HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization\DOGroupId
HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization\GroupId
```
Remember to set the Download Mode to Group via Windows Update settings in Intune:
```
Delivery optimization download mode: HTTP blended with peering across private group
```

This is effectively **DownloadMode=2**. Opting-out of setting the groupID via RealmJoin can be done by setting the [Policies.SetNetworkOptimizationID](http://docs.realmjoin.com/policies.html#policies) to **false**.  
  
For more on WUDO see the [Microsoft WUDO documentation (DE)](https://docs.microsoft.com/de-de/windows/deployment/update/waas-delivery-optimization).

## BitLocker

### BitLocker enforcement

It is possible to force BitLocker encryption for OS volumes. The configuration file (see chapter [Policies](http://docs.realmjoin.com/policies.html#policies)) allows to set the switch **BitlockerEnabled** to **true**. If the device is equipped with a **ready state** TPM chip the encryption is activated. To allow the BitLocker enforcement, the registry key

```HKLM\SYSTEM\CurrentControlSet\Control\BitLocker:PreventDeviceEncryption```

is set to **false**.

For virtual machines the encryption is only enforced, if the virtual machine variable

```$env:RjDisableVmDetection=1```

is set.

### BitLocker recovery key

If the client device is Azure AD joined, RealmJoin uploads the BitLocker recovery key to Azure AD. If the upload is not successful on first try, it will be retried. If the upload cannot be performed successfully, the RealmJoin rollout fails.
In case of a **non-AAD-joined** device, the BitLocker recovery key is not saved anywhere.

## Domain password expiry

RealmJoin uses the Azure AD attribute

```msDS-UserPasswordExpiryTimeComputed```

to check if the user password is expired.

## Intranet Zone

Site may be added to the **Intranet Zone** (in Internet Options) by specifying a setting with the key `Policies.TrustedSites` and an array of URLs. These URLs are parsed by RealmJoin and written to a registry key called **ZoneMap**.

One might specify the following JSON array:

```json
["file://example.com", "https://foo.example.com"]
```

Which will result in the following rules:

[![Policies.TrustedSites](./media/rj-policies-trustedSites.png)}(./media/rj-policies-trustedSites.png)

### Caveats

* Windows will interpret a naked domain like `file://example.com` as `file://*.example.com`.
* RealmJoin does not allow for wildcard protocols. You must specify all protocols explicitly.
* RealmJoin will manage all protocols for a configured domain and remove any user added protocols.
* RealmJoin will not manage other domains which are not configured in this setting.

### Recommendations

Many customers have extensive Intranet Zone list. Clean it up! Investigate whether a site works without adding it to the Intranet Zone.

* Add a site using `https` protocol if it uses Integrated Windows Authentication or other legacy features like ActiveX.
* Add a server using `file` protocol if it is accessed using SMB.

## Other Configuration Settings

Comments on the individual settings in *italics*  

- Key: "Environment"

```JSON
   "UpdateCheckInterval": "01:00"
   "ConfigCheckInterval": "00:30"
 ```

 *Set as "hh:mm"*

- Key: "FirstRun"

  ```JSON
  "EnableSecureDesktop": true
  ```

     *Enable the Windows *secure desktop* feature*  

- Key: "Realm"

  ```JSON
   "Domain": "glueckkanja.net"
   "NetBIOS": "GLUECKKANJA"
  ```  

- Key: "DomainConnect"

  ```JSON
   "Domain": "glueckkanja.net",
   "NetBIOS": "GLUECKKANJA",
   "CheckInterval": "01:00"  
  ```  
  
 - Key: "CredentialManager":

     ```JSON
    "Type": "wlan",  
         * "Target": "GKEnterprise" 
    "Type": "ntlm",
         * "Target": "identity.glueckkanja.net",
    "Type": "smb",  
         * "Target": "files.glueckkanja.net",
         * "Share": "Filestore"  
     ``` 

*Allows to configure WAN/LAN connections and manage authentication*

- Key: "IpSec":

```JSON
    "Rules":
       * "Name": "Domain Controller - glueckkanja.net",
       * "Targets": "glueckkanja.net",
       * "Protocol": "tcp",
       * "Range": "135,389,445,30000-30400",
       * "RangeOSX": "135,389,445",
       * "Key": "xxxxxxxxxxxxxxxxxxxxx"  
```

- Key: "Branchbox":

```JSON
    "RescanInterval": "00:15",  
    "Rules": 
       * "Name": "Branchbox",
       * "Target": "files.glueckkanja.net",
       * "IPs": "172.27.0.20",
       * "CheckPort": 63069,
       * "CN": "*.glueckkanja.net"  
```

- Key: "CloudVPN":

```JSON
   "Gateway": "cloudvpn.gkdatacenter.net",
   "Username": "",
   "Password": ""  
```

- Key: "WebLinks":

```JSON
    "Name": "GK Help",
    "Target": "https://help.glueckkanja.net/",
    "Platform": "any"  
```

> [!NOTE]
> It is possible to direct the link to a specific application or process to be started with. To do so, the target has to be set to the process and optional args can be provided. Additionally, for edge, the protocol handler can be used:

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

- Key: "BranchCache":

```JSON
 "Mode": "Distributed"  
```

- Key: "Chocolatey":

```JSON
   { "Version": "0.10.3",  
    "Sources":
    "Name": "gkpackages",
    "Source": "https://packages.gkdatacenter.net/nuget",
    "User": "packages",
    "Password": "xxxxxxxxxxxxxxxxxxxxx",
    "Priority": 10
   }
```

- Key: "SoftwarePackages":

```JSON
    "Package": "bcurl",
    "ID": "bcurl",
    "Platform": "winchoco",
    "Version": "1.0.11",
    "Args": "",
    "Name": "BcUrl",
    "Order": 500,
    "PreRelease": false,
    "AllowReinstall": false,
    "DependsOn": [],
    "AutoUpgrade": true,
    "AutoUpgradeStaggered": "",
    "GroupName": "Development",
    "Hidden": false,
    "Mandatory": false  
```

- Key:

```JSON
"Location": "https://packages.gkdatacenter.net/blobs/v1.0.0.0.zip",
  * "Hash": "46298d7dfe399cc46bd62ee359ab983771f5bcf1",
  * "Scope": "user",
  * "ID": "glueckkanja-core-settings-wlan-gkenterprise",
  * "Platform": "win",
  * "Version": "1.0.0.0",
  * "Args": "",
  * "Name": "GK WLAN (GKEnterprise)",
  * "Order": 999999,
  * "PreRelease": false,
  * "AllowReinstall": false,
  * "DependsOn": [],
  * "AutoUpgrade": true,
  * "AutoUpgradeStaggered": "",
  * "GroupName": "Glueckkanja",
  * "Hidden": false,
  * "Mandatory": false  
```

### Policies  

Comments on the individual settings in *italics*  

- Key: "Policies":

```JSON
  * "SMimeEnabled": false,
  * "OsActivationEnabled": false,
  * "SetTimeserver": ["time.windows.com", "time.apple.com"],
  * "TrustedSites": ["file://glueckkanja.net", "https://glueckkanja.net"],
 ```  

- Key: "RequireSecurityFeatures"

```JSON
    * "WinVersion": "Win7",
    * "BitlockerEnabled": null,  
         
          Entry: *PreventDeviceEncryption*;
          Value: *null* / *false*
         * The BitLocker key is synced to AAD if the client is AAD-joined, otherwise no backup will be made.
    * "FirewallEnabled": true,
    * "AvEnabled": null,
    * "EnvironmentCheck": null  
```

If set to **true**, BitLocker will be enforced if the device has a TPM.  
The following key value is changed to allow BitLocker force:  
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\BitLocker  

  - Key: "SetCurrentUserAdministrator": null

    *Recommended setting: Set to "false" for all users. This removes the administrator privileges for all users. Set to "true" for all users that should have local admin privileges. The privileges are only granted to users on clients where they are the primary user/device owner.*  

  - Key: "SetNetworkOptimizationID": null  
    *Opt-out from using a DOGroupID from Realmjoin*

  - Key: "AwsAccess":

    ```JSON
     "AccessKey": "AKIAIHFASK3VCX4EWCAA",
     "SecretKey": "xxxxxxxxxxxxxxxxxxxxx"
    ```

- Key: "DisableExplorerLibraries": true
  
- Key: "Rms":

```JSON
     "Enabled": null,
     "Hostname": "12323815-123c-123a-1230-123aab12ba3a.rms.eu.aadrm.com"
```

- Key: "OneDrive":

```JSON
     "Enabled": false,
     "DisplayName": "OneDrive Business",
     "FolderRedirection": false,
     "DisableOneDrivePersonal": false,
     "DisableStartupShortcut": false
```

- Key: "Office":

```JSON
     "NoDomainKey": false,
     "SetGenericCredentials": false,
     "SetLyncUsername": false
```

### Client

 - Key: "Client":

```JSON
    "IsPrimaryOfUser": true
```

#### Autogenerated by the server

The **IsPrimaryOfUser** attribute is set when the RealmJoin client on the device contacts the back-end for the first time. The user who is signed on during this process is registered as primary user of the device.  
Mandatory packages will only be installed when the primary user is logged in. If the **makeAdmin** property is set in the user/group settings, the primary user is promoted to administrator.
It is possibly to manually set another user to the primary of the device. If a device is decommissioned and given another user without changing the primary, the old primary user might persist in the back-end.

### Signatures

RealmJoin provides Outlook with signature files. Those files can be found in:

* %userprofile%\AppData\Roaming\Microsoft\Signatures
    * .\anyname.txt
    * .\anyname.htm

The following fields for signatures are extracted from the Microsoft Graph API and may be used:

```
Graph_User_BusinessPhone  
Graph_User_City  
Graph_User_CompanyName  
Graph_User_Country  
Graph_User_Department  
Graph_User_DisplayName  
Graph_User_GivenName  
Graph_User_Id  
Graph_User_JobTitle  
Graph_User_Mail  
Graph_User_MobilePhone  
Graph_User_OfficeLocation  
Graph_User_PostalCode  
Graph_User_State  
Graph_User_StreetAddress  
Graph_User_Surname  
```