// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using System;
using System.Collections.Generic;
using Twilio.Security;

class Example
{
    static void Main(string[] args)
    {
        // Your Auth Token from twilio.com/console
        const string authToken = "your-secret";

        // Initialize the validator
        var validator = new RequestValidator(authToken);

        // The Twilio request URL
        const string url = "https://mycompany.com/myapp.php?foo=1&bar=2";

        // The X-Twilio-Signature header attached to the request
        const string twilioSignature = "RSOYDt4T1cUTdK1PDd93/VVr8B8=";

        var parameters = new Dictionary<string, string>
        {
            {"CallSid", "CA1234567890ABCDE"},
            {"Caller", "+14158675310"},
            {"Digits", "1234"},
            {"From", "+14158675310"},
            {"To", "+18005551212"}
        };

        Console.WriteLine(validator.Validate(url, parameters, twilioSignature));
    }
}
