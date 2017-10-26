using Twilio.TwiML;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Gather();

        Console.WriteLine(response.ToString());;
    }
}
