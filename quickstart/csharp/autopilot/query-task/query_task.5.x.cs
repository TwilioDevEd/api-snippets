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

        var query = QueryResource.Create(
            pathAssistantSid:"UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
            language: "en-US",
            query: "Tell me a joke"
        );

        Console.WriteLine(query.Results.ToString());
    }
}
