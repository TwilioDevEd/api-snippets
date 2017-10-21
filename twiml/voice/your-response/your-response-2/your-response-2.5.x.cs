using Twilio.TwiML;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Hello");

        Console.WriteLine(response.ToString());;
    }
}
