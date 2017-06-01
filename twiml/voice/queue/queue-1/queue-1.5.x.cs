using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Queue("support", url: "about_to_connect.xml");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
