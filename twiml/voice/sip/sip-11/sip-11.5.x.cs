using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Number("+12143211432");
        dial.Sip(new Uri("sip:alice-soft-phone@example.com"));
        dial.Sip(new Uri("sip:alice-desk-phone@example.com"));
        dial.Sip(new Uri("sip:alice-mobile-client@example.com"));
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
