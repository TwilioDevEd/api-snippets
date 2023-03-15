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
        var prompt = new Prompt(cardType: new []{Prompt.CardTypeEnum.Visa}
            .ToList(), for_: "security-code");
        prompt
            .Say("Please enter security code for your Visa card. It’s the 3 digits located on the back of your card");
        pay.Append(prompt);
        response.Append(pay);

        Console.WriteLine(response.ToString());
    }
}
