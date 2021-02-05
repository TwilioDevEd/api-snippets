using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var refer = new Refer(action: new Uri("/handleRefer"), method: Twilio.Http.HttpMethod.Post);
        refer.Sip(new Uri("sip:alice@example.com"));
        response.Append(refer);

        Console.WriteLine(response.ToString());
    }
}
