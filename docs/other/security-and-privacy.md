# Security & Privacy

This chapter provides an overview on frequently asked questions surrounding information security, privacy and quality assurance.

## Data Processing and Permissions <a href="#data-processing-and-permissions" id="data-processing-and-permissions"></a>

### 1. From what data center is RealmJoin operating?

* Azure region West Europe  (primary)&#x20;
* Azure region North Europe (backup)

### 2. Which data is processed by RealmJoin?

* Computer state
* Entra ID user/device/group data (this contains UPN / email address data, first name, last name, profile picture)
* Intune data
* ATP data
* Log files

### 3. Which data is persistently stored by/on behalf of RealmJoin and how?

* Computer state
* Entra ID user/device references (this contains UPN / email address data)
* Information for app management
* Log files

&#x20;Data is stored in a combination of blob storage and databases.

### 4. Is there an archiving mechanism for logs?

The computer state is archived for 90 days, then retention policies remove the data.

### 5. Which tenant permissions do users accessing the RealmJoin web portal have to consent to?

Please refer to [Required Permissions](../realmjoin-deployment/required-permissions.md).

### 6. What data is made available by granting the consent(s) from Question 5?

Please refer to [Required Permissions](../realmjoin-deployment/required-permissions.md).

### 7. Which externally accessible endpoints does RealmJoin expose?

1. RealmJoin Portal
   * A web portal which facilitates the administration of the service.
2. RealmJoin Client-API
   * API for the client applications (internal use).
3. RealmJoin Customer-API
   * API for customers.
4. RealmJoin Internal-API
   * API for related backend operations (internal use).
5. RealmJoin CDN
   * Binary data with BranchCache support.
6. RealmJoin Package Server
   * Custom nuget package registry.

### 8. How are the endpoints from Question 7 protected?

1. RealmJoin Portal
   * Secured via OAuth 2.0 authentication with Microsoft Entra ID (Azure AD).
2. RealmJoin Client-API
   * Secured via OAuth 2.0 authentication with Microsoft Entra ID (Azure AD).
   * Custom authentication using Entra-Device-Certificate.
3. RealmJoin Customer-API
   * Pre-shared key per customer.
4. RealmJoin Internal-API
   * Pre-shared key per customer.
5. RealmJoin CDN
   * Unauthenticated by definition, can be protected using encrypted files.
6. RealmJoin Package Server
   * Pre-shared key per customer.

### 9. What ports and protocols are used by the endpoints from Question 7?

1. All endpoints use TLS by default.
   * HTTPS (TCP / 443).
2. RealmJoin CDN
   * Does allow HTTP (TCP / 80) for troubleshooting purposes.
   * Configured URLs use HTTPS (TCP / 443) exclusively.

## Identity

### 1. What authorization schemes are used to gain access to RealmJoin?

Administrative access is realized through OAuth 2.0 authentication with Microsoft Entra ID (Azure AD) for users who are registered on the platform.

### 2. Are there conditional access / role-based access controls in place to protect RealmJoin?

Yes. The RealmJoin Admin portal provides features to assign [roles](../realmjoin-settings/permission/) to every user.&#x20;

Available Default Roles:

* Admin
* Auditor
* Supporter
* Runbook Runner
* Software Agent
* Software Requester
* Organic Software Requester
* Notification Agent

In addition, RealmJoin allows Custom Roles to be created.

### 3. Can access credentials be recovered? If yes, how?

RealmJoin uses SSO and are subject to Microsoft Entra ID (Azure AD) policies in the customer tenant.

## Data Protection

### 1. How is _data at-rest_ protected against unauthorized access?

* Restricted admin access according to best-practices.
* Use of Passkey MFA.
* Databases are restricted to VPN IPs for external access.

### 2. How is _data in transit_ protected against unauthorized access?

The communication between the RealmJoin Service (Backend) and the RealmJoin Agent (Client) is secured with Transport Layer Security (TLS) 1.2 or higher.

Additionally some content (e.g. software packages) is signed by the RealmJoin Service, so that the RealmJoin Agent can ensure, that data was not altered during transport.

### 3. How are customer tenants separated from each other?

Depending on service constraints and performance considerations, either by separate groups/containers or by table partitioning.

Code paths use environment-based customer context for separation.

## Security by Design

### We are committed to high security standards

