using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var connect = new Connect();
        connect.Conversation(serviceInstanceSid: "ISxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", record: "record-from-answer", trim: Conversation.TrimEnum.TrimSilence);
        response.Append(connect);

        Console.WriteLine(response.ToString());
    }
}
