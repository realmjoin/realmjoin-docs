# Notifications and Installations

## Package Installation

When deploying packages/configurations via RealmJoin Agent notifications inform the user or allow to interact with the installation process.

The following screen shows the RealmJoin toast notification. It appears in the Windows notification center:

![](<../.gitbook/assets/image (11).png>)

This screen shows a customizable **hero image** (for more information about hero images, click [here](https://docs.microsoft.com/en-us/windows/uwp/design/shell/tiles-and-notifications/adaptive-interactive-toasts#hero-image))

Below this hero image you can see information on packages and a comment when the update will start.

You also see a progress bar and an **Auto Install...** countdown. You can snooze the installation or start it immediately. How often a user can snooze the installation depends on a configured deadline. If this deadline has expired, RealmJoin will install the required updates automatically.

This deadline is configured in the package. So this deadline can be different from package to package.

## Custom Notifications

With the help of the notification feature it is possible to notify users and clients very quickly. Whether it is general information or important issues.

This feature currently needs to be configured using [RealmJoin Classic](https://realmjoin-web.azurewebsites.net).&#x20;

### Notification example

Once you have created your notification, the target groups will receive a notification at the scheduled time. This notification appears on the desktop of a client.

![](<../.gitbook/assets/image (24).png>)
