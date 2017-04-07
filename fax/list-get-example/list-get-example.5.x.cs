// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Fax.V1;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        var faxes = FaxResource.Read();

        foreach (var fax in faxes)
        {
        	Console.WriteLine(fax.MediaUrl);
        }
    }
}
