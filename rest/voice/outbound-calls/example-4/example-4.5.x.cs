// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;
using Twilio.Http;
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

        var to = new PhoneNumber("+14155551212");
        var from = new PhoneNumber("+18668675310");
        var statusCallbackEvents = new List<EventEnum>() {
            EventEnum.Initiated,
            EventEnum.Ringing,
            EventEnum.Answered,
            EventEnum.Completed
        };
        var call = CallResource.Create(
            to,
            from,
            url: new Uri("http://demo.twilio.com/docs/voice.xml"),
            statusCallback: new Uri("https://www.myapp.com/events"),
            statusCallbackMethod: HttpMethod.Post,
            statusCallbackEvent: statusCallbackEvents);

        Console.WriteLine(call.Sid);
    }
}
