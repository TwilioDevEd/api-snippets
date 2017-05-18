using Twilio.TwiML;


public class Play-2.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      response.Play("https://api.twilio.com/cowbell.mp3");
      
      System.Console.WriteLine(response.ToString());
   }
}