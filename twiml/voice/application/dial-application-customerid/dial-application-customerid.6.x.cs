using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        var application = new Application(customerId: "CustomerFriendlyName");
        application.ApplicationSid("AP1234567890abcdef1234567890abcd");
        dial.Append(application);
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
