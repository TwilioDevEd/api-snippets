using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Reject();

        System.Console.WriteLine(response.ToString());
    }
}
