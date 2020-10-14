// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio.Rest.Api.V2010;
using Twilio;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string subAccountSid = Environment.GetEnvironmentVariable("TWILIO_SUBACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        TwilioClient.Init(accountSid, authToken);

        var account = AccountResource.Fetch(Environment.GetEnvironmentVariable(subAccountSid));

        Console.WriteLine(account.DateCreated);
    }
}