* Our development and our operations team is ISO 27001 certified.
* We work with latest cloud development tools (e.g. GitHub) and code is stored in secured repositories.
* We are committed to state-of-the-art development, built and operations methodologies (e.g. CI/CD).
* Our team members use Entra ID identities and are required to use multifactor authentication.
* Endpoints, identities and services are protected by the latest technologies (e.g. Microsoft Sentinel and M365 Defender Suite incl. EDR) and monitored by a Security Operations Center.
* All systems are updated continuously.

### 1. What technologies, stacks, platforms were used to design RealmJoin?

* `Azure`

## Availability

### 1. How do you ensure the availability of RealmJoin?

To maintain high availability of RealmJoin, several key strategies are implemented, each designed to provide robust, uninterrupted access to the service. These measures include:

* **Redundant Infrastructure**: Deployment across multiple data centers to ensure continuous service in the event of a failure in one location. RealmJoin leverages Azure IaaS in multiple Azure datacenters.
* **Automated Failover Processes**: Systems are in place to automatically redirect traffic to operational servers during an outage, minimizing downtime.
* **Scalable Architecture**: The ability to quickly scale resources up or down based on demand helps to maintain performance during peak usage times.
* **Regular Updates and Patches**: Routine maintenance and updates are applied to fix vulnerabilities and improve performance, ensuring the platform remains secure and efficient.
* **Monitoring and Alerts**: Continuous monitoring of system health and automated alerts for any issues that could impact service availability.
* **Recovery Plans**: We have implemented several layers of recovery measures: We can recover the main system state within the last few weeks because our databases have point-in-time recovery. In addition, in the unlikely event of a complete system failure, the main RealmJoin services can be recovered using an IaC approach (Terraform), which significantly reduces recovery time.

## GDPR and Data-residency

### 1. Is data leaving Europe?

No.

### 2. What 3rd-Party cloud-providers does RealmJoin rely on and why?

<table><thead><tr><th>Company</th><th>Services</th><th width="221.671875">Contact</th><th>Purpose</th></tr></thead><tbody><tr><td>Microsoft Corporation</td><td>Cloud Services (Azure)</td><td>Building 3, Carmanhall Road Sandyford,<br>Industrial Estate 18, Dublin,<br>Ireland</td><td>Cloud services (Azure)</td></tr><tr><td>GitHub B.V.</td><td>git code repository, integration, testing and release automation</td><td>Prins Bernhardplein 200, Amsterdam, 1097JB<br>Netherlands</td><td>Code repository, CI/CD pipeline.</td></tr><tr><td>GitLab, Inc.</td><td>git code repository, integration, testing and release automation</td><td>268 Bush Street #350, San Francisco, CA 94104-3503, <br>United States</td><td>Packaging pipeline</td></tr></tbody></table>

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

* Patches for CVEs / security vulnerabilities: Once the vulnerability becomes public knowledge or as soon as we identify a vulnerability within our own code, a hot-fix will be provided no longer than 24 hours after we have become aware of the vulnerability.
* Other patches: No SLA.

### 6. Does RealmJoin perform backups?

RealmJoin uses point-in-time restore technology on all critical data. GitLab (hosting the PACKaaS pipeline and repository) is backed-up regularly.&#x20;

### 7. Are there backup restore tests?

No. Please see [Availability](security-and-privacy.md#id-1.-how-do-you-ensure-the-availability-of-realmjoin) for details.

### 8. What makes RealmJoin packages safer than community solutions?

In opposition to community solutions, we maintain full control over any package and any binary at all times. Several implemented checks ensure, that no corrupt data is executed on devices.&#x20;

* **No public repositories**: We host our GitLab, nuget and cdn instances. While the RealmJoin agent currently utilizes a modified version of the Chocolatey engine, the package source is restricted to the glueckkanja AG package servers.&#x20;
* **Split repositories**: Customer specific packages are located in a customer specific section of our servers and can not be accessed by other customers.&#x20;
* **Full versioning**: All tooling as well as the RealmJoin package store provide commit and audit information. It is always transparent, who changed what in any package at any given time.&#x20;
* **Avoid specific data**: Separating package code and binaries allows us generally to remove sensitive information from the binaries, so even intercepted binaries can not be used maliciously.&#x20;
* **Encrypting and hashes**: The package scripts are stored on an encrypted server, with highly restricted access. The RealmJoin agent downloads the scripts via an encrypted connection. For additional security, all binaries are checked against a hard-coded hash before any action is taken.
* **Pentest**: In the last years, the RealmJoin agent was part of several successful customer pentests.
* **Testing**: All RealmJoin packages are installed several times during the PACKaaS QA on Windows devices running Defender. Malware scans are a part of the automated build and deploy processes. Maintained packages use official vendor sources.&#x20;

