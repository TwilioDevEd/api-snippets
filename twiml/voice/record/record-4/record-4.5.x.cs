using Twilio.TwiML;


public class Record4
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Record(transcribe: "true", transcribeCallback: "/handle_transcribe.php");

        System.Console.WriteLine(response.ToString());
    }
}
