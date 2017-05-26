using Twilio.TwiML;


public class Sip6
{
    public static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Sip("kate@example.com");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
