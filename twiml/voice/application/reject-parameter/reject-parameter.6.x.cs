using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var reject = new Reject();
        reject.Parameter(name: "reject_reason", value: "no agents available");
        response.Append(reject);

        Console.WriteLine(response.ToString());
    }
}
