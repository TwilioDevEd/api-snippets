// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using Twilio;
using Twilio.Rest.Verify.V2.Service;


class Program 
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Token at twilio.com/console
        // DANGER! This is insecure. See http://twil.io/secure
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";

        TwilioClient.Init(accountSid, authToken);

        var verification = VerificationResource.Update(
            status: VerificationResource.StatusEnum.Approved,
            pathServiceSid: "VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            pathSid: "+14159373912"
        );

        Console.WriteLine(verification.To);
    }
}