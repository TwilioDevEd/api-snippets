using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Sim("DE8caa2afb9d5279926619c458dc7098a8");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
