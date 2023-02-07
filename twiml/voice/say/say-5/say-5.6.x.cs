using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Bom dia.", voice: "alice", language: "pt-BR", loop: 2);

        Console.WriteLine(response.ToString());
    }
}
