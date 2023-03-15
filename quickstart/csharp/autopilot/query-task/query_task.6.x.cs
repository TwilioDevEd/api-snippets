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

        var query = QueryResource.Create(
            pathAssistantSid:"UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            language: "en-US",
            query: "Tell me a joke"
        );

        Console.WriteLine(query.Results.ToString());
    }
}
