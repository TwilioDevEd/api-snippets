using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Play("", digits: "wwww3");

        Console.WriteLine(response.ToString());;
    }
}
