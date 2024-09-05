# Security

## Availability

### How do you ensure the availability of RealmJoin?

To maintain high availability of RealmJoin, several key strategies are implemented, each designed to provide robust, uninterrupted access to the service. These measures include:

* **Redundant Infrastructure**: Deployment across multiple data centers to ensure continuous service in the event of a failure in one location. RealmJoin leverages Azure IaaS in multiple Azure datacenters.
* **Automated Failover Processes**: Systems are in place to automatically redirect traffic to operational servers during an outage, minimizing downtime.
* **Scalable Architecture**: The ability to quickly scale resources up or down based on demand helps to maintain performance during peak usage times.
* **Regular Updates and Patches**: Routine maintenance and updates are applied to fix vulnerabilities and improve performance, ensuring the platform remains secure and efficient.
* **Monitoring and Alerts**: Continuous monitoring of system health and automated alerts for any issues that could impact service availability.
* **Recovery Plans**: We have implemented several layers of recovery measures: We can recover the main system state within the last few weeks because our databases have point-in-time recovery. In addition, in the unlikely event of a complete system failure, the main RealmJoin services can be recovered using an IaC approach (Terraform), which significantly reduces recovery time.



## Package integrity

### What makes RealmJoin packages safer than community solutions?

In opposition to community solutions, we maintain full control over any package and any binary at all times. Several implented checks ensure, that no corrupt data is executed on devices.&#x20;

* **No public repositories**: We host our gitlab, nuget and cdn instances. While the RealmJoin agent currently utilizes a modified version of the Chocolatey engine, the package source is restricted to the glueckkanja AG package servers.&#x20;
* **Split repositories**: Customer specific packages are located in a customer specific section of our servers and can not be accessed by other customers.&#x20;
* **Full versioning**: All tooling as well as the RealmJoin package store provide commit and audit information. It is always transparent, who changed what in any package at any given time.&#x20;
* **Avoid specific data**: Separating package code and binaries allows us generally to remove sensitive information from the binaries, so even intercepted binaries can not be used maliciously.&#x20;
* **Encrypting and hashes**: The package scripts are stored on an encrypted server, with highly restricted access. The RealmJoin agent downloads the scripts via an encrypted connection. For additional security, all binaries are checked against a hard-coded hash before any action is taken.
* **Pentest**: In the last years, the RealmJoin agent was part of several successful customer pentests.
* **Testing**: All RealmJoin packages are installed several time during the PACKaaS QA on Windows devices running Defender. Malware scans are a part of the automated build and deploy processes. Maintained packages use official vendor sources.&#x20;
