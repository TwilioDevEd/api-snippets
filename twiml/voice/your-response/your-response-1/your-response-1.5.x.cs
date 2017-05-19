using Twilio.TwiML;


public class Your-response-1.5.x
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Hello World");
        response.Play("https://api.twilio.com/Cowbell.mp3");

        System.Console.WriteLine(response.ToString());
    }
}
