// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Newtonsoft.Json.Linq;
using Twilio;
using Twilio.Rest.Autopilot.V1.Assistant.Task;

class Example
{
    static void Main(string[] args)
    {
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

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
