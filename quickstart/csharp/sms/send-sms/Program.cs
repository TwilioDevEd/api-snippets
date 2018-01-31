// Get the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

namespace YourNewConsoleApp
{
    class Example
    {
        static void Main(string[] args)
        {
            // Find your Account Sid and Auth Token at twilio.com/console
            const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            const string authToken = "your_auth_token";
            TwilioClient.Init(accountSid, authToken);

            var to = new PhoneNumber("+15017122661");
            var message = MessageResource.Create(
                to,
                from: new PhoneNumber("+15558675310"),
                body: "This is the ship that made the Kessel Run in fourteen parsecs?");

            Console.WriteLine(message.Sid);
        }
    }
}
