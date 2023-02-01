using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        var application = new Application();
        application.ApplicationSid("AP1234567890abcdef1234567890abcd");
        application.Parameter(name: "AccountNumber", value: "12345");
        application.Parameter(name: "TicketNumber", value: "9876");
        dial.Append(application);
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
