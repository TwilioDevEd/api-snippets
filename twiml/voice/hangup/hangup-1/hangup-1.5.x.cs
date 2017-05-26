using Twilio.TwiML;


public class Hangup1
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Hangup();

        System.Console.WriteLine(response.ToString());
    }
}
