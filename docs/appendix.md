# Appendix
  
## Protocol Handler

It is possible to install RealmJoin packages using an URL-link.  
The correct format for this command consists of the ``realmjoin:`` call, the subcommand ``install`` and the package ID, e.g. ``generic-google-chrome``.  
The complete link therefore would be written as:  
``realmjoin:install:generic-google-chrome``.  
The package has to be assigned for the user in the RealmJoin backend.  

## NoGraph Option

To install RealmJoin without Graph API consent, the registry key 
```Powershell
Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\realmjoin\Parameters\NoGraph
```
can be set to `1`.  
It is also possible to set this key during the installation of RealmJoin as a argument for the *msi*:  

``msiexec /i "RealmJoin.msi" NOGRAPH=1``.

## Custom States

It is possible to extend the standard RealmJoin states with arbitrary custom states. *JSON* files located in *%ProgramData%\RealmJoin\CustomStates* are automatically evaluated and added to the telemetry upload in the RealmJoin portal.  
A RealmJoin extension allows to create custom *JSON* files using a scheduled task, therefore executing a script on regular basis and recreating the *JSON*.  
Create a chocolatey package which uses the task registration extensions:  
``Register-RealmjoinCustomStateScheduledTask`` 
For optional parameters check [Register-RealmjoinCustomStateScheduledTask](http://docs.realmjoin.com/core-extension.html#a-name-regcstask-a-register-realmjoincustomstatescheduledtask) in the *core extension* section.  
As per default, the newly created task executes the script ``.\publishState.ps1`` once per day.  

The within the powershell script created JSON file might be designed as:   

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

## Scheduled Tasks

The RealmJoin extensions contain CmdLets to simply register and unregister a scheduled task on the client. The task is executed by the system account. For all available CmdLets see [Scheduled Tasks](http://docs.realmjoin.com/core-extension.html#a-name-schedtasks-a-scheduled-tasks).
