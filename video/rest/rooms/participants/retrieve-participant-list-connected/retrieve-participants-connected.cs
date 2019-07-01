using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Video.V1.Room;
using Twilio.Base;

class Program
{
    static void Main(string[] args)
    {
        // Find your API Key SID and Secret at twilio.com/console
        const string apiKeySid = "SKXXXX";
        const string apiKeySecret = "your_api_key_secret";

        ResourceSet<ParticipantResource> participants = ParticipantResource.Read(
                  "DailyStandup",
                  ParticipantResource.StatusEnum.Connected);

        foreach(ParticipantResource p in participants)
        {
            Console.WriteLine(p.Sid);
        }
    }
}
