using System;
using Twilio.TwiML;
using Twilio.TwiML.Messaging;


class Example
{
    static void Main()
    {
        var response = new MessagingResponse();
        var message = new Message();
        message.Body("Store Location: 123 Easy St.");
        message.Media(new Uri("https://demo.twilio.com/owl.png"));
        response.Append(message);

        Console.WriteLine(response.ToString());
    }
}
