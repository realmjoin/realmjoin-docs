
# JSON - Short Overview

JavaScript Object Notation (short JSON) is a format for storing and transporting data. JSON is often used to send data from a server to a web page.

## Syntax and Structure

A JSON object is based on a key (name) and a value, that is typically rendered in curly brackets.

**Key**: A key is always a string enclosed in quotation marks.  
**Value**: A value can be a string, number, boolean expression, array or object

A pair of a key and a value is an object. An object is surrounded by curly brackets (**{}**). You can separate information (in an object) by ":" and "," .

* ":" = Separates name from value
* "," = Separates name-value pairs

## JSON examples

The following example is about a configuration of AnyDesk:

```
{
"Integration": {
    "AnyDesk": {
        "Enabled": true,
        "BootstrapperUrl" "https://.../.../AnyDesk.exe",
        "Ui":{"TrayMenuEnglish": "Start remote session"

            }
        }
    }
}
```

### All-in-one

In RealmJoin Group Settings, the JSON from above looks like this:

**Key** = Integration  
**Value** = {"AnyDesk: {
          "Enabled": true,
          "BootstrapperUrl": "https://.../.../AnyDesk.exe",
          "Ui": {TrayMenuTextEnglish": "Start remote session} } }

### Split the All-in-one JSON

It is also possible to enable AnyDesk with the following JSON:

**Key** = Integration.AnyDesk.Enabled  
**Value** = true

You just add AnyDesk and Enabled to the key, separated by dots.

Similar to this you can add BootstrapperUrl and TrayMenuTextEnglish as well:

**Key** = Integration.AnyDesk.BootstrapperUrl  
**Value** = "https://.../.../AnyDesk.exe"

and

**Key** = Integration.AnyDesk.UI.TrayMenuTextEnglish  
**Value** = "Start remote session"

These three single JSON settings are equal to the JSON from **All in one**. Combined all of them and you will get the same result from **All in one**

### Combination

If you want neither the all in one JSON nor the three single JSON settings you can use a combination of all of them:

**Key** = Integration.AnyDesk  
**Value** = {"Enabled":true, "BootstrapperUrl": "https://.../.../AnyDesk.exe", "UI":{"TrayMenuTextEnglish": "Start remote session"} }

## JSON Arrays

A JSON array represents a list of values. An array is rendered by square brackets ( **[]**). An array contains multiple values. The values in an array must be separated by commas.

The following example shows the RealmJoin tray menu, specially the **WebLinks** section:

**Key** = WebLinks  
**Value** =  
            [  
              {  
                "Name": "Google",  
                "Target": "https://www.google.com/",  
                "Platform": "any"  
              }  
              {  
                "Name": "Azure",  
                "Target": "https://portal.azure.com",  
                "Platform": "any"  
              }  
            ]

As as result of these JSON you get a **WebLinks** list which contains two links. Google and Microsoft Azure.
