using Twilio.TwiML;


public class Sms3
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Our store is located at 123 Easy St.");
        response.Sms("Store Location: 123 Easy St.", action: "/smsHandler.php", method: "POST");

        System.Console.WriteLine(response.ToString());
    }
}
