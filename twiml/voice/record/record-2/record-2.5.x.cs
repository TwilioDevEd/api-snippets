using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Record();

        System.Console.WriteLine(response.ToString());
    }
}
