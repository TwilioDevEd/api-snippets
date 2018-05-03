using Twilio.TwiML;
using System;

class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Dial("415-123-4567");
        response.Redirect(new Uri("http://www.foo.com/nextInstructions"));

        Console.WriteLine(response.ToString());;
    }
}
