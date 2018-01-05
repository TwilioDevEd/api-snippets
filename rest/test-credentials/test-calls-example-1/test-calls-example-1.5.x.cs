// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        var to = new PhoneNumber("+14108675310");
        var from = new PhoneNumber("+15005550006");
        var call = CallResource.Create(
            to,
            from,
            url: new Uri("http://demo.twilio.com/docs/voice.xml"));

        Console.WriteLine(call.Sid);
    }
}
