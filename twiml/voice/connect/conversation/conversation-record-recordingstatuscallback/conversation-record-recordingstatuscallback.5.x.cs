using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect();
        connect.Conversation(record: "record-from-answer", recordingStatusCallback: new Uri("https://your-recording-status-callback-url.com/"), serviceInstanceSid: "ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
        response.Append(connect);

        Console.WriteLine(response.ToString());
    }
}
