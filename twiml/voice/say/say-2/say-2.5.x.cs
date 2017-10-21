using Twilio.TwiML;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Chapeau!", voice: "alice", language: "fr-FR");

        Console.WriteLine(response.ToString());;
    }
}
