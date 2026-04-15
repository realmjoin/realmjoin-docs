# User and Group Settings

## Overview

Settings can be used to control RealmJoin Client's behavior and configure features like [LAPS](../../realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/).

If settings have been created/assigned to users, you can review them under ![](<../../.gitbook/assets/image (162).png>) - User Settings

Accordingly, if settings have been applied to any group, including "**RealmJoin - All Users"**, these can be reviewed under ![](<../../.gitbook/assets/image (146).png>) - Group Settings.

## Default Values

You can define default group setting values by adding them to the built-in RealmJoin group "RealmJoin - All Users". These group settings can be overwritten by group settings assigned to any other group.&#x20;

Example:

Set the RealmJoin Agent Channel to "release" for all your users (using "RealmJoin - All Users) and assign the "beta" channel to another 'real' group. This will overwrite the channel setting for these users because a 'real' group has higher priority.&#x20;

## Settings Editor

<figure><img src="../../.gitbook/assets/image (229).png" alt=""><figcaption><p>Settings Editor</p></figcaption></figure>

Be aware: The value of the setting must be valid JSON, which includes singular values like `true` or strings (without brackets).

The switches in the lower half of the wizard allow scoping this setting to certain scenarios like VDI / Windows365 machines.

You can modify and delete settings from the Settings Editor. You cannot create new settings here -  Please navigate to the user or group you want a setting applied to and create the setting there.

See [Available Settings](additional-settings.md) to review which settings can be used.
