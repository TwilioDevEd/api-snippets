using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Conference("LoveTwilio", record: Conference.RecordEnum
            .RecordFromStart,
            recordingStatusCallback: new Uri("www.myexample.com", UriKind
            .Relative));
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
