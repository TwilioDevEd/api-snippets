// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Video.V1;


class Example
{
    static void Main (string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";

        TwilioClient.Init(accountSid, authToken);

        var recordings = RecordingResource.Read(
            status: RecordingResource.StatusEnum.Deleted);

        foreach (var recording in recordings)
        {
            Console.WriteLine(recording.Sid);
        }
    }
}
