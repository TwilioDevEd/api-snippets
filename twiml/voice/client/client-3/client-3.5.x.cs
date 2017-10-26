using static Twilio.TwiML.Voice.Client;
using System;
using Twilio.Http;
using Twilio.TwiML;
using Twilio.TwiML.Voice;
using System.Collections.Generic;

class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();

        dial.Client("jenny",
            statusCallbackEvent: new List<EventEnum>(
                new EventEnum[] {
                    EventEnum.Initiated,
                    EventEnum.Ringing,
                    EventEnum.Answered,
                    EventEnum.Completed
                }
            ),
            statusCallback: new Uri("https://myapp.com/calls/events"),
            statusCallbackMethod: HttpMethod.Post);

        response.Append(dial);

        Console.WriteLine(response.ToString());;
    }
}
