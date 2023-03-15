using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;
using System.Linq;

class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var gather = new Gather(input: new []{Gather.InputEnum.Speech}.ToList(),
            action: new Uri("/completed"));
        gather.Say("Welcome to Twilio, please tell us why you're calling");
        response.Append(gather);

        Console.WriteLine(response.ToString());
    }
}
