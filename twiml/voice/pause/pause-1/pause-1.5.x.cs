using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("I will pause 10 seconds starting now!");
        response.Pause(length: 10);
        response.Say("I just paused 10 seconds");

        Console.WriteLine(response.ToString());
    }
}
