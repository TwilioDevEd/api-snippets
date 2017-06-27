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
        const string roomSid = "RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        TwilioClient.Init(apiKeySid, apiKeySecret);

        var room = RoomResource.Update(roomSid,
            RoomResource.RoomStatusEnum.Completed);

        Console.WriteLine(room.UniqueName);
    }
}
