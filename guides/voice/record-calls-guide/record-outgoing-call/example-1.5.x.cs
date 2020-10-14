// Download the twilio-csharp library from twilio.com/docs/libraries/csharp

using System;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;
using Twilio;


class Example
{
    static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

        TwilioClient.Init(accountSid, authToken);
        var call = CallResource.Create(new PhoneNumber("+14155551212"),
                                       new PhoneNumber("+15017122661"),
                                       url: new Uri("http://demo.twilio.com/docs/voice.xml"),
                                       record: true);

        Console.WriteLine(call.Sid);
    }
}
