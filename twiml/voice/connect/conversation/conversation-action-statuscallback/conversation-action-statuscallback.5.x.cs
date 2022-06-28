using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect(action: new Uri("https://your-action-url.com/"));
        connect.Conversation(serviceInstanceSid: "ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", statusCallback: "https://your-status-callback-url.com/statusCallback");
        response.Append(connect);

        Console.WriteLine(response.ToString());
    }
}
