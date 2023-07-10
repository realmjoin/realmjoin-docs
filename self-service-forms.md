# Self Service Forms

## Overview

You can use Self Service Forms to collect structured data from users. This can be used to let users report incidents or indicate changes, like the need for a new workplace setup in an office.

"Self Service Forms" is an optional feature that can be enabled for your tenant by glueckkanja-gab Support. If not enabled, you can still enter/prepare forms in the settings page, but users will not be able to see/use self service forms.

We will use a workflow to "indicate a new pet" as an example throughout this article.

<figure><img src=".gitbook/assets/image (11) (1).png" alt=""><figcaption><p>Form Example</p></figcaption></figure>

## Using Forms

Using the ![](<.gitbook/assets/image (7) (1).png>) navigation item, users can select a form to fill out and submit.

<figure><img src=".gitbook/assets/image (17).png" alt=""><figcaption><p>Form Selector</p></figcaption></figure>

When a user fills out and submits a form, its contents will be sent via email to the recipient given in the form's definition. The email will be sent via RealmJoin's infrastructure and will not originate from your company's email addresses.

<figure><img src=".gitbook/assets/image (14).png" alt=""><figcaption><p>Sample email from a form</p></figcaption></figure>

{% hint style="info" %}
When Self Service Forms are enabled for your tenant, all users are able to use / submit forms.
{% endhint %}

## Review Submissions

Using the ![](<.gitbook/assets/image (15).png>) navigation icon, you can review past form submissions of your users.

<figure><img src=".gitbook/assets/image (30).png" alt=""><figcaption><p>Submissions List</p></figcaption></figure>

You can search for submissions by sending username and by form name, but not by fields in the form submission.

Click "View" to see the filled form data. The view is read only.

## Settings Page

The Self Service Forms settings page allows to manage existing forms, add, edit and delete forms.

### Forms List on the Settings Page

<figure><img src=".gitbook/assets/image (13) (3).png" alt=""><figcaption><p>Forms List</p></figcaption></figure>

Use "New Form" or "Edit" to describe the form using [JSON Schema](https://json-schema.org/). This defines which fields need to be entered and what values are valid. The UI offers a syntax checking editor and a preview of the resulting form.

The schema will be used to dynamically create a form for the user. Basically, use the schema not only to describe the desired data but also to implicitly create the form's UI.

### Schema Editor

Above the editor there are two fields. Use the left field to give your form a descriptive name. Use the right field to name the email address of the recipient of the user submited data.

<figure><img src=".gitbook/assets/image (16) (3).png" alt=""><figcaption><p>Schema Editor Sample</p></figcaption></figure>

You can use "Update JSON Form Preview" to create a preview of the resulting form underneath the editor.

<figure><img src=".gitbook/assets/image (15) (4).png" alt=""><figcaption><p>Editor Preview</p></figcaption></figure>

After modifying the schema, press "Submit" to save your changes. It will show an error if the syntax check fails.

## JSON Schema

The usage of JSON Schema is out of scope of this document. You can use online schema generators (like [this one](https://www.jsonschema.net/app)) to simplify the process.

To give a starting point at least, let us examine the schema from our example

```json
{
  "title": "Person",
  "type": "object",
  "required": [
    "name",
    "date",
    "location",
    "pets"
  ],
  "properties": {
    "name": {
      "type": "string",
      "description": "First and Last name",
      "minLength": 4,
      "default": "- Your Name here -"
    },
    "date": {
      "type": "string",
      "format": "date",
      "options": {
        "flatpickr": {}
      }
    },
    "location": {
      "type": "object",
      "title": "Location",
      "properties": {
        "city": {
          "type": "string",
          "default": "San Francisco"
        },
        "state": {
          "type": "string",
          "default": "CA"
        },
        "citystate": {
          "type": "string",
          "description": "This is generated automatically from the previous two fields",
          "template": "{{city}}, {{state}}",
          "watch": {
            "city": "location.city",
            "state": "location.state"
          }
        }
      }
    },
    "pets": {
      "type": "array",
      "format": "table",
      "title": "Pets",
      "uniqueItems": true,
      "items": {
        "type": "object",
        "title": "Pet",
        "properties": {
          "type": {
            "type": "string",
            "enum": [
              "cat",
              "dog",
              "bird",
              "reptile",
              "other"
            ],
            "default": "dog"
          },
          "name": {
            "type": "string"
          }
        }
      },
      "default": [
        {
          "type": "dog",
          "name": "Walter"
        }
      ]
    }
  }
}
```

Every JSON Schema consists of objects. Every object has to at least have a type and a name.

### Types

#### Object

"Complex" objects containing other child-objects should use the **object** type. In our example the root node "Person" of the schema is of this type.

You can define mandatory fields using the **required** keyword. These fields have to be defined in the schema as well.

Use **properties** to describe the features of each field needed, this includes giving a type and a name.

#### Array

Arrays allow you to add multiple similar **items** to a list. Use the **items** keyword to describe the items' type etc.

#### String

Just plain text. You can prefill this using the **default** keyword.

To allow only certain values, you can use the **enum** keyword.
