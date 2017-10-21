using static Twilio.TwiML.Voice.Conference;
using System;
using System.Collections.Generic;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();

        dial.Conference(
            "EventedConf",
            statusCallback: new Uri("https://myapp.com/events"),
            statusCallbackEvent: new List<EventEnum>(
                new EventEnum[] {
                    EventEnum.Start,
                    EventEnum.End,
                    EventEnum.Join,
                    EventEnum.Leave,
                    EventEnum.Mute,
                    EventEnum.Hold
                }
            )
        );

        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
