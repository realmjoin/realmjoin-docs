---
title: Show Bitlocker Recovery Key
description: Show the BitLocker recovery keys of this device
---

## Description
Lists all BitLocker recovery keys backed up for this device, newest first, for disk recovery. Nothing is changed. Optionally the keys are withheld when Microsoft Defender for Endpoint rates the device as medium or high risk. That way the keys are not handed out before the security team has been involved, in case the device is under investigation.

## Only show keys if the device is not at risk

When *Only show keys if device is not at risk* (`skipIfAtRisk`) is enabled, the runbook checks the device's risk score in Microsoft Defender for Endpoint before any recovery key is retrieved. The lookup uses the Entra device ID and is the same query the **Check Defender Status** runbook performs. The check is off by default.

Possible outcomes:

- **No elevated risk** (risk score `None`, `Informational` or `Low`): the recovery keys are shown as usual.
- **Risk score `Medium` or `High`**: the runbook stops with a warning before any key is read. A device with an elevated risk score may be involved in a security incident, and disclosing its recovery key could expose the encrypted data to an attacker. Align with your security team first; to show the keys anyway, run the runbook with the option disabled.
- **Device not found in Defender for Endpoint**: the risk score cannot be determined. The runbook notes this and proceeds with the key retrieval, so devices that are not onboarded to Defender are not blocked.
- **Device found, but without a risk score** (e.g. freshly onboarded): the runbook notes this and proceeds as well.
- **Defender query fails**: the runbook stops without showing any key, so a temporary API problem never bypasses the protection.

### Enable the check by default

To enforce the check for every request, preset the parameter and hide it, so it cannot be switched off from the portal.

The json configuration for this is as follows:

```json
"rjgit-device_security_show-bitlocker-recovery-key": {
    "parameters": {
        "skipIfAtRisk": {
            "Default": true,
            "Hide": true
        }
    }
}
```


## Location
Device → Security → Show Bitlocker Recovery Key

**Full Runbook name**

rjgit-device_security_show-bitlocker-recovery-key

## Details

| Property | Value |
| --- | --- |
| Version | 1.1.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9) |
| Schedulable | no |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - BitlockerKey.Read.All
    - *Lists the device's BitLocker recovery keys and reads the key value for display*
- **Type**: WindowsDefenderATP
  - Machine.Read.All *(optional — feature: Defender risk check)*
    - *Reads the device's Defender risk score in the skipIfAtRisk preflight*


## Parameters
### DeviceId

Entra ID device ID of the device the runbook acts on. Set by the portal from the selected device.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### skipIfAtRisk

Withholds the keys when Microsoft Defender for Endpoint rates the device as medium or high risk, so the security team can be consulted first. Devices unknown to Defender are not blocked.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Only show keys if the device is not at risk? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Only show keys if the Defender risk score is not medium or high | true |
| Show keys regardless of the Defender risk score | false |



[Back to Runbook Reference overview](../../README.md)

