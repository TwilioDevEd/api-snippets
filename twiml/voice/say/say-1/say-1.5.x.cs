using Twilio.TwiML;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Chapeau!", voice: "woman", language: "fr");

        Console.WriteLine(response.ToString());;
    }
}
