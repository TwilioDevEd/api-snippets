using Twilio.TwiML;


public class Redirect-3.5.x
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Redirect("../nextInstructions");

        System.Console.WriteLine(response.ToString());
    }
}
