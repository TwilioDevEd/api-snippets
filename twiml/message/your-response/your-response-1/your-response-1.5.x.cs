using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new MessagingResponse();
        var message = new Message();
        message.Body("Hello World!");
        response.Message(message);
        response.Redirect("https://demo.twilio.com/sms/welcome");

        System.Console.WriteLine(response.ToString());
    }
}
