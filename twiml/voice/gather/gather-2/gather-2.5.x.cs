using Twilio.TwiML;


public class Gather-2.5.x
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Gather();

        System.Console.WriteLine(response.ToString());
    }
}
