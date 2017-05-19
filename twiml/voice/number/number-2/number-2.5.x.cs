using Twilio.TwiML;


public class Number2
{
    public static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Number("858-987-6543");
        dial.Number("415-123-4567");
        dial.Number("619-765-4321");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
