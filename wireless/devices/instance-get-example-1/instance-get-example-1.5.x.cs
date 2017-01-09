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
        const string deviceSid = "DEb8eff34b248d066a31c4a953134e183e";

        TwilioClient.Init(accountSid, authToken);

        var device = DeviceResource.Fetch(deviceSid);

        Console.WriteLine(device.FriendlyName);
    }
}
