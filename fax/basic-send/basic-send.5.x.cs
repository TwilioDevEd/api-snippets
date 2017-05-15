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
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        var from = "+15017250604";
        var to = "+15558675309";
        var mediaUrl = new Uri(
            "https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg");

        var fax = FaxResource.Create(from, to, mediaUrl);

        Console.WriteLine(fax.Sid);
    }
}
