using System;
using System.Collections.Generic;
using Twilio.Http;
using Twilio.TwiML;
using Twilio.TwiML.Voice;
using Twilio.Types;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Number("+14155555555",
            statusCallbackEvent: new List<Number.EventEnum> (
                new Number.EventEnum[] {
                      Number.EventEnum.Initiated,
                      Number.EventEnum.Ringing,
                      Number.EventEnum.Answered,
                      Number.EventEnum.Completed
                  }),
            statusCallback: new Uri("https://myapp.com/calls/events"),
            statusCallbackMethod: HttpMethod.Post);

        dial.Number("+14153333333",
            statusCallbackEvent: new List<Number.EventEnum> (
                new Number.EventEnum[] {
                      Number.EventEnum.Initiated,
                      Number.EventEnum.Ringing,
                      Number.EventEnum.Answered,
                      Number.EventEnum.Completed
                  }),
            statusCallback: new Uri("https://example.com/events"),
            statusCallbackMethod: HttpMethod.Post);

        response.Append(dial);

        Console.WriteLine(response.ToString());;
    }
}
