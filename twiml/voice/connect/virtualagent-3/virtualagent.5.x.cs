using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect(action: new Uri("https://myactionurl.com/twiml"));
        connect.VirtualAgent(connectorName: "project", statusCallback: "https://mycallbackurl.com");
        response.Append(connect);

        Console.WriteLine(response.ToString());
    }
}
