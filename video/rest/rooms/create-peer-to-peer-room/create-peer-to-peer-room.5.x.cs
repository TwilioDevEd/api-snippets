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
        const string recordingSid = "RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        TwilioClient.Init(accountSid, authToken);

        var room = RoomResource.Create(
            uniqueName: "DailyStandup",
            type: RoomResource.RoomTypeEnum.PeerToPeer,
            enableTurn: true,
            statusCallback: new Uri("http://example.org"));

        Console.WriteLine(room.Sid);
    }
}
