using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect();
        connect.Conversation(record: Conversation.RecordEnum.RecordFromAnswer, recordingStatusCallback: new Uri("https://example.com/yourRecordingStatusCallback"), serviceInstanceSid: "ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
        response.Append(connect);

        Console.WriteLine(response.ToString());
    }
}
