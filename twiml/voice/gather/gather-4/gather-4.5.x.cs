using Twilio.TwiML;
using Twilio.TwiML.Voice;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var gather = new Gather(input: "speech", action: new Uri("/completed"));
        gather.Say("Welcome to Twilio, please tell us why you're calling");
        response.Append(gather);

        Console.WriteLine(response.ToString());;
    }
}
