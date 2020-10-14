// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using Twilio;
using Twilio.Rest.Verify.V2.Service;


class Program
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

        TwilioClient.Init(accountSid, authToken);

        var verification = VerificationResource.Update(
            status: VerificationResource.StatusEnum.Approved,
            pathServiceSid: "VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            pathSid: "+15017122661"
        );

        Console.WriteLine(verification.To);
    }
}
