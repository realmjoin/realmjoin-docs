# Infrastructure

## Network

### Avoid Proxy

Initial deployment needs direct Internet access. No proxy would be ideal but a transparent proxy should work fine (if truly transparent). If there is a proxy unavoidable as a minimum requirement the following services/addresses need to be directly accessible (not recommended, list might not be exhaustive):

For a list of the corresponding IP ranges click the following link:

[Microsoft Azure Datacenter IP Ranges](https://www.microsoft.com/en-us/download/details.aspx?id=41653)

This file contains the compute IP address ranges (including SQL ranges) used by the Microsoft Azure Datacenters. A new xml file will be uploaded every Wednesday (Pacific Time) with the new planned IP address ranges. New IP address ranges will be effective on the following Monday (Pacific Time).\
Download the new xml file and perform the necessary changes on your site before Monday.

[Office 365 URLs and IP address ranges](https://support.office.com/en-us/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2)

This article links a file that contains the compute IP address ranges that you should include in your outbound allow lists to ensure your computers can successfully use Office 365.

{% hint style="info" %}
IP addresses filtering alone is not a complete solution due to dependencies on internet-based services such as Domain Name Services (DNS), Content Delivery Networks (CDNs), Certificate Revocation Lists and other third party or dynamic services. These dependencies include dependencies on other Microsoft services such as the Azure Content Delivery Network and will result in network traces or firewall logs indicating connections to IP addresses owned by third parties or Microsoft but not listed on this page. These unlisted IP addresses, whether from third party or Microsoft owned CDN and DNS services, are dynamically assigned and can change at any time.
{% endhint %}

### Avoid VLans / WLAN- and Port-Isolation

For **BranchCache** to be effective the clients need to be able to communicate directly with each other. So they should not be separated by different VLans, WLAN-Isolation or Port-Isolation. For mass roll-outs, **BranchCache Servers** with pre-populated caches are recommended. BranchCache is limited to a single subnet, if a site has multiple subnets the BranchCache Servers must be placed in the same subnet as the clients to be effective.

### RealmJoin Connection Endpoints

RealmJoin connects to the following hosts (using HTTPS) that might be considered in your firewall settings:

* `cdn.realmjoin.com`
* `x1.c.lencr.org`
* `client-api.realmjoin.com **NEW!**`
* `client-api-staging.realmjoin.com **NEW!**`
* `realmjoin-backend.azurewebsites.net`
* `realmjoin-backend-staging.azurewebsites.net`
* `packages.gkdatacenter.net`
* `nuget.realmjoin.com **NEW!**`
* `enterpriseregistration.windows.net`
* `gkrealmjoin.s3.amazonaws.com`
* `login.microsoftonline.com`
* `graph.microsoft.com`
* `realmjoinstaticcdn.azureedge.net` (Notifier)

## Components

### BranchCache

An often encountered problem when providing software packages to a big number of devices in a WAN is creating a bottleneck and huge network loads when downloading software from a server to the devices. A solution for this problem is the **BranchCache** technology. There are two BranchCache modes, **hosted** and **distributed** cache. In hosted cache mode, the content is cached on one or more local **hosted cache servers**, which increases the network load, since a download from big binaries from an internet server is not necessary. RealmJoin uses BranchCache in the distributed cache mode:

A frequently encountered problem when providing software packages to a large number of devices in a WAN is creating a bottleneck and huge network loads when downloading software from a server to the devices. A solution for this problem is the **BranchCache** technology.

When a client device downloads software packages for the first time, the files are divided into chunks that are significantly smaller than the original content and cached on the device. If the same package is afterwards requested from a different client device in the same network, it downloads content information instead of the complete content from the server. The content information is used to locate the desired content on other devices in the network. If found, instead of downloading packages from the server, the content in form of the chopped up chunks is transferred to the client device. If the requested software is available on several devices, the load is balanced between them.

The RealmJoin Publishing Server has to provide the chunk identifiers and therefore is hosted as a single Azure VM Windows 2016 IIS server with a Azure Blob Storage. For more information about BranchCache see the [Microsoft BranchCache documentation](https://docs.microsoft.com/en-us/windows-server/networking/branchcache/branchcache)

### Back-End

#### Hosting

The RealmJoin back-end is an Azure web application using an Azure SQL database and the available Azure services.\
The back-end is hosted on an Azure tenant exclusively used for RealmJoin. All customer realms within this tenant are isolated from each other.

#### RealmJoin App Publishing Endpoint

To provide the **BranchCache** mechanism, the endpoint has to provide the chunk identifiers, a feature only provided by **Microsoft Internet Information Services** (IIS) servers. To deliver the maximum scalability the Publishing Endpoint is distributed on multiple Azure nodes hosting Windows 2016 IIS sharing a redundant Azure blob storage.

#### Web Interface

The web interface can be reached via the [RealmJoin Classic Portal](https://realmjoin-web.azurewebsites.net). After a logging with the provided credentials, the administrator can manage the package distribution in his tenant and access extensive information.

## Security Features

### Client authentication

The RealmJoin client authenticates itself against the Azure AD via a secured HTTPS connection, receiving an identification token. With this token the client now can prove its identity to the Microsoft Graph API and the RealmJoin back-end.\
After identifying the client, the back-ends response to the client is RSA signed. Using the servers public key, the RealmJoin client and service can verify the identity of the back-end server response.
