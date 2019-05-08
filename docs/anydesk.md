
# AnyDesk Integration

AnyDesk is a remote desktop tool which allows the access to other computers. AnyDesk can be installed on Windows, macOS, Linux, mobile devices and Raspberry Pi as well.

## Install AnyDesk

1. [Download](https://anydesk.com/en/downloads) anydesk.exe
2. Start anydesk.exe
3. Get an AnyDesk-ID. See the following code sample:

```
@echo off
AnyDesk.exe
for /f "delims=" %%i in ('"AnyDesk.exe" --get-id') do set CID=%%i 
echo AnyDesk ID is: %CID%
pause
```

4. Send this AnyDesk-ID to backend (sync)
5. Initiate a LAPS-on-demand (sync)

## Configuration

The configuration of AnyDesk will be the following:

```
{
    "Integration": {
      "AnyDesk": {
        "Enabled": true,
        "BootstrapperUrl": "https://.../.../AnyDesk.exe",
        "UI": { // optional
           "TrayMenuTextEnglish": "Start remote session"
        }
     }
  }

}
```

In regular state it will be the following:

```
"Integration": {
  "AnyDesk": {
    "LastKnownID": "12345678"
  }
}
```

## Start remote session via RJ tray menu

1. Open the RealmJoin tray menu
2. Click **Start remote session**
3. **RealmJoin AnyDesk Session** menu appears