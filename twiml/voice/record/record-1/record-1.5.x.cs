using Twilio.TwiML;


public class Record1
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Record(timeout: 10, transcribe: "true");

        System.Console.WriteLine(response.ToString());
    }
}
