// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Video.V1.Room;

class Example
{
    static void Main (string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string roomSid = "RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string recordingSid = "RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        TwilioClient.Init(accountSid, authToken);

        var recording = RoomRecordingResource.Fetch(roomSid, recordingSid);

        Console.WriteLine(recording.Type);
    }
}
