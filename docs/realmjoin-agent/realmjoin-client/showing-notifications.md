# Notifications

Our notification system allows you to send notifications directly to user’s computers. This can be useful for displaying general information or important issues.

## User Experience

Once you have created your notification, the target groups will receive a notification at the scheduled time. This notification appears on the desktop of a client.&#x20;

The user receives different colored notifications based off the notification category chosen. Once a notification has been closed and acknowledged by the user, it will not re-appear.

<div>

<figure><img src="../../../.gitbook/assets/Screenshot 2024-07-11 172006 (2).png" alt=""><figcaption><p>Category: None</p></figcaption></figure>

 

<figure><img src="../../../.gitbook/assets/Screenshot 2024-07-11 171544 (3).png" alt=""><figcaption><p>Category: Info</p></figcaption></figure>

 

<figure><img src="../../../.gitbook/assets/Screenshot 2024-07-11 171242 (2).png" alt=""><figcaption><p>Category: Alert</p></figcaption></figure>

</div>

The notifications are transparent and are able to be clicked through to minimize disruption. This can be changed in the [Advanced Settings](showing-notifications.md#advanced-settings).

## Creating a Notification

### Basic Settings

1. **Category**: Choose the category of your notification. The options are:
   * None
   * Info
   * Alert
2. **Notification Schedule**: Set a Start and End date for the notification. The notification will only be active during this period. Use the prompts to quickly fill
3. **Target Groups**: Specify which [groups](../../ugd-management/user-list/) should receive the alert. You can also exclude certain groups if needed.
4. **Notification Content**: This includes:
   * **Language (Optional)**: The language of your notification. This field accepts IETF language tags.
   * **Title**: The headline of your notification.
   * **Body**: The main content of your notification.

<figure><img src="../../../.gitbook/assets/image (9).png" alt=""><figcaption></figcaption></figure>

### Advanced Settings

1. **Disable Click Through**: If enabled, users will not be able to click on the notification to navigate to a different page.
2. **Disable Transparency**: If enabled, the notification window will not be transparent.

<figure><img src="../../../.gitbook/assets/image (10).png" alt=""><figcaption></figcaption></figure>

Please note that these advanced options might affect the user experience, so use them wisely.

Effective notifications are concise, relevant, and timely. Always respect the user’s time and attention when sending notifications.

### Saving and Publishing Notifications

In order to publish a notification, the configured notification must first be saved as a draft.

<figure><img src="../../../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

Drafts will appear in the notification list with a yellow "Draft" tag.

<figure><img src="../../../.gitbook/assets/image (8).png" alt=""><figcaption></figcaption></figure>

Once a draft has been saved, the administrator will be prompted to either Publish or Delete.

<figure><img src="../../../.gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>

* **Publish:** Selecting Publish will prompt for an additional Confirm Publish button.\
  ![](<../../../.gitbook/assets/image (2).png>) \
  Once notifications are sent out, they are not easily retrieved. Please make sure the notification is configured as intended prior to publishing.
* **Delete:** Selecting Delete will prompt for an additional Confirm Delete button.\
  ![](<../../../.gitbook/assets/image (4).png>) \
  Once messages are deleted, they cannot be recovered. They will be deleted after 30 days.

### Cancelling a Notification

Once a notification has been published, administrators will have the option to cancel the notification.&#x20;

<figure><img src="../../../.gitbook/assets/image (6).png" alt=""><figcaption></figcaption></figure>

Cancelling a notification will cause the notification to disappear from a user's device without their intervention. Cancelled notifications cannot be recovered, will be deleted after 30 days and appear in the notification list with a red "Cancelled" tag.

<figure><img src="../../../.gitbook/assets/image (7).png" alt=""><figcaption></figcaption></figure>
