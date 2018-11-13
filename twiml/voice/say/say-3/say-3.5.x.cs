using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Hej!", language: "sv-SE");

        Console.WriteLine(response.ToString());
    }
}
