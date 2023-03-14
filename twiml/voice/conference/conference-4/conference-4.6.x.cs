using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;
using System.Linq;

class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Conference("EventedConf",
            statusCallback: new Uri("https://myapp.com/events"),
            statusCallbackEvent: new []{Conference.EventEnum.Start, Conference
            .EventEnum.End, Conference.EventEnum.Join, Conference.EventEnum
            .Leave, Conference.EventEnum.Mute, Conference.EventEnum.Hold}
            .ToList());
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
