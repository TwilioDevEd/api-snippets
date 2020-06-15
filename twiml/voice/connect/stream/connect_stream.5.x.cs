using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect();
        connect.Stream(url: "wss://mystream.ngrok.io/audiostream");
        response.Append(connect);

        Console.WriteLine(response.ToString());
    }
}
