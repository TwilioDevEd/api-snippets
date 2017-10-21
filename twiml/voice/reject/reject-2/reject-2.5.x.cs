using Twilio.TwiML;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Reject(reason: "busy");

        Console.WriteLine(response.ToString());;
    }
}
