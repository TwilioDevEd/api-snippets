// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Fax.V1;
using Twilio.Types;
using System.Collections.Generic;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        TwilioClient.Init(accountSid, authToken);

        var to = "+15558675310";
        var mediaUrl = new Uri(
            "https://www.twilio.com/docs/documents/25/justthefaxmaam.pdf");

        var fax = FaxResource.Create(to, mediaUrl, from: "+15017122661");

        Console.WriteLine(fax.Sid);
    }
}
