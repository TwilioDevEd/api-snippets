using Twilio.TwiML;


public class Conference-5.5.x
{
    public static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Conference("SimpleRoom", muted: "true");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
