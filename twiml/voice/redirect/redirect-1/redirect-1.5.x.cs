using Twilio.TwiML;


public class Redirect1
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Redirect("http://pigeons.com/twiml.xml", method: "POST");

        System.Console.WriteLine(response.ToString());
    }
}
