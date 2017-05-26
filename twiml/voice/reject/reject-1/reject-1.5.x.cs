using Twilio.TwiML;


public class Reject1
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Reject();

        System.Console.WriteLine(response.ToString());
    }
}
