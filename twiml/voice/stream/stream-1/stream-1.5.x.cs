using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var start = new Start();
        start.Stream(name: "Example Audio Stream", url: "wss://mystream.ngrok.io/audiostream");
        response.Append(start);

        Console.WriteLine(response.ToString());
    }
}
