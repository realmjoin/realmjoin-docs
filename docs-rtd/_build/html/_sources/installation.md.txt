# Installation

## Interactive Installation

### Release Version

[RealmJoin Release Version](https://gkrealmjoin.s3.amazonaws.com/win-dev/RealmJoin.exe)

### Dev Channel Version

[RealmJoin Dev Channel Version](https://gkrealmjoin.s3.amazonaws.com/win-beta/RealmJoin.exe)

### Canary Channel Version

[RealmJoin Canary Channel Version](https://gkrealmjoin.s3.amazonaws.com/win-canary/RealmJoin.exe)

## Command Line Installation

You may download and install RealmJoin in a single step by using the following command line.

### Release Channel Version

```
@powershell -NoProfile -ExecutionPolicy unrestricted 
-Command "((new-object net.webclient).DownloadFile('https://gkrealmjoin.s3.amazonaws.com
/win-dev/RealmJoin.exe', 'realmjoin.exe'))" && .\realmjoin.exe
```

### Beta Channel Version

```
@powershell -NoProfile -ExecutionPolicy unrestricted 
-Command "((new-object net.webclient).DownloadFile('https://gkrealmjoin.s3.amazonaws.com
/win-beta/RealmJoin.exe', 'realmjoin.exe'))" && .\realmjoin.exe
```

### Beta Channel Version

```
@powershell -NoProfile -ExecutionPolicy unrestricted 
-Command "((new-object net.webclient).DownloadFile('https://gkrealmjoin.s3.amazonaws.com
/win-canary/RealmJoin.exe', 'realmjoin.exe'))" && .\realmjoin.exe
```

## Silent Installation

When installing RealmJoin during unattend OS installation or any other non-interactive
deployment method you may favour not to have any UI interaction during installation. To
install RealmJoin in such a scenario use the silent installation option:

```
reamjoin.exe -install
```
