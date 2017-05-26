using Twilio.TwiML;


public class Play1
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Play("https://api.twilio.com/cowbell.mp3", loop: 10);

        System.Console.WriteLine(response.ToString());
    }
}
