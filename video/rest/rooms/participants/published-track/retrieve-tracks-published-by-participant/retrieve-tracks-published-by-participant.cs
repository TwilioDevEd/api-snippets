using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Base;
using Twilio.Rest.Video.V1.Room.Participant;

class Program
{
    static void Main(string[] args)
    {
        // Find your API Key SID and Secret at twilio.com/console
        const string apiKeySid = "SKXXXX";
        const string apiKeySecret = "your_api_key_secret";

        ResourceSet<PublishedTrackResource> publishedTracks = PublishedTrackResource.Read(
                 "DailyStandup",
                 "Alice");

        foreach(PublishedTrackResource pt in publishedTracks)
        {
           Console.WriteLine(pt.Sid);
        }
    }
}
