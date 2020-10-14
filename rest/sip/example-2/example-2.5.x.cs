// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using System;
using Twilio;
using Twilio.Types;
using Twilio.Rest.Api.V2010.Account;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        // To set up environmental variables, see http://twil.io/secure
        string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

        TwilioClient.Init(accountSid, authToken);

        var call = CallResource.Create(
            new Twilio.Types.Client("sip:kate@example.com"),
            new PhoneNumber("Jack"), url: new Uri("http://www.example.com/sipdial.xml"),
            sipAuthPassword: "secret", sipAuthUsername: "jack");

        Console.WriteLine(call.Sid);
    }
}
