// Download the twilio-csharp library from twilio.com/docs/csharp/install
using Newtonsoft.Json.Linq;
using System;
using Twilio.Rest.Autopilot.V1.Assistant;
using Twilio;

class Example
{
    static void Main(string[] args)
    {
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

        TwilioClient.Init(accountSid, authToken);

        var jokeActions = new JObject {
            {
                "actions",
                new JObject {
                    { "say", "I was going to look for my missing watch, but I could never find the time." }
                }
            }
        };

        var task = TaskResource.Create(
            pathAssistantSid:"UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            uniqueName:"tell-a-joke",
            actions: jokeActions
        );

        Console.WriteLine("Tell-a-joke task has been created!");

    }
}
