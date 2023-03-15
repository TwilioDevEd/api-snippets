using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect();
        var virtualagent = new VirtualAgent(connectorName: "uniqueName");
        virtualagent.Config(name: "language", value: "en-us");
        virtualagent.Config(name: "voiceName", value: "en-US-Wavenet-C");
        connect.Append(virtualagent);
        response.Append(connect);

        Console.WriteLine(response.ToString());
    }
}
