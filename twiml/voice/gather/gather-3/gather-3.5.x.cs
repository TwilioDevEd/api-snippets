using Twilio.TwiML;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var gather = new Gather(action: "/process_gather.php", method: "GET");
        gather
            .Say("Please enter your account number,\nfollowed by the pound sign");
        response.Gather(gather);
        response.Say("We didn't receive any input. Goodbye!");

        System.Console.WriteLine(response.ToString());
    }
}
