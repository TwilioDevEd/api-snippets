using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new MessagingResponse();
        response.Message("Store Location: 123 Easy St.");

        System.Console.WriteLine(response.ToString());
    }
}
