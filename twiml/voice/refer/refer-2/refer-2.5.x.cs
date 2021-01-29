using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var refer = new Refer();
        refer.Sip(new Uri("sip:alice@example.com?X-AcctNumber=123456&X-ReasonForCalling=billing-question"));
        response.Append(refer);

        Console.WriteLine(response.ToString());
    }
}
