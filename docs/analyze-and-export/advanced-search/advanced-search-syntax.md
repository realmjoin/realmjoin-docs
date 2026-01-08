---
description: >-
  This page lists some typical use cases when working with the Advanced Search.
  There are many more variables and search queries - please contact us if you
  have questions or miss something.
---

# Advanced Search Syntax

## Users

**Get all German users:**

[`country:DE`](https://portal.realmjoin.com/users/all?search=country%3ADE)&#x20;

***

**Get all users of a specific department:**

[`department:"Sales Department"`](https://portal.realmjoin.com/users/all?search=department%3A%22Sales%20Department%22)&#x20;

***

**Get all users with job title CEO:**

[`job:CEO`](https://portal.realmjoin.com/users/all?search=job%3ACEO)&#x20;

***

**Get all users with job title CEO not in Germany:**

[`job:CEO country!:Germany`](https://portal.realmjoin.com/users/all?search=job%3ACEO%20country!%3AGermany)&#x20;

***

**Get all users starting with ADM- with an empty department:**

[`name:ADM- department=""`](https://portal.realmjoin.com/users/all?search=name%3AADM-%20department%3D%22%22)&#x20;

***

**Get all users with postal code 63065:**

[`zip:63065`](https://portal.realmjoin.com/users/all?search=zip%3A63065)

***

**List all users with specific domain:**

[`domain.com`](https://portal.realmjoin.com/users/all?search=domain.com)

***

## Groups

**Get all static groups:**

[`IsStatic:1`](https://portal.realmjoin.com/groups/all?search=IsStatic%3A1)

***

**Get all dynamic groups:**

[`IsStatic:0`](https://portal.realmjoin.com/groups/all?search=IsStatic%3A0)&#x20;

***

## Devices

**Get all Windows 11 Version 22H2 devices:**

[`os:"Windows 11 (22H2)"`](https://portal.realmjoin.com/devices?search=OS%3D%22Windows%2011%20\(22H2\)%22)

***

**Get all Printers:**

[`OS:Printer`](https://portal.realmjoin.com/devices?compliance=0\&type=0\&search=OS%3APrinter)

***

**Get all Dell XPS devices:**

[`manu:dell model:xps`](https://portal.realmjoin.com/devices?search=manu%3Adell%20model%3Axps)&#x20;

***

**Get all devices with RealmJoin Version 4.19 installed:**

[`rj:4.19`](https://portal.realmjoin.com/devices?search=rj%3A4.19)&#x20;

***

**Get all Surface Hubs:**

[`Model:Surface Hub`](https://portal.realmjoin.com/devices?search=Model%3ASurface%20Hub)

***

## Packages

**Get all RealmJoin (basic) packages:**

[`Type:1`](https://portal.realmjoin.com/apps?search=Type%3A1)

***

**Get all Intune (basic) packages:**

[`Type:3`](https://portal.realmjoin.com/apps?search=Type%3A3)

***

**Get all Intune (managed) packages:**

[`Type:5`](https://portal.realmjoin.com/apps?search=Type%3A5)

***

**Get all RealmJoin (managed) packages:**

[`Type:7`](https://portal.realmjoin.com/apps?search=Type%3A7)

***

**Get all Packages with a running preview:**

[`StatusCurrentPreviewVersionParsed:`](https://portal.realmjoin.com/apps?search=StatusCurrentPreviewVersionParsed%3A)&#x20;

***

**Get all "PreRelease"-Packages (deprecated):**

[`Preview:1`](https://portal.realmjoin.com/apps?search=Preview%3A1)
