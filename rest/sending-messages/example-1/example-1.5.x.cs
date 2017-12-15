// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
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

        var mediaUrl = new List<Uri>() {
            new Uri("http://www.example.com/cheeseburger.png")
        };
        var to = new PhoneNumber("+14158141829");
        var message = MessageResource.Create(to,
                                             from: new PhoneNumber("+15558675309"),
                                             body: "Let's grab lunch at Milliways tomorrow!",
                                             mediaUrl: mediaUrl);

        Console.WriteLine(message.Sid);
    }
}
