using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Conference("Room 1234");
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
