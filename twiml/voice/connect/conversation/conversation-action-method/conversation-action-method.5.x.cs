using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect(action: new Uri("https://example.com/yourActionUrl"), method: Twilio.Http.HttpMethod.Get);
        connect.Conversation(serviceInstanceSid: "ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
        response.Append(connect);

        Console.WriteLine(response.ToString());
    }
}
