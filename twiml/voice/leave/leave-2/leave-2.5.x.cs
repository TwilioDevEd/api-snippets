using Twilio.TwiML;


public class Leave-2.5.x
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Play("http://com.twilio.sounds.music.s3.amazonaws.com/MARKOVICHAMP-Borghestral.mp3");

        System.Console.WriteLine(response.ToString());
    }
}
