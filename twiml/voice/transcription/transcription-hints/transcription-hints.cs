using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var start = new Start();
        start.Transcription(statusCallbackUrl: "https://example.com/your-callback-url", hints: "Alice Johnson, Bob Martin, ACME Corp, XYZ Enterprises, product demo, sales inquiry, customer feedback");
        response.Append(start);

        Console.WriteLine(response.ToString());
    }
}
