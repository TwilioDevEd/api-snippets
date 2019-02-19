using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Dial("415-123-4567");
        response.Redirect(url: new Uri("http://www.foo.com/nextInstructions"));

        Console.WriteLine(response.ToString());
    }
}
