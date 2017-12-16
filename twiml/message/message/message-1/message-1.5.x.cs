using Twilio.TwiML;
using System;


class Example
{
    static void Main()
    {
        var response = new MessagingResponse();
        response.Message("Store Location: 123 Easy St.");

        Console.WriteLine(response.ToString());;
    }
}
