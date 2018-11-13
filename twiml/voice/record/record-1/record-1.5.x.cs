using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Record(timeout: 10, transcribe: true);

        Console.WriteLine(response.ToString());
    }
}
