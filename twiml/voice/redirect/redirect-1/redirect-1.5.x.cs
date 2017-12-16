using Twilio.TwiML;
using Twilio.Http;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Redirect(new Uri("http://pigeons.com/twiml.xml"), method: HttpMethod.Post);

        Console.WriteLine(response.ToString());;
    }
}
