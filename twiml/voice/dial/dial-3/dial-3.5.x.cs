using Twilio.TwiML;


public class Dial3
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Dial("415-123-4567", action: "/handleDialCallStatus.php", method: "GET");
        response.Say("I am unreachable");

        System.Console.WriteLine(response.ToString());
    }
}
