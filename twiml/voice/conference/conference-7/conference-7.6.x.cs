using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Conference("Customer Waiting Room", beep: Conference.BeepEnum
            .False);
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
