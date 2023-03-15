using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Sip(new Uri("kate@example.com", UriKind.Relative));
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
