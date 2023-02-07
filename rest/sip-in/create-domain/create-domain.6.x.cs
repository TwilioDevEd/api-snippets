// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account.Sip;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        // To set up environmental variables, see http://twil.io/secure
        string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

        TwilioClient.Init(accountSid, authToken);

        var domain = DomainResource.Create(
            "marlo.sip.twilio.com", accountSid, "My Domain", "IP_ACL",
            new Uri("https://demo.twilio.com/welcome"));

        Console.WriteLine(domain.Sid);
    }
}
