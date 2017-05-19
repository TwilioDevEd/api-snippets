using Twilio.TwiML;


public class Record2
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Record();

        System.Console.WriteLine(response.ToString());
    }
}
