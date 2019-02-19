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
        const string actorSid = "USd0afd67cddff4ec7cb0022771a203cb1";
        const string resourceSid = "PN4aa51b930717ea83c91971b86d99018f";

        TwilioClient.Init(accountSid, authToken);

        var events = EventResource.Read(actorSid, resourceSid: resourceSid);

        foreach (var e in events)
        {
            Console.WriteLine(e.Description);
        }
    }
}
