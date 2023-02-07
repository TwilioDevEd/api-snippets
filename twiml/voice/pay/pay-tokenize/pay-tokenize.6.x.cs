using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Pay(tokenType: "one-time", chargeAmount: "0");

        Console.WriteLine(response.ToString());
    }
}
