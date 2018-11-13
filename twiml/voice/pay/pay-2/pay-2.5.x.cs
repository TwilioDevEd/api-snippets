using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Calling Twilio Pay");
        response.Pay(chargeAmount: "20.45");

        Console.WriteLine(response.ToString());
    }
}
