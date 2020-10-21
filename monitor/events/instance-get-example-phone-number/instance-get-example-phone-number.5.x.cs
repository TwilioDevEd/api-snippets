// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Monitor.V1;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        const string eventSid = "AE21f24380625e4aa4abec76e39b14458d";

        TwilioClient.Init(accountSid, authToken);

        var e = EventResource.Fetch(eventSid);

        Console.WriteLine(e.Description);
    }
}
