using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Redirect("http://pigeons.com/twiml.xml", method: "POST");

        System.Console.WriteLine(response.ToString());
    }
}
