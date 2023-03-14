using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Enqueue("support", waitUrl: new Uri("wait-music.xml", UriKind
            .Relative));

        Console.WriteLine(response.ToString());
    }
}
