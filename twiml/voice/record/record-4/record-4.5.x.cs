using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Record(transcribe: true,
            transcribeCallback: "/handle_transcribe.php");

        System.Console.WriteLine(response.ToString());
    }
}
