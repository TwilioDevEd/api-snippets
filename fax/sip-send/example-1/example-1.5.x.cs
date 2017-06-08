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
        const string accountSid = "AC850685e1d9b8c09dae0b938923dc0d42";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        var from = "Jack";
        var to = "sip:kate@example.com";
        var mediaUrl = new Uri(
           "https://www.twilio.com/docs/documents/25/justthefaxmaam.pdf");

        var fax = FaxResource.Create(to, mediaUrl, from: from);

        Console.WriteLine(fax.Sid);
    }
}
