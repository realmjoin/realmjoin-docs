---
description: Experience nearly load-free access to your data
---

# Advanced Search

From May 9th, RealmJoin introduces a revamped search mechanism that enables real-time access to tenant data. This enhancement ensures efficient performance even for tenants with a large volume of user, device, and group objects.

Tables can be searched using the _basic_ or the _advanced_ search feature.&#x20;

{% hint style="info" %}
<mark style="background-color:yellow;">**All searches have to be confirmed by either using the**</mark><mark style="background-color:yellow;">**&#x20;**</mark>_<mark style="background-color:yellow;">**enter key**</mark>_<mark style="background-color:yellow;">**&#x20;**</mark><mark style="background-color:yellow;">**or the**</mark>  <img src="../../.gitbook/assets/image (31).png" alt="" data-size="line"> <mark style="background-color:yellow;">**symbol.**</mark>&#x20;
{% endhint %}

### Basic Search

Basic Search uses the Graph API to directly query tenant data, providing real-time results.&#x20;

Basic Search is always available as a fallback when Advanced Search is not. It also appears during the initial loading of the cached table, allowing users to search immediately—even before the cache is fully built.

### Advanced Search

RealmJoin's advanced search feature uses caching and tokenization, making searches fast and reliable, and supports Unicode characters like Ø. This tokenization enables partial name searches, so a query like "Ma Mu" can locate a user named "Maren Müller".&#x20;

Additionally, information not displayed in the table is also searchable, like post-codes or UPN.&#x20;

<figure><img src="../../.gitbook/assets/image (32).png" alt=""><figcaption></figcaption></figure>

### Advanced Search Syntax Overview

Advanced Search allows querying across available table values using a flexible and powerful syntax. Below are the key features and rules:

* **Tokenized Search**:\
  Search terms are automatically tokenized to improve matching accuracy. For example, typing `lu sk` will match names like **Luke Skywalker**. The search always uses a **starts-with** approach rather than a full-text or "contains" search. This means a search for `walk` would **not** return **Skywalker**.
* **Logical AND**:\
  All filters are combined using logical **AND**. Every condition must be met.\
  Example: `Luke Skywalker country:france` searches for Luke Skywalker where the **country** starts with "france".
* **Column-specific Search**:\
  Use `column:` to search within a specific column.\
  Example: `country:france` searches for entries where the **country** starts with "france".
* **Operators**:
  * `:` → **startsWith** search\
    Example: `name:jo` matches "John", "Joanna", etc.
  * `=` → **equals** search\
    Example: `city=Stuttgart` matches exactly "Stuttgart"
  * `!=` or `!:` → **negation**\
    Example: `city!=Stuttgart`or `city!:Stuttgart` excludes "Suttgart"
* **Special Behavior**:
  * **Umlaut substitution**:\
    Umlauts are normalized (e.g., **Björn** can be found by searching for **Bjorn**).
  * **Unicode support**:\
    Unicode characters are supported in search terms.
  * **Brackets () are ignored** in startsWith searches.
  * **Empty value search**:
    * `zip:""` searches for empty values
    * `zip:` searches for any value e.g. `zip:63`
* **Supported Columns**:
  * Aliases for column names may exist and are listed in brackets
  * User table:
    * `name, upn, language (lang), jobtitle (job), city, country, zip (plz), enabled, department`
      * `enabled:` → accepts `true` or `false` (`enabled:true`)
  * Groups table
    * `name`
  * Device table
    * `name, operatingsystem (os), manufacturer (manu), model`

### Examples

Get all users of a specific department:

`department:"Sales Department"`

Get all users with job title CEO:

`job:CEO`

Get all users with job title CEO not in Germany:

`job:CEO country!:Germany`

Get all users starting with ADM- with an empty department:

`name:ADM- departnent=""`

Get all users with postal code 63065:

`zip:63065`

List all users with specific domain:

`domain.com`

Get all Dell XPS devices:

`manu:dell model:xps`&#x20;

### FAQ

#### How often is the data cached?

The table is cached on a schedule, currently set to 1 hour.&#x20;

#### Can I refresh the data manually?

In the top right corner of each table, there's a button to refresh the cached data.

#### Can other users use my refreshed data?

The table is available for all users in the same RealmJoin portal instance. Thus, a triggered rebuild will do so for all those users.&#x20;

#### What is an RealmJoin portal instance?

The RealmJoin portal has three different instances for load balancing and redundancy reasons.&#x20;

#### How long will a rebuild/refresh of the advanced search take?

The rebuild time depends on the size of the tenant and the number of objects. It is not uncommon, that the rebuild might take several minutes. During the rebuild, only the basic search is available. All data is then queried directly via Graph, thus reducing the capabilities in filtering and speed.
