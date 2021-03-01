using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial(answerOnBridge: true, referUrl: new Uri("https://example.com/handler"));
        dial.Sip(new Uri("sip:AgentA@xyz.sip.us1.twilio.com?User-to-User=123456789%3Bencoding%3Dhex&X-Name=Agent%2C+A"));
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
