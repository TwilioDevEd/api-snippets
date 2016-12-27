// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.Http;
using Twilio.Rest.Api.V2010.Account;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        var url = new Uri("http://demo.twilio.com/docs/voice.xml");
        var method = HttpMethod.Post;
        CallResource.Update("CAe1644a7eed5088b159577c5802d8be38",
                            url: url,
                            method: method);
    }
}
