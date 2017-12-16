using Twilio.TwiML;
using System;


class Example
{
    static void Main()
    {
        var response = new MessagingResponse();
        response.Message("I'm hungry!");

        Console.WriteLine(response.ToString());;
    }
}
