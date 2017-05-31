using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var gather = new Gather(action: "/process_gather.php", method: "GET");
        gather.Say("Enter something, or not");
        response.Gather(gather);
        response.Redirect("/process_gather.php?Digits=TIMEOUT", method: "GET");

        System.Console.WriteLine(response.ToString());
    }
}
