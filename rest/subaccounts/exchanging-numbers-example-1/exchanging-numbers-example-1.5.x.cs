// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;


class Program
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Token at twilio.com/console
        // DANGER! This is insecure. See http://twil.io/secure
        const string accountSid = "AC00000000000000000000000000000001";
        const string authToken = "your_auth_token";

        TwilioClient.Init(accountSid, authToken);

        var incomingPhoneNumber = IncomingPhoneNumberResource.Update(
            accountSid: "AC00000000000000000000000000000002",
            pathSid: "PNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        );

        Console.WriteLine(incomingPhoneNumber.FriendlyName);
    }
}
