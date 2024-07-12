using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var stop = new Stop();
        stop.Transcription(name: "Contact center transcription");
        response.Append(stop);

        Console.WriteLine(response.ToString());
    }
}
