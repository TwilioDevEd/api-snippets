using Twilio.TwiML;


public class Message-3.5.x
{
    public static void Main()
    {
        var response = new MessagingResponse();
        response.Message("Store Location: 123 Easy St.", action: "/SmsHandler.php", method: "POST");

        System.Console.WriteLine(response.ToString());
    }
}
