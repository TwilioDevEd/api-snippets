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
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

        // Initialize the request validator
        var validator = new RequestValidator(authToken);

        // Store Twilio's request URL (the url of your webhook) as a variable
        const string url = "https://example.com/myapp";

        // Store the application/x-www-form-urlencoded params from Twilio's request as a variable
        // In practice, this MUST include all received parameters, not a
        // hardcoded list of parameters that you receive today. New parameters
        // may be added without notice.
        var parameters = new Dictionary<string, string>
        {
            {"CallSid", "CA1234567890ABCDE"},
            {"Caller", "+12349013030"},
            {"Digits", "1234"},
            {"From", "+12349013030"},
            {"To", "+18005551212"}
        };

        // Store the X-Twilio-Signature header attached to the request as a variable
        const string twilioSignature = "Np1nax6uFoY6qpfT5l9jWwJeit0=";

        // Check if the incoming signature is valid for your application URL and the incoming parameters
        Console.WriteLine(validator.Validate(url, parameters, twilioSignature));
    }
}
