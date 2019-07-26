
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

## Custom States

It is possible to extend the standard RealmJoin states with arbitrary custom states. **JSON** files located in **%ProgramData%\RealmJoin\CustomStates** are automatically evaluated and added to the telemetry upload in the RealmJoin portal.

A RealmJoin extension allows to create custom **JSON** files using a scheduled task, therefore executing a script on regular basis and recreating the **JSON**.  
Create a Chocolatey package which uses the task registration extensions:

``Register-RealmjoinCustomStateScheduledTask``
For optional parameters check [Register-RealmjoinCustomStateScheduledTask](http://docs.realmjoin.com/core-extension.html#a-name-regcstask-a-register-realmjoincustomstatescheduledtask) in the **core extension** section.  
As per default, the newly created task executes the script ``.\publishState.ps1`` once per day.  

The within the PowerShell script created JSON file might be designed as:

```JSON
  "CustomStates": {
    "bad-json": {
      "Error": "File cannot be parsed: Unexpected character encountered while parsing value: a. Path '', line 0, position 0."
    },
    "is-not-json-object": {
      "Error": "File cannot be parsed: Error reading JObject from JsonReader. Current JsonReader item is not an object: StartArray. Path '', line 1, position 1."
    },
    "name . test $ foo": {
      "test": "ok"
    },
    "test": {
      "hello": "world"
    },
    "too-big": {
      "Error": "File size (66075 bytes) exceeds limit of 65536 bytes."
    }
  }
```