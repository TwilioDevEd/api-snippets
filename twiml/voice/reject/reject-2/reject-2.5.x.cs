using Twilio.TwiML;


public class Reject2
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Reject(reason: "busy");

        System.Console.WriteLine(response.ToString());
    }
}
