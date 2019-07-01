using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Video.V1.Room.Participant;

class Program
{
    static void Main(string[] args)
    {
        // Find your API Key SID and Secret at twilio.com/console
        const string apiKeySid = "SKXXXX";
        const string apiKeySecret = "your_api_key_secret";

        PublishedTrackResource publishedTrack = PublishedTrackResource.Fetch(
                       "DailyStandup",
                       "Alice",
                       "Camera");

        Console.WriteLine(publishedTrack.Sid);
    }
}
