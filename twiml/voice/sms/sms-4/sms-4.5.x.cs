using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Our store is located at 123 Easy St.");
        response.Sms("Store Location: 123 Easy St.",
            statusCallback: "/smsHandler.php");

        System.Console.WriteLine(response.ToString());
    }
}
