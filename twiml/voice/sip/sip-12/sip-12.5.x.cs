using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial(sequential: true);
        dial.Sip(new Uri("sip:alice@example.com"));
        dial.Sip(new Uri("sip:bob@example.com"));
        dial.Sip(new Uri("sip:charlie@example.com"));
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
