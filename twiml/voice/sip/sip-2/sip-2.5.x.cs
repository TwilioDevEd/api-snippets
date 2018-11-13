using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Sip(new Uri("sip:kate@example.com"), username: "admin",
            password: "1234");
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
