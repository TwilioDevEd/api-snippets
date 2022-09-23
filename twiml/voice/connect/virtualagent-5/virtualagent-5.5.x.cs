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
        virtualagent.Parameter(name: "customer_name", value: "Burton Guster");
        connect.Append(virtualagent);
        response.Append(connect);

        Console.WriteLine(response.ToString());
    }
}
