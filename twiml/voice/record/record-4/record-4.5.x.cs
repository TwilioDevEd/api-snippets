using Twilio.TwiML;


public class Record-4.5.x
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Record(transcribe: "true", transcribeCallback: "/handle_transcribe.php");

        System.Console.WriteLine(response.ToString());
    }
}
