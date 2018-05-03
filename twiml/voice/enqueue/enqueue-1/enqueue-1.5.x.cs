using Twilio.TwiML;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Enqueue("support", waitUrl: new Uri("wait-music.xml"));

        Console.WriteLine(response.ToString());;
    }
}
