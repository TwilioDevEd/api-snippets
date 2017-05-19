using Twilio.TwiML;


public class Redirect-2.5.x
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Dial("415-123-4567");
        response.Redirect("http://www.foo.com/nextInstructions");

        System.Console.WriteLine(response.ToString());
    }
}
