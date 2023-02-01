using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("We're sorry. All of our agents are busy right now.");
        response.Say("We will call you back as soon as possible.");
        response.Say("Please stay on the line to be redirected to the main menu.");
        var hangup = new Hangup();
        hangup.Parameter(name: "payment_collected", value: "false");
        response.Append(hangup);

        Console.WriteLine(response.ToString());
    }
}
