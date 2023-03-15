using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect(action: new Uri("https://example.com/yourActionUrl"));
        connect.Conversation(serviceInstanceSid: "ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", statusCallback: "https://example.com/yourStatusCallback");
        response.Append(connect);

        Console.WriteLine(response.ToString());
    }
}
