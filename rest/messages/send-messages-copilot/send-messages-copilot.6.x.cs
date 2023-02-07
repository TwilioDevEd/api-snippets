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
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        TwilioClient.Init(accountSid, authToken);

        var to = new PhoneNumber("+441632960675");
        var message = MessageResource.Create(
            to,
            messagingServiceSid: "MG9752274e9e519418a7406176694466fa",
            body: "Phantom Menace was clearly the best of the prequel trilogy.");

        Console.WriteLine(message.Sid);
   }
}
