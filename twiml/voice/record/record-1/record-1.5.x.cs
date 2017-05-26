using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Record(timeout: 10, transcribe: "true");

        System.Console.WriteLine(response.ToString());
    }
}
