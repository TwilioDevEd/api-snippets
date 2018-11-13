using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Pause(length: 5);
        response.Say("Hi there.");

        Console.WriteLine(response.ToString());
    }
}
