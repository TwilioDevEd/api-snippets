using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;
using System.Collections.Generic;

class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect();
        connect.Conversation(serviceInstanceSid: "ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", record:Conversation.RecordEnum.RecordFromAnswer, recordingStatusCallback: new Uri("https://example.com/yourRecordingStatusCallback"), recordingStatusCallbackEvent: new List<Conversation.RecordingEventEnum>{Conversation.RecordingEventEnum.InProgress, Conversation.RecordingEventEnum.Completed});
        response.Append(connect);

        Console.WriteLine(response.ToString());
    }
}
