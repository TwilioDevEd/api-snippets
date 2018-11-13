using System;
using Twilio.TwiML;
using Twilio.TwiML.Messaging;


class Example
{
    static void Main()
    {
        var response = new MessagingResponse();
        response.Message("This is message 1 of 2.");
        response.Message("This is message 2 of 2.");

        Console.WriteLine(response.ToString());
    }
}
