using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var refer = new Refer();
        refer.Sip(new Uri("sip:alice@example.com?User-to-User=123456789%3Bencoding%3Dhex"));
        response.Append(refer);

        Console.WriteLine(response.ToString());
    }
}
