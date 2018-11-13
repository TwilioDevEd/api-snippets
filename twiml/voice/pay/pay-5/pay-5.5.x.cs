using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var pay = new Pay();
        var prompt = new Prompt(for_: "payment-card-number");
        prompt
            .Play(new Uri("https://myurl.com/twilio/twiml/audio/card_number.mp3"));
        pay.Append(prompt);
        response.Append(pay);

        Console.WriteLine(response.ToString());
    }
}
