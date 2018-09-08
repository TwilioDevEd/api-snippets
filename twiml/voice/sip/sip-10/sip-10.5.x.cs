using static Twilio.TwiML.Voice.Sip;
using System;
using System.Collections.Generic;
using Twilio.Converters;
using Twilio.Http;
using Twilio.TwiML;
using Twilio.TwiML.Voice;

class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        var sip = new Sip(
            new Uri("http://example.com"),
            "kate",
            statusCallbackEvent: new List<EventEnum>(
                EventEnum.Initiated,
                EventEnum.Ringing,
                EventEnum.Answered,
                EventEnum.Completed
            ),
            statusCallback: new Uri("https://myapp.com/calls/events"),
            statusCallbackMethod: HttpMethod.Post
        );

        dial.Append(sip);
        response.Append(dial);

        Console.WriteLine(response.ToString());;
    }
}
