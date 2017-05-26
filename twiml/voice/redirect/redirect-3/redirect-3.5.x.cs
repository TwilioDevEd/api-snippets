using Twilio.TwiML;


public class Redirect3
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Redirect("../nextInstructions");

        System.Console.WriteLine(response.ToString());
    }
}
