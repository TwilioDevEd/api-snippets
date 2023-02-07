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
        const string alertSid = "NO5a7a84730f529f0a76b3e30c01315d1a";

        TwilioClient.Init(accountSid, authToken);

        var status = AlertResource.Delete(alertSid);

        Console.WriteLine(status);
    }
}
