using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var start = new Start();
        start.Stream(name: "Example Audio Stream", url: "wss://example.com/audiostream");
        response.Append(start);
        response.Say("The stream has started.");

        Console.WriteLine(response.ToString());
    }
}
