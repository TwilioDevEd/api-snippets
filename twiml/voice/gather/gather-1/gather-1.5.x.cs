using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;
using System.Linq;

class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var gather = new Gather(input: new []{Gather.InputEnum.Speech, Gather
            .InputEnum.Dtmf}.ToList(), timeout: 3, numDigits: 1);
        gather.Say("Please press 1 or say sales for sales.");
        response.Append(gather);

        Console.WriteLine(response.ToString());
    }
}
