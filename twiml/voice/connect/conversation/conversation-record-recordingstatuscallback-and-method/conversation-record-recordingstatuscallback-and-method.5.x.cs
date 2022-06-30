using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect();
        connect.Conversation(serviceInstanceSid: "ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", record: Conversation.RecordEnum.RecordFromAnswer, recordingStatusCallback: new Uri("https://example.com/yourRecordingStatusCallback"), recordingStatusCallbackMethod: Twilio.Http.HttpMethod.Get);
        response.Append(connect);

        Console.WriteLine(response.ToString());
    }
}
