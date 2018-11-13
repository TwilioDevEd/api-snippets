using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Queue("support", url: new Uri("about_to_connect.xml", UriKind
            .Relative));
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
