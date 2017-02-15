// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Monitor.V1;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string eventSid = "AE21f24380625e4aa4abec76e39b14458d";

        TwilioClient.Init(accountSid, authToken);

        var e = EventResource.Fetch(eventSid);

        Console.WriteLine(e.Description);
    }
}
