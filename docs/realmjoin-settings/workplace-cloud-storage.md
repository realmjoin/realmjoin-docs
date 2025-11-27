# Workplace Cloud Storage

## Overview

Modern Workplace devices are getting policies and configurations via Microsoft Intune. Some of these settings rely on files available by URL or in special formats like JSON or XML. This RealmJoin feature is intended to manage those files via an easy-to-use interface for administrators.

Currently the following types are supported:

* Managed Favourites (Microsoft Edge and Google Chrome)
* Backgrounds and other files
* Outlook signatures

This native integration in RealmJoin makes the separate app (Azure Web App) from GitHub or Azure Marketplace obsolete: [M365 Workplace Cloud Storage](https://github.com/glueckkanja/gk-m365-workplacecloudstorage)

The feature of managing Enterprise Mode Site Lists is covered by Microsoft 365 admin center. So, existing or new site lists need to be added as described here: [Publish enterprise site list to the cloud](https://learn.microsoft.com/en-us/deployedge/edge-ie-mode-cloud-site-list-mgmt#publish-enterprise-site-list-to-the-cloud-1). The resulting site list ID is then published via an Intune policy to Microsoft Edge.

## Setup

{% hint style="info" %}
Please contact RealmJoin support to activate this feature for your tenant.
{% endhint %}

### Create Storage Account

1. This feature requires a blob storage on Azure. Please create a new storage account:

<figure><img src="../.gitbook/assets/image (283).png" alt=""><figcaption></figcaption></figure>

2. Adjust the settings like name, region and redundancy based on your needs.

<figure><img src="../.gitbook/assets/image (284).png" alt=""><figcaption></figcaption></figure>

3. Enable the setting "Allow enabling anonymous access on individual containers" needs to be enabled (tab "Advanced"). This is required for stored files like backgrounds which have to be accessible anonymously

<figure><img src="../.gitbook/assets/image (301).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
If the setting "Allow enabling anonymous access on individual containers" is not enabled during creation of the storage account, RealmJoin will display the error "Error uploading file. Please try again".\
If so, please move to "Settings" of your storage account and set "Allow Blob anonymous access" to "Enabled".
{% endhint %}

4. If you don't have any special requirements please use the default values for the other tabs like "Networking" and "Data protection".
5. Once created successfully, please go to the new storage account and navigate to "Access keys". Please copy the "Connection string" under "key1":

<figure><img src="../.gitbook/assets/image (285).png" alt=""><figcaption></figcaption></figure>

6. Navigate to RealmJoin Portal (as administrator)
7. Open settings and switch to the tab "Workplace cloud storage".&#x20;
8. Paste in the previously copied connection string into "Access key (Connection string) for Azure Storage account" and click on "Save":

<figure><img src="../.gitbook/assets/image (302).png" alt=""><figcaption></figcaption></figure>

### Migration from Azure Web App

If you are currently using the separate web app from [GitHub](https://github.com/glueckkanja/gk-m365-workplacecloudstorage) or Azure Marketplace, you can easily migrate to native RealmJoin integration.

{% hint style="warning" %}
Please note that **managing Enterprise Mode Site Lists** is **not possible** via RealmJoin. Please **migrate** your lists to Microsoft 365 admin center **before the following steps** as describe in [Overview](workplace-cloud-storage.md#overview).
{% endhint %}

#### Connect existing storage account

Please navigate to the corresponding and already **existing storage account** and add the access key to RealmJoin (as described in the previous section). Afterwards, your existing data will automatically be displayed in RealmJoin.

#### Clean-up

The web app (that provides the admin portal) is no longer needed. So, navigate to the resource group and delete the following resources on Azure:

* App Service
* App Service plan (connected to the App Service)

{% hint style="warning" %}
Pay attention to **not delete** the **storage account**.
{% endhint %}

<figure><img src="../.gitbook/assets/image (287).png" alt=""><figcaption></figcaption></figure>

Please also delete the obsolete Enterprise App in Entra ID (naming might be different):

<figure><img src="../.gitbook/assets/image (288).png" alt=""><figcaption></figcaption></figure>

## Favorites

RealmJoin allows you to add and maintain several favorite lists via a simple UI. Afterwards, they can be exported or copied in formats like JSON or XML.

1. Navigate to the favorites feature in the main menu and create a new list. The newly create list will get an ID that can be changed on your needs (just for internal identification of the corresponding list).&#x20;

<figure><img src="../.gitbook/assets/image (289).png" alt=""><figcaption></figcaption></figure>

2. Add desired links or create sub-folders. The name of the first folder (default name: "Favorites Bar") will be the name of the folder in favorites bar - visible to the user (most customers change this to their company name).

<figure><img src="../.gitbook/assets/image (303).png" alt=""><figcaption></figcaption></figure>

3. Afterwards, you can export the list in different formats:
   * JSON (Microsoft Edge or Google Chrome on Windows)
   * XML file (Microsoft Edge or Google Chrome on macOS)
   * URL with XML (Microsoft Edge Legacy)

### Microsoft Edge or Google Chrome on Windows

Create a new settings catalog profile with the setting "Configure favorites" and paste in the JSON:

<figure><img src="../.gitbook/assets/image (293).png" alt=""><figcaption></figcaption></figure>

For Google Chrome, the setting is called "Managed Bookmarks".

### Microsoft Edge or Google Chrome on macOS

Create a new configuration profile (template) of type "Preference file". As "Preference domain name" enter "com.microsoft.Edge". Upload the XML generated via RealmJoin:

<figure><img src="../.gitbook/assets/image (294).png" alt=""><figcaption></figcaption></figure>

For Google Chrome set "Preference domain name" to "com.google.chrome" and use the corresponding XML. Only difference between Microsoft Edge and Google Chrome XML is the first line:

```
<key>ManagedBookmarks</key> instead of <key>ManagedFavorites</key>
```

## Backgrounds and Other Files

Navigate to the organization section in the menu. Switch to tab "Backgrounds" or "Other Files". Now, simply upload desired files (background images, configuration files, public certificates etc.). They will be added to the blob storage and get public accessible URLs. Use those URLs in your configuration profiles (e.g.: set background image via Intune), scripts etc.

{% hint style="warning" %}
Do **not upload sensitive files** as they become reachable via public URLs.
{% endhint %}

<figure><img src="../.gitbook/assets/image (295).png" alt=""><figcaption></figcaption></figure>

## Outlook Signatures

This feature allows you to add templates for Outlook signatures. In conjunction with a RealmJoin software package (Windows only) the desired template is downloaded to your managed clients and added to Outlook Desktop. In addition, you can add variables in the template that are replaced with user properties (like name, email, job title or phone number).

### Create or edit signature

1. Navigate to the organization section in the menu and switch to tab "Signatures".&#x20;
2. Simply create or edit a signature in the WYSIWYG editor. Variables are added directly into the text.
3. &#x20;Copy the public link to use in signature distribution

<figure><img src="../.gitbook/assets/image (296).png" alt=""><figcaption></figcaption></figure>

#### Supported variables

* Graph\_User\_BusinessPhone
* Graph\_User\_City
* Graph\_User\_CompanyName
* Graph\_User\_Country
* Graph\_User\_Department
* Graph\_User\_DisplayName
* Graph\_User\_GivenName
* Graph\_User\_Id
* Graph\_User\_JobTitle
* Graph\_User\_Mail
* Graph\_User\_MobilePhone
* Graph\_User\_FaxNumber
* Graph\_User\_OfficeLocation
* Graph\_User\_PostalCode
* Graph\_User\_State
* Graph\_User\_StreetAddress
* Graph\_User\_Surname
* Graph\_User\_onPremisesExtensionAttributes\_extensionAttribute1
* ...
* Graph\_User\_onPremisesExtensionAttributes\_extensionAttribute15

### Distribute signature

1. Search the RealmJoin Package Store for "RealmJoin Outlook Signature":

<figure><img src="../.gitbook/assets/image (297).png" alt=""><figcaption></figcaption></figure>

2. Configure the package as described in the Technical Help and paste the copied URL to your template:

<figure><img src="../.gitbook/assets/image (300).png" alt=""><figcaption></figcaption></figure>

3. The package provides several other options like distribution of multiple signatures, automatic renewal via task, setting of default signature etc.
