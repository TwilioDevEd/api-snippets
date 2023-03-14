using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("You will now be connected to an agent.");

        Console.WriteLine(response.ToString());
    }
}
