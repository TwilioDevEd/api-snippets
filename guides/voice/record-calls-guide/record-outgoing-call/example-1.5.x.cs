// Download the twilio-csharp library from twilio.com/docs/libraries/csharp

using System;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

class Example
{
    static void Main(string[] args) 
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";

        Twilio.Init(accountSid, authToken);
        var call = CallResource.Create(new PhoneNumber("+14155551212"),
                                       new PhoneNumber("+15017250604"),
                                       url: new Uri("http://demo.twilio.com/docs/voice.xml"),
                                       record: true);

        Console.WriteLine(call.Sid);
    }
}
