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
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        var to = new PhoneNumber("+15017250604");
        var message = MessageResource.Create(
            to,
            from: new PhoneNumber("+15558675309"),
            body: "McAvoy or Stewart? These timelines can get so confusing.",
            statusCallback: new Uri("http://requestb.in/1234abcd"));

        Console.WriteLine(message.Sid);
   }
}
