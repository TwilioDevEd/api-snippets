using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Number("415-123-4567", sendDigits: "wwww1928");
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
