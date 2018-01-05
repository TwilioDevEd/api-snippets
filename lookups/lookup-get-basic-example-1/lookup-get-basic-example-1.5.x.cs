// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Lookups.V1;
using Twilio.Types;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";

        TwilioClient.Init(accountSid, authToken);

        // Look up a phone number in E.164 format
        var phoneNumber = PhoneNumberResource.Fetch(
            new PhoneNumber("+15108675310"),
            type: new List<string> { "carrier" });

        Console.WriteLine(phoneNumber.Carrier["name"]);
        Console.WriteLine(phoneNumber.Carrier["type"]);
    }
}
