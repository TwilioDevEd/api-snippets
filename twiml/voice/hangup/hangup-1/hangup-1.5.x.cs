using Twilio.TwiML;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Hangup();

        Console.WriteLine(response.ToString());;
    }
}
