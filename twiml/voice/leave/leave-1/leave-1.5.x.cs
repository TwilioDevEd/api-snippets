using Twilio.TwiML;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Enqueue("support", waitUrl: new Uri("wait.xml"));
        response
            .Say("Unfortunately, the support line has closed. Please call again tomorrow.");

        Console.WriteLine(response.ToString());;
    }
}
