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
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        TwilioClient.Init(accountSid, authToken);

        var mediaUrl = new List<Uri>() {
            new Uri( "https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg" )
        };
        var to = new PhoneNumber("+15017122661");
        var message = MessageResource.Create(
            to,
            from: new PhoneNumber("+15558675310"),
            body: "This is the ship that made the Kessel Run in fourteen parsecs?",
            mediaUrl: mediaUrl);
        Console.WriteLine(message.Sid);
   }
}
