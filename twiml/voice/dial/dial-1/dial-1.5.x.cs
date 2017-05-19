using Twilio.TwiML;


public class Dial1
{
    public static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Number("415-123-4567");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}