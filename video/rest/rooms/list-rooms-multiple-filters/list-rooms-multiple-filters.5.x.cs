// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Video.V1;

class Example
{
    static void Main (string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string apiKeySid = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string apiKeySecret = "your_api_key_secret";

        TwilioClient.Init(apiKeySid, apiKeySecret);

        var rooms = RoomResource.Read(
            status: RoomResource.RoomStatusEnum.Completed,
            uniqueName: "DailyStandup");

        foreach (var room in rooms)
        {
            Console.WriteLine(room.Sid);
        }
    }
}
