using Twilio.TwiML;


public class Your-response-2.5.x
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Hello");

        System.Console.WriteLine(response.ToString());
    }
}
