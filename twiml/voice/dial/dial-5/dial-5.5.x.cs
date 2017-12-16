using Twilio.TwiML;
using Twilio.TwiML.Voice;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial(record: "record-from-ringing-dual",
            recordingStatusCallback: new Uri("www.myexample.com"));
        dial.Number("+15558675309");
        response.Append(dial);

        Console.WriteLine(response.ToString());;
    }
}
