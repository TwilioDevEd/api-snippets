using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial(record: Dial.RecordEnum.RecordFromRingingDual,
            recordingStatusCallback: new Uri("www.myexample.com", UriKind
            .Relative));
        dial.Number("+15558675310");
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
