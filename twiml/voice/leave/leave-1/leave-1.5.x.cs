using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Enqueue("support", waitUrl: "wait.xml");
        response
            .Say("Unfortunately, the support line has closed. Please call again tomorrow.");

        System.Console.WriteLine(response.ToString());
    }
}
