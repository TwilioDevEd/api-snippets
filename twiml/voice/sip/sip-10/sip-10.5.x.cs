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
        dial.Sip(new Uri("sip:kate@example.com"),
            statusCallbackEvent: new []{Sip.EventEnum.Initiated, Sip.EventEnum
            .Ringing, Sip.EventEnum.Answered, Sip.EventEnum.Completed}.ToList(),
            statusCallback: new Uri("https://myapp.com/calls/events"),
            statusCallbackMethod: Twilio.Http.HttpMethod.Post);
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
