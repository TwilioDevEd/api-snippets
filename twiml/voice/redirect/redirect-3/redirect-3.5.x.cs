using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Redirect("../nextInstructions");

        System.Console.WriteLine(response.ToString());
    }
}
