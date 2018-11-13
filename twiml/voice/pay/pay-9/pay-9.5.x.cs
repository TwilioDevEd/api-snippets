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
        var prompt = new Prompt(attempt: new []{1}.ToList(),
            for_: "expiration-date");
        prompt
            .Say("Please enter your expiration date, two digits for the month and two digits for the year.");
        pay.Append(prompt);
        var prompt2 = new Prompt(attempt: new []{2, 3}.ToList(),
            for_: "expiration-date");
        prompt2
            .Say("Please enter your expiration date, two digits for the month and two digits for the year. For example, if your expiration date is March 2022, then please enter 0 3 2 2");
        pay.Append(prompt2);
        response.Append(pay);

        Console.WriteLine(response.ToString());
    }
}
