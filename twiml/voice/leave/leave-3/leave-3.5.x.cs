using Twilio.TwiML;


public class Leave3
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Leave();

        System.Console.WriteLine(response.ToString());
    }
}
