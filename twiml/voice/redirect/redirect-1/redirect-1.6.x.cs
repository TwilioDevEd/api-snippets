using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Redirect(method: Twilio.Http.HttpMethod.Post,
            url: new Uri("http://pigeons.com/twiml.xml"));

        Console.WriteLine(response.ToString());
    }
}
