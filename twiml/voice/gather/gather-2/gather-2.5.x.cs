using Twilio.TwiML;


public class Gather2
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Gather();

        System.Console.WriteLine(response.ToString());
    }
}
