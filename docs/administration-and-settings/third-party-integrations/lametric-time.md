# LaMetric Time

## Modern Client Deployment Counter

The **Modern Client Deployment Counter** for **LaMetric Time** is a lightweight, visual way to display the amount of your organization’s Modern Workplace devices managed via RealmJoin directly on a physical display. Therefore, RealmJoin is available as App on LaMetric Market:

{% embed url="https://apps.lametric.com/apps/realmjoin/15767?apps_for=time" %}

<figure><img src="../../.gitbook/assets/image (165).png" alt=""><figcaption></figcaption></figure>

### Setup Guide

{% stepper %}
{% step %}
### Request LaMetric API Secret

Please request the required Secret via RealmJoin Support.
{% endstep %}

{% step %}
### Install the RealmJoin App

Open the LaMetric mobile app and choose the desired device:

<figure><img src="../../.gitbook/assets/image (183).png" alt="" width="172"><figcaption></figcaption></figure>

Navigate to the **Apps** section and open "Market":

<figure><img src="../../.gitbook/assets/image (187).png" alt="" width="206"><figcaption></figcaption></figure>

Search for **RealmJoin** and **install:**

<figure><img src="../../.gitbook/assets/image (193).png" alt="" width="188"><figcaption></figcaption></figure>
{% endstep %}

{% step %}
### Configure RealmJoin App

Open the recently opened App:

<figure><img src="../../.gitbook/assets/image (217).png" alt="" width="251"><figcaption></figcaption></figure>

Choose "Login":

<figure><img src="../../.gitbook/assets/image (227).png" alt="" width="148"><figcaption></figcaption></figure>

Enter:

* Username = `lametric`
* Password = **`API Secret`**

<figure><img src="../../.gitbook/assets/image (257).png" alt="" width="296"><figcaption></figcaption></figure>
{% endstep %}

{% step %}
### Verify data display

The device will start polling the endpoint automatically. Within a short time, the clock should display your deployment counter.
{% endstep %}
{% endstepper %}
