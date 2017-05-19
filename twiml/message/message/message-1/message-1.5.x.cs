using Twilio.TwiML;


public class Message1
{
    public static void Main()
    {
        var response = new MessagingResponse();
        response.Message("Store Location: 123 Easy St.");

        System.Console.WriteLine(response.ToString());
    }
}
