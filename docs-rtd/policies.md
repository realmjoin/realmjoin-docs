
# Settings and Policies

After installing the RealmJoin client on the device, a configuration is saved locally. This configuration is encrypted and cannot be modified by the user. RealmJoin compares the hash value of the local configuration to the hash value of the configuration for this user on the back-end. If the hash deviates, the configuration is re-synced from the server to the local device. The configuration is signed with the server's public key, therefore the local RealmJoin client can validate the configuration.

## Delivery Optimization for Windows Update

**Windows Update Delivery Optimization** (WUDO) is a self-organized solution for distributed caches for Windows Updates. In default mode, WUDO identifies peers as part of a WAN based on their external IP. In case of stretched out WANs with just one breakout point, this leads to a high network load and a bottleneck.  
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
