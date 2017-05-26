using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new MessagingResponse();
        var message = new Message();
        message.Body("Store Location: 123 Easy St.");
        response.Message(message);

        System.Console.WriteLine(response.ToString());
    }
}
