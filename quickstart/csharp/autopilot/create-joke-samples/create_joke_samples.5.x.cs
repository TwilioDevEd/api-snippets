// Download the twilio-csharp library from twilio.com/docs/csharp/install
using Newtonsoft.Json.Linq;
using System;
using Twilio.Rest.Autopilot.V1.Assistant.Task;
using Twilio;

class Example
{
    static void Main(string[] args)
    {
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";

        TwilioClient.Init(accountSid, authToken);

        var phrases = new string[] {
            "Tell me a joke",
            "Tell me a joke",
            "I'd like to hear a joke",
            "Do you know any good jokes?",
            "Joke",
            "Tell joke",
            "Tell me something funny",
            "Make me laugh",
            "I want to hear a joke",
            "Can I hear a joke?",
            "I like jokes",
            "I'd like to hear a punny joke"
        };

        foreach (var phrase in phrases)
        {
            var sample = SampleResource.Create(
                pathAssistantSid: "",
                pathTaskSid: "tell-a-joke",
                language: "en-us",
                taggedText: phrase
            );

            Console.WriteLine(sample.Sid);
        }
    }
}
