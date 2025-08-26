# Security & Privacy

This chapter provides an overview on frequently asked questions surrounding information security, privacy and quality assurance.

## Data Processing and Permissions <a href="#data-processing-and-permissions" id="data-processing-and-permissions"></a>

### 1. From what data center is RealmJoin operating?

Azure region West Europe for primary, with North Europe as backup location.

### 2. Which data is processed by RealmJoin?

Computer state, user/device/group data, Intune data, ATP data, log files.

### 3. Which data is persistently stored by/on behalf of RealmJoin and how?

Computer state, user/device references, information for app management, log files. Data is stored in a combination of blob storage and databases.

### 4. Is there an archiving mechanism for logs?

Computer state is archived for 90 days, then retention policies remove the data.

### 5. Which tenant permissions do users accessing the RealmJoin web portal have to consent to?

Please refer to [Required Permissions](../realmjoin-deployment/required-permissions.md).

<mark style="color:red;">The permissions under "RealmJoin Portal - Security Features " seem incomplete.</mark>

### 6. What data is made available by granting the consent(s) from Question 5?

1.  `Basic User Profile`:

    For details on what data can be retrieved, please refer to this article: [https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-permissions-and-consent#profile](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-permissions-and-consent#profile)
2.  `Maintain access to data you have given it access to`

    No specific data is made available by granting consent to this permission.

### 7. Which externally accessible endpoints does RealmJoin expose?

1. RealmJoin Portal
   * A web portal which facilitates the administration of the service.
2. RealmJoin Client-API
   * API for the client applications, internal use
3. RealmJoin Customer-API
   * API for customers
4. RealmJoin Internal-API
   * API for related backend operations, internal use
5. RealmJoin CDN
   * Binary data with BranchCache support
6. RealmJoin Package Server
   * Custom nuget package registry

### 8. How are the endpoints from Question 7 protected?

1. RealmJoin Portal
   * Secured via OAuth 2.0 authentication with Microsoft Entra ID (Azure AD).
2. RealmJoin Client-API
   * Secured via OAuth 2.0 authentication with Microsoft Entra ID (Azure AD).
   * Custom authentication using Entra-Device-Certificate
3. RealmJoin Customer-API
   * Pre-shared key per customer
4. RealmJoin Internal-API
   * Pre-shared key per customer
5. RealmJoin CDN
   * Open by definition, can be protected using encrypted files
6. RealmJoin Package Server
   * Pre-shared key per customer

### 9. What ports and protocols are used by the endpoints from Question 7?

1. All endpoints use TLS by default
   * HTTPS (TLS)
2. RealmJoin CDN
   * Does allow HTTP for troubleshooting purposes.
   * Configured URLs use HTTPS exclusively.

## Identity

### 1. What authorization schemes are used to gain access to RealmJoin?

Administrative access is realized through OAuth 2.0 authentication with Microsoft Entra ID (Azure AD) for users who are registered on the platform.

### 2. Are there conditional access / role-based access controls in place to protect RealmJoin?

Yes. The RealmJoin Admin portal provides features to assign roles to every user. Admin, Auditor, Supporter, Runbook Runner, Software Agent, Software Requester, Organic Software Requester and Notification Agent are the default roles. In addition, RealmJoin allows Custom Roles to be created.

In order to properly operate and maintain the service, there are super-admin accounts for a limited circle of glueckkanja AG employees that have full access to all client instances of the RealmJoin service

### 3. Can access credentials be recovered? If yes, how?

RealmJoin uses SSO and are subject to Microsoft Entra ID (Azure AD) policies in the customer tenant.

## Data Protection

### 1. How is _data at-rest_ protected against unauthorized access?

* Restricted admin access according to best-practices.
* Use of Passkey MFA.
* Databases are restricted to VPN IPs for external access.

### 2. How is _data in transit_ protected against unauthorized access?

The communication between the RealmJoin Service (Backend) and the RealmJoin Agent (Client) is secured with Transport Layer Security (TLS) 1.2 or higher.

Additionally some content (e.g. software packages) is signed by the RealmJoin Service, so that the RealmJoin Agent can ensure, that data was not changed during transport.

### 3. How are customer tenants separated from each other?

Depending on service constraints and performance considerations, either by separate groups/containers or by table partitioning.

Code paths use environment-based customer context for separation.

## Security by Design

tbd

### 1. What technologies, stacks, platforms were used to design RealmJoin?

* `Azure`



## GDPR and Data-residency

### 1. Is data leaving Europe?

### 2. What 3rd-Party cloud-providers does RealmJoin rely on and why?

| Company               | Services                                                         | Contact                                                                                   | Purpose                          |
| --------------------- | ---------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | -------------------------------- |
| Microsoft Corporation | Cloud Services (Azure)                                           | <p>Building 3, Carmanhall Road Sandyford,<br>Industrial Estate 18, Dublin,<br>Ireland</p> | tbd                              |
| GitHub                | git code repository, integration, testing and release automation |                                                                                           | Code repository, CI/CD pipeline. |

## Miscellaneous

### 1. Is RealmJoin part of a bug-bounty program?

No.

### 2. What QA measures are in place?

* We run signed binaries.
* Our app-packages are built in a consistent way, leveraging state-of-the-art code repositories and CI/CD methodology to ensure a maximum of integrity.
* App packages are signed during the built process and checked by the RJ agent prior installation on the client.

### 3. Do you regularly perform penetration tests?

No.

As part of our Secure Development Practices, we employ tools (e.g. static code analysis) that scan the code base for CVEs and other common exploits (including dependencies such as 3rd party libraries) that could impact the security of the endpoints RealmJoin exposes. Before any release, any relevant findings are assessed and remediated, to ensure RealmJoin remains free from any known vulnerabilities. We neither perform penetration tests ourselves, nor do we use 3rd party "Penetration Test-as-a-Service" tools. For the former, we see an inherent conflict of interest. For the latter, since typical penetration test services often simply check the exposed endpoints against CVEs and other known exploits, we do not see any added value to the checks we already perform using static code analysis. If you wish to perform your own penetration tests, please [reach out to us](https://www.realmjoin.com/help/) and tell us about your requirements.

### 4. Is there a patching process in place?

Yes, routine maintenance and updates are applied to fix vulnerabilities and improve performance, ensuring the platform remains secure and efficient.

### 5. What are the SLAs for patches?

### 6. Does RealmJoin perform backups?

RealmJoin uses point-in-time restore technology on all critical data. Gitlab (PAAS) is backed-up regularly.&#x20;

### 7. Are there backup restore tests?



## Why is RealmJoin safe?

### We are committed to high security standards

* Our development and our operations team is ISO 27001 certified.
* We work with latest cloud development tools (e.g. Github) and code is stored in secured repositories.
* We are committed to state-of-the-art development, built and operations methodologies (e.g. CI/CD).
* Our team members use Entra ID identities and are require to use multifactor authentication.
* Endpoints, identities and services are protected by the latest technologies (e.g. Microsoft Sentinel and M365 Defender Suite incl. EDR) and monitored by a Security Operations Center.
* All systems are updated continuously.

###
