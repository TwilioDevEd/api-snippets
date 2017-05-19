using Twilio.TwiML;


public class Reject-1.5.x
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Reject();

        System.Console.WriteLine(response.ToString());
    }
}
