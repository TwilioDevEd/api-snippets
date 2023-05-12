using System;
using Twilio.TwiML;
using Twilio.TwiML.Messaging;


class Example
{
    static void Main()
    {
        var response = new MessagingResponse();
        response.Redirect(url: new Uri("../nextInstructions", UriKind.Relative));

        Console.WriteLine(response.ToString());
    }
}
