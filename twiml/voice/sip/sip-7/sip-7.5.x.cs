using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Sip(new Uri("kate@example.com", UriKind.Relative),
            username: "admin", password: "1234");
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
