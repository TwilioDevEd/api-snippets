using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var hangup = new Hangup();
        hangup.Parameter(name: "hangup_reason", value: "no agents available");
        response.Append(hangup);

        Console.WriteLine(response.ToString());
    }
}
