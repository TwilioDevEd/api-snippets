using Twilio.TwiML;


public class Sip1
{
    public static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Sip("sip:kate@example.com?mycustomheader=foo&myotherheader=bar");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
