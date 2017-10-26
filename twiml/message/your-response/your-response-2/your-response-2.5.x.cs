using Twilio.TwiML;
using System;


class Example
{
    static void Main()
    {
        var response = new MessagingResponse();
        response.Message("This is message 1 of 2.");
        response.Message("This is message 2 of 2.");

        Console.WriteLine(response.ToString());;
    }
}
