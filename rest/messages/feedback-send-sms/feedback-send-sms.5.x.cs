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

        // Generate a random, unique code
        const string uniqueCode = "1234567890";
        var to = new PhoneNumber("+15558675310");
        var message = MessageResource.Create(
            to,
            from: new PhoneNumber("+15017122661"),
            body: $"Open to confirm: http://yourserver.com/confirm?id={uniqueCode}",
            provideFeedback: true);

        Console.WriteLine("We should save this to a database:");
        Console.WriteLine("Unique Code = " + uniqueCode);
        Console.WriteLine("Message SID = " + message.Sid);
    }
}
