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
        // To set up environmental variables, see http://twil.io/secure
        const string apiKeySid = Environment.GetEnvironmentVariable("TWILIO_API_KEY_SID");
        const string apiKeySecret = Environment.GetEnvironmentVariable("TWILIO_API_KEY_SECRET");

        ResourceSet<PublishedTrackResource> publishedTracks = PublishedTrackResource.Read(
                 "DailyStandup",
                 "Alice");

        foreach(PublishedTrackResource pt in publishedTracks)
        {
           Console.WriteLine(pt.Sid);
        }
    }
}
