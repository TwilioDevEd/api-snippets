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
        prompt.Say("Please enter your 16 digit Visa or Mastercard number.");
        pay.Append(prompt);
        response.Append(pay);

        Console.WriteLine(response.ToString());
    }
}
