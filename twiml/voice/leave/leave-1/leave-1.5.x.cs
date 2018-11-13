using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Enqueue("support", waitUrl: new Uri("wait.xml", UriKind
            .Relative));
        response
            .Say("Unfortunately, the support line has closed. Please call again tomorrow.");

        Console.WriteLine(response.ToString());
    }
}
