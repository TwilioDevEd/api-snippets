using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Bonjour!", language: "fr-FR");

        Console.WriteLine(response.ToString());
    }
}
