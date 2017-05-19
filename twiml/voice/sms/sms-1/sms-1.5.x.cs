using Twilio.TwiML;


public class Sms-1.5.x
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Sms("The king stay the king.", from: "+14105551234", to: "+14105556789");

        System.Console.WriteLine(response.ToString());
    }
}
