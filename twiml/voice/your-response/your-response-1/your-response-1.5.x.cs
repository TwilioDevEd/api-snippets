using Twilio.TwiML;


public class YourResponse1
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Hello World");
        response.Play("https://api.twilio.com/Cowbell.mp3");

        System.Console.WriteLine(response.ToString());
    }
}
