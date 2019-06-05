// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Video.V1;
using static Twilio.Rest.Video.V1.CompositionResource;

class Program
{
    static void Main(string[] args)
    {
        // Find your API Key SID and Secret at twilio.com/console
        const string apiKeySid = "SKXXXX";
        const string apiKeySecret = "your_api_key_secret";

        TwilioClient.Init(apiKeySid, apiKeySecret);

        var rules = new[]
        {
                new Dictionary<string,object>(){
                    {"type", "include"}, {"all", true} },
                new Dictionary<string, object>(){
                    {"type", "exclude"}, {"publisher", "Supervisor"}
                }
        };

        SubscribeRulesResource.Update(
            "RMXXXX",
            "Customer",
            rules);

        Console.WriteLine("Subscribe Rules updated successfully");
    }
}
