using Twilio.TwiML;


public class Client1
{
    public static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Client("jenny");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
