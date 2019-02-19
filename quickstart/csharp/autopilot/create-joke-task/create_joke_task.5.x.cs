// Download the twilio-csharp library from twilio.com/docs/csharp/install
using Newtonsoft.Json.Linq;
using System;
using Twilio.Rest.Autopilot.V1.Assistant;
using Twilio;

class Example
{
    static void Main(string[] args)
    {
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";

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
