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
        const string authToken = "[AuthToken]";
        TwilioClient.Init(accountSid, authToken);

        var to = new PhoneNumber("+16518675309");
        var message = MessageResource.Create(
            to,
            messagingServiceSid: "MG9752274e9e519418a7406176694466fa",
            body: "Phantom Menace was clearly the best of the prequel trilogy.");

        Console.WriteLine(message.Sid);
   }
}
