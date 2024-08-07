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

