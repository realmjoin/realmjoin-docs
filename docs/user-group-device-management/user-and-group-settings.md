# User and Group Settings

## Overview

Settings can be used to control RealmJoin Clients behaviour and configure features like [LAPS](../realmjoin-client/local-admin-password-solution-laps/).

If settings have been created/assigned to users, you can review them under&#x20;

![](<../.gitbook/assets/image (20) (3).png>) - User Settings

Accordingly, if settings have been applied to any group, including "**RealmJoin - All Users"**, these can be reviewed under

![](<../.gitbook/assets/image (6) (2).png>) - Group Settings

### List of Settings

"User Settings" will list all settings applied to users and allows you to manipulate or delete them.

<figure><img src="../.gitbook/assets/image (18).png" alt=""><figcaption></figcaption></figure>

You can click on the name (Key) of a setting to open it in the settings editor.

### Settings Editor

<figure><img src="../.gitbook/assets/image (12) (2).png" alt=""><figcaption><p>Settings Editor</p></figcaption></figure>

Be aware: The value of the setting must be valid JSON, which includes singular values like `true` or strings (without brackets).

The switches in the lower half of the wizard allow scoping this setting to certain scenarios like VDI / Windows365 machines.

You can modify and delete settings from the Settings Editor. You cannot create new settings here -  Please navigate to the user or group you want a setting applied to and create the setting there.

See [Available Settings](../realmjoin-client/additional-settings.md) to review which settings can be used.
