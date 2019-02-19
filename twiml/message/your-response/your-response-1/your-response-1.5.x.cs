using System;
using Twilio.TwiML;
using Twilio.TwiML.Messaging;


class Example
{
    static void Main()
    {
        var response = new MessagingResponse();
        var message = new Message();
        message.Body("Hello World!");
        response.Append(message);
        response.Redirect(url: new Uri("https://demo.twilio.com/welcome/sms/"));

        Console.WriteLine(response.ToString());
    }
}
