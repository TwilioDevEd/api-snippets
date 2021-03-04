using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Number("415-123-4567", url: new Uri("http://example.com/agent_screen_call"));
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
