using Twilio.TwiML;


public class Sip-2.5.x
{
    public static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Sip("sip:kate@example.com", username: "admin", password: "1234");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
