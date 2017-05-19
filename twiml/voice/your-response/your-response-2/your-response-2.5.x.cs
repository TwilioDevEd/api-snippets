using Twilio.TwiML;


public class YourResponse2
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Hello");

        System.Console.WriteLine(response.ToString());
    }
}
