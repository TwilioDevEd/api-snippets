using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Redirect(url: new Uri("../nextInstructions", UriKind
            .Relative));

        Console.WriteLine(response.ToString());
    }
}
