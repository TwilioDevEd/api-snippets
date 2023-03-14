using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Calling Twilio Pay");
        response.Pay(chargeAmount: "20.45",
            action: new Uri("https://enter-your-callback-function-url.twil.io/pay"));

        Console.WriteLine(response.ToString());
    }
}
