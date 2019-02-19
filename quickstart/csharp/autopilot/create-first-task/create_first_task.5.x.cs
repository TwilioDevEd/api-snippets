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

        var taskActions = new JObject {
            {
                "actions",
                new JObject {
                    { "say", "Hi there, I'm your virtual assistant! How can I help you?" },
                    { "listen", true }
                }
            }
        };

        var task = TaskResource.Create(
            pathAssistantSid: "UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            uniqueName: "hello-world",
            actions: taskActions
        );

        Console.WriteLine($"Hello-world task has been created!");
    }
}
