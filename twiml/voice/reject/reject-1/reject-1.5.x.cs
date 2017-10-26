using Twilio.TwiML;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Reject();

        Console.WriteLine(response.ToString());;
    }
}
