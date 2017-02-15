// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Preview.Wireless;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";

        TwilioClient.Init(accountSid, authToken);

        var device = DeviceResource.Create("{{ rate_plan_sid }}",
                                           alias: "996224413905003",
                                           friendlyName: "Charlie's SmartMeter");

        Console.WriteLine(device.FriendlyName);
    }
}
