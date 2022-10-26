using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;
using System.Collections.Generic;

class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect();
        connect.Conversation(serviceInstanceSid: "ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", statusCallback: new Uri("https://example.com/yourStatusCallback"), statusCallbackEvent: new List<Conversation.EventEnum>{Conversation.EventEnum.CallInitiated, Conversation.EventEnum.CallAnswered, Conversation.EventEnum.CallRinging, Conversation.EventEnum.CallCompleted});
        response.Append(connect);

        Console.WriteLine(response.ToString());
    }
}
