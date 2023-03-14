using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var start = new Start();
        var stream = new Stream(url: "wss://mystream.ngrok.io/example");
        stream.Parameter(name: "FirstName", value: "Jane");
        stream.Parameter(name: "LastName", value: "Doe");
        start.Append(stream);
        response.Append(start);

        Console.WriteLine(response.ToString());
    }
}
