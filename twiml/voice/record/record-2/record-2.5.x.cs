using Twilio.TwiML;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Record();

        Console.WriteLine(response.ToString());;
    }
}
