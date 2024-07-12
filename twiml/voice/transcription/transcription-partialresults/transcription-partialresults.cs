using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var start = new Start();
        start.Transcription(statusCallbackUrl: "https://example.com/your-callback-url", partialResults: true, transcriptionEngine: "google");
        response.Append(start);

        Console.WriteLine(response.ToString());
    }
}
