using Twilio.TwiML;


public class Conference1
{
    public static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Conference("Room 1234");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
