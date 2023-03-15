using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Dial("415-123-4567", action: new Uri("/handleDialCallStatus"),
            method: Twilio.Http.HttpMethod.Get);
        response.Say("I am unreachable");

        Console.WriteLine(response.ToString());
    }
}
