using Twilio.TwiML;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Record(timeout: 10, transcribe: true);

        Console.WriteLine(response.ToString());;
    }
}
