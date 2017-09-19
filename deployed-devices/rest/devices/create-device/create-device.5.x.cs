// Get the Node helper library from https://twilio.com/docs/libraries/csharp
using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Preview.DeployedDevices.Fleet

public class Example
{
    public static void Main(string[] args)
    {
        // Get your Account SID and Auth Token from https://twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        var device = DeviceResource.Create(
            pathFleetSid: "FLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            friendlyName: "My Device #1"
        );

        Console.WriteLine(device.Sid);
    }
}
