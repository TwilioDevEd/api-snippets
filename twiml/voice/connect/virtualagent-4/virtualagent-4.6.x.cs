using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect();
        connect.VirtualAgent(connectorName: "project", sentimentAnalysis: true);
        response.Append(connect);

        Console.WriteLine(response.ToString());
    }
}
