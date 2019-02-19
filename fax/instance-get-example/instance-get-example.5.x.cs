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

        const string faxSid = "FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";

        TwilioClient.Init(accountSid, authToken);

        var fax = FaxResource.Fetch(faxSid);

        Console.WriteLine(fax.Sid);
    }
}
