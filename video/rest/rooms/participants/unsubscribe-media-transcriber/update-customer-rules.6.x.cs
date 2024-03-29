// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Video.V1;
using static Twilio.Rest.Video.V1.Participant;

class Program
{
    static void Main(string[] args)
    {
        // Find your API Key SID and Secret at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string apiKeySid = Environment.GetEnvironmentVariable("TWILIO_API_KEY_SID");
        const string apiKeySecret = Environment.GetEnvironmentVariable("TWILIO_API_KEY_SECRET");

        TwilioClient.Init(apiKeySid, apiKeySecret);

        var rules = new[]
        {
                new Dictionary<string,object>(){
                    {"type", "include"}, {"publisher", "Instructor"}
                },
        };

        SubscribeRulesResource.Update(
            "RMXXXX",
            "media-transcriber",
            rules);

        Console.WriteLine("Subscribe Rules updated successfully");
    }
}
