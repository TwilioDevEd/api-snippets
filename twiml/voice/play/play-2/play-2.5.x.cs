using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Play(new Uri("https://api.twilio.com/cowbell.mp3"));

        Console.WriteLine(response.ToString());
    }
}
