using Twilio.TwiML;


public class Redirect1
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Redirect("http://www.foo.com/nextInstructions");

        System.Console.WriteLine(response.ToString());
    }
}
