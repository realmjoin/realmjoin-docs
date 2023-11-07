# Workplace Cloud Storage

Overview

Modern Workplace devices are getting policies and configurations via Microsoft Intune. Some of these settings rely on files available by URL or in special formats like JSON or XML. This RealmJoin feature is intended to manage those files via an easy to use interface for administrators.

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

This features requires a blob storage on Azure. Please create a new one:

<figure><img src=".gitbook/assets/image (40).png" alt=""><figcaption></figcaption></figure>

Adjust the settings like name, region and redundancy based on your needs.

<figure><img src=".gitbook/assets/image (41).png" alt=""><figcaption></figcaption></figure>

Due to stored files like backgrounds have to be accessible anonymously, the setting "Allow enabling anonymous access on individual containers" needs to be enabled (tab "Advanced"):

<figure><img src=".gitbook/assets/image (58).png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
If the setting "Allow enabling anonymous access on individual containers" is not enabled during creation of the storage account, RealmJoin will display the error "Error uploading file. Please try again".\
If so, please move to "Settings" of your storage account and set "Allow Blob anonymous access" to "Enabled".
{% endhint %}

If you don't have any special requirements please use the default values for the other tabs like "Networking" and "Data protection".

Once created successfully, please go to the new storage account and navigate to "Access keys". Please copy the "Connection string" under "key1":

<figure><img src=".gitbook/assets/image (42).png" alt=""><figcaption></figcaption></figure>

Navigate to RealmJoin portal (as administrator), open settings and switch to the tab "Workplace cloud storage". Paste in the previously copied connection string into "Access key (Connection string) for Azure Storage account" and click on "Save":

<figure><img src=".gitbook/assets/image (59).png" alt=""><figcaption></figcaption></figure>

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

<figure><img src=".gitbook/assets/image (44).png" alt=""><figcaption></figcaption></figure>

Please also delete the obsolete Enterprise App in Entra ID (naming might be different):

<figure><img src=".gitbook/assets/image (45).png" alt=""><figcaption></figcaption></figure>

## Favourites

RealmJoin allows you to add and maintain several favourite lists via a simple UI. Afterwards, they can be exported or copied in formats like JSON or XML.

Navigate to the favourites feature in the main menu and create a new list:

<figure><img src=".gitbook/assets/image (46).png" alt=""><figcaption></figcaption></figure>

The newly create list will get an ID that can be changed on your needs (just for internal identification of the corresponding list). Now, add desired links or create sub-folders. The name of the first folder (default name: "Favorites Bar") will be the name of the folder in favourites bar - visible to the user (most customers change this to their company name).

<figure><img src=".gitbook/assets/image (60).png" alt=""><figcaption></figcaption></figure>

Afterwards, you can export the list in different formats:

* JSON (Microsoft Edge or Google Chrome on Windows)
* XML file (Microsoft Edge or Google Chrome on macOS)
* URL with XML (Microsoft Edge Legacy)

### Microsoft Edge or Google Chrome on Windows

Create a new settings catalog profile with the setting "Configure favorites" and paste in the JSON:

<figure><img src=".gitbook/assets/image (50).png" alt=""><figcaption></figcaption></figure>

For Google Chrome, the setting is called "Managed Bookmarks".

### Microsoft Edge or Google Chrome on macOS

Create a new configuration profile (template) of type "Preference file". As "Preference domain name" enter "com.microsoft.Edge". Upload the XML generated via RealmJoin:

<figure><img src=".gitbook/assets/image (51).png" alt=""><figcaption></figcaption></figure>

For Google Chrome set "Preference domain name" to "com.google.chrome" and use the corresponding XML. Only difference between Microsoft Edge and Google Chrome XML is the first line:

```
<key>ManagedBookmarks</key> instead of <key>ManagedFavorites</key>
```

## Backgrounds and other files

Navigate to the organization section in the menu. Switch to tab "Backgrounds" or "Other Files". Now, simply upload desired files (background images, configuration files, public certificates etc.). They will be added to the blob storage and get public accessible URLs. Use those URLs in your configuration profiles (e.g.: set background image via Intune), scripts etc.

{% hint style="warning" %}
Do **not upload sensitive files** as they become reachable via public URLs.
{% endhint %}

<figure><img src=".gitbook/assets/image (52).png" alt=""><figcaption></figcaption></figure>

## Outlook signatures

Navigate to the organization section in the menu and switch to tab "Signatures". This feature allows you to add templates for Outlook signatures. In conjunction with an RealmJoin software package (available for Windows) the desired template is downloaded to your managed clients and added to Outlook Desktop. In addition, you can add variables in the template that are replaced with user properties (like name, email, job title or phone number).

### Create or edit signature

Simply create or edit a signature in the WYSIWYG editor and copy the public link. Variables are added directly into the text.

<figure><img src=".gitbook/assets/image (53).png" alt=""><figcaption></figcaption></figure>

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

Search the RealmJoin package store for "RealmJoin Outlook Signature":

<figure><img src=".gitbook/assets/image (54).png" alt=""><figcaption></figcaption></figure>

Configure the package as described in the Technical Help and fill in the copied URL to your template:

<figure><img src=".gitbook/assets/image (57).png" alt=""><figcaption></figcaption></figure>

The package provides several other options like distribution of multiple signatures, automatic renewal via task, setting of default signature etc.
