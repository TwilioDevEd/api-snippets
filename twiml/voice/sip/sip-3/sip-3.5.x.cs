using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial
            .Sip(new Uri("sip:jack@example.com?x-mycustomheader=foo&x-myotherheader=bar"));
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
