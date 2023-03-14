using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;
using System.Linq;

class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var pay = new Pay();
        var prompt = new Prompt(cardType: new []{Prompt.CardTypeEnum.Amex}
            .ToList(), for_: "security-code");
        prompt
            .Say("Please enter security code for your American Express card. It’s the 4 digits located on the front of your card");
        pay.Append(prompt);
        response.Append(pay);

        Console.WriteLine(response.ToString());
    }
}
