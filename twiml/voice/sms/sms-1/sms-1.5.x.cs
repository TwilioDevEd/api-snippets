using Twilio.TwiML;


public class Sms1
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Sms("The king stay the king.", from: "+14105551234",
             to: "+14105556789");

        System.Console.WriteLine(response.ToString());
    }
}
