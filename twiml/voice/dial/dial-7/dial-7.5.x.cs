using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial(record: Dial.RecordEnum.RecordFromAnswer, recordingTrack: "inbound", recordingStatusCallback: new Uri("https://www.myexample.com/recording-handler"));
        dial.Number("+15551239876");
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
