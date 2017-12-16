using Twilio.TwiML;
using Twilio.TwiML.Voice;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Conference("moderated-conference-room",
            startConferenceOnEnter: false);
        response.Append(dial);

        Console.WriteLine(response.ToString());;
    }
}
