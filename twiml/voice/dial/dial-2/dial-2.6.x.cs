using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Dial("415-123-4567");
        response.Say("Goodbye");

        Console.WriteLine(response.ToString());
    }
}
