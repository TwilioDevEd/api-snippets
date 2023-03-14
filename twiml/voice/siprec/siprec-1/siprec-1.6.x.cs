using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var start = new Start();
        start.Siprec(name: "My SIPREC Stream", connectorName: "Gridspace_1");
        response.Append(start);

        Console.WriteLine(response.ToString());
    }
}
