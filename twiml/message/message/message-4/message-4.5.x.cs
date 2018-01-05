using Twilio.TwiML;
using Twilio.TwiML.Messaging;
using System;


class Example
{
    static void Main()
    {
        var response = new MessagingResponse();
        var message = new Message();
        message.Body("Hello friend");
        message.Media(new Uri("https://demo.twilio.com/owl.png"));
        response.Append(message);

        Console.WriteLine(response.ToString());;
    }
}
