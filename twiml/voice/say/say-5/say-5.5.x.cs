using Twilio.TwiML;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Bom dia.", voice: "alice", language: "pt-BR", loop: 2);

        Console.WriteLine(response.ToString());;
    }
}
