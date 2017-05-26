using Twilio.TwiML;


public class Play2
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Play("https://api.twilio.com/cowbell.mp3");

        System.Console.WriteLine(response.ToString());
    }
}
