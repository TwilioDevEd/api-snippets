using Twilio.TwiML;
using Twilio.TwiML.Voice;
using System;

class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Conference("LoveTwilio", record: "record-from-start",
            recordingStatusCallback: new Uri("www.myexample.com"));
        response.Append(dial);

        Console.WriteLine(response.ToString());;
    }
}
