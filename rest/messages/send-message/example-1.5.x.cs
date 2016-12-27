// Download the twilio-csharp library from twilio.com/docs/csharp/install
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
            new Uri( "https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg" )
        };
        const string body =
            "This is the ship that made the Kessel Run in fourteen parsecs?";
        var message = MessageResource.Create(new PhoneNumber("+15017250604"),
                                             from: new PhoneNumber("+15558675309"),
                                             body: body,
                                             mediaUrl: mediaUrl);
        Console.WriteLine(message.Sid);
   }
}
