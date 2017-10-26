using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        var sip = new Sip(new Uri("http://example.com"), "jack");

        response.Append(sip);
        response.Append(dial);

        Console.WriteLine(response.ToString());;
    }
}
