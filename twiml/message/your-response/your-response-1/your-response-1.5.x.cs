using Twilio.TwiML;
using Twilio.TwiML.Messaging;
using System;


class Example
{
    static void Main()
    {
        var response = new MessagingResponse();
        var message = new Message();
        message.Body("Hello World!");
        response.Append(message);
        response.Redirect(url: new Uri("https://demo.twilio.com/sms/welcome"));

        Console.WriteLine(response.ToString());;
    }
}
