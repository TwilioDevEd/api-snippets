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

        var to = new PhoneNumber("+15017122661");
        var message = MessageResource.Create(
            to,
            from: new PhoneNumber("+15558675310"),
            body: "McAvoy or Stewart? These timelines can get so confusing.",
            statusCallback: new Uri("http://requestb.in/1234abcd"));

        Console.WriteLine(message.Sid);
   }
}
