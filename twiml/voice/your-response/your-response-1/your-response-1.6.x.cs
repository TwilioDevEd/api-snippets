using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Hello World");
        response.Play(new Uri("https://api.twilio.com/Cowbell.mp3"));

        Console.WriteLine(response.ToString());
    }
}
