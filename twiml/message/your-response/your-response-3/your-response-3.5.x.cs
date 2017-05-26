using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new MessagingResponse();
        response.Message("I'm hungry!");

        System.Console.WriteLine(response.ToString());
    }
}
