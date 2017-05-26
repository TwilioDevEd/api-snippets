using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial();
        dial.Number("415-123-4567", sendDigits: "wwww1928");
        response.Dial(dial);

        System.Console.WriteLine(response.ToString());
    }
}
