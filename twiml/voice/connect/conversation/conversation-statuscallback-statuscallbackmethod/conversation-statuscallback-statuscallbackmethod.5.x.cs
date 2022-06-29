using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect();
        connect.Conversation(serviceInstanceSid: "ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", statusCallback: new Uri("https://your-status-callback-url.com/statusCallback"), statusCallbackMethod: Twilio.Http.HttpMethod.Get);
        response.Append(connect);

        Console.WriteLine(response.ToString());
    }
}
