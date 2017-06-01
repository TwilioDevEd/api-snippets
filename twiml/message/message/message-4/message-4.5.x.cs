using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new MessagingResponse();
        var message = new Message();
        message.Body("Hello Jenny");
        message.Media("https://demo.twilio.com/owl.png");
        response.Message(message);

        System.Console.WriteLine(response.ToString());
    }
}
