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
        const string apiKeySid = "SKXXXX";
        const string apiKeySecret = "your_api_key_secret";

        TwilioClient.Init(apiKeySid, apiKeySecret);

        var subscribedTracks = SubscribedTrackResource.Read(
              "RMXXXX",
              "PAXXXX");

        foreach (var record in subscribedTracks){
            Console.WriteLine("Read subscribed track with sid = " + record.Sid);
        }
    }
}
