// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Sync.V1.Service;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string serviceSid = "default";

        TwilioClient.Init(accountSid, authToken);

        var data = new
        {
            led = "ON"
        };

        var doc = DocumentResource.Update(serviceSid,
                                          "BoardLED",
                                          data);

        Console.WriteLine(doc.Data);
    }
}
