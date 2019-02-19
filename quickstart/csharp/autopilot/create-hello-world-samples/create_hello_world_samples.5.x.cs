// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Newtonsoft.Json.Linq;
using Twilio;
using Twilio.Rest.Autopilot.V1.Assistant.Task;

class Example
{
    static void Main(string[] args)
    {
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";

        TwilioClient.Init(accountSid, authToken);

        var phrases = new string[] {"hello", "hi", "Hello", "Hi there!"};

        foreach (var phrase in phrases)
        {
            var sample = SampleResource.Create(
                pathAssistantSid: "UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
                pathTaskSid: "hello-world",
                language: "en-us",
                taggedText: phrase
            );

            Console.WriteLine(sample.Sid);
        }
    }
}
