// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Video.V1;
using System.Collections.Generic;

class Example
{
    static void Main (string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string apiKeySid = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string apiKeySecret = "your_api_key_secret";
        const string participantSid = "ParticipantSid";

        TwilioClient.Init(apiKeySid, apiKeySecret);

        var recordings = RecordingResource.Read(
            status: RecordingResource.StatusEnum.Deleted,
            groupingSid: new List<string>() {participantSid});

        foreach (var recording in recordings)
        {
            Console.WriteLine(recording.Sid);
        }
    }
}
