// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Newtonsoft.Json.Linq;
using Twilio;
using Twilio.Rest.Preview.Wireless.Device;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string deviceSid = "DEb8eff34b248d066a31c4a953134e183e";

        TwilioClient.Init(accountSid, authToken);

        var usage = UsageResource.Fetch(deviceSid);
        var period = JObject.FromObject(usage.Period);
        var dataCosts = JObject.FromObject(usage.DataCosts);

        Console.WriteLine(period["start"]);
        Console.WriteLine(period["end"]);
        Console.WriteLine(dataCosts["total"]);
    }
}
