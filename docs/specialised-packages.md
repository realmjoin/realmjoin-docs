
# Specialised Packages

## WLAN packages

Glück & Kanja provides two different approaches to WLAN packages, which allow the configuration of WLAN profiles via RealmJoin.  
Both packages contain a **wifi.xml** file, that can be configured with the assignment arguments in the RealmJoin portal.  
The editing is embedded within a PowerShell script and the configured **wifi.cml** is added as **wifiCustom.xml** to the device using netsh:  
``netsh wlan add profile filename = "wifiCustom.xml"``.
Customer-flavoured WLAN packages can be requested from Glück & Kanja.

### WPA2-Enterprise package *AddWlanProfileEnt*

The WPA2-Enterprise package has to be assigned with the parameters:

* SSID: mandatory  
* Encryption: optional, default value is "AES"

Argumentsyntax:
``-SSID "xyz" [-Encryption "xyz"]``

### WPA2-PSK package AddWlanProfilePsk

The WPA2-PSK package has to be assigned with the parameters:

* SSID: mandatory  
* PreSharedKey: mandatory
* Encryption: optional, default value is "AES"

Argumentsyntax:  
``-SSID "xyz" -PreSharedKey "xyz" [-Encryption "xyz"]``

## Something special: Microsoft Office 2016

The Office 365/2016 package as maintained by Glück & Kanja  

### Update infrastructure

Languages, cdn, updates,

### Assignment