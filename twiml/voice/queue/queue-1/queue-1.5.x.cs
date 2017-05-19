using Twilio.TwiML;


public class Queue1
{
    public static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Queue("support", url: "about_to_connect.xml");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}