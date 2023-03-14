using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect();
        connect.Stream(url: "wss://example.com/audiostream");
        response.Append(connect);
        response.Say("This TwiML instruction is unreachable unless the Stream is ended by your WebSocket server.");

        Console.WriteLine(response.ToString());
    }
}
