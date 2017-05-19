using Twilio.TwiML;


public class Play3
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Play(digits: "wwww3");

        System.Console.WriteLine(response.ToString());
    }
}
