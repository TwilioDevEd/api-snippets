using Twilio.TwiML;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("You will now be connected to an agent.");

        Console.WriteLine(response.ToString());;
    }
}
