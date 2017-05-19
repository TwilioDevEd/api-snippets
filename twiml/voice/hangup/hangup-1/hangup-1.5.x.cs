using Twilio.TwiML;


public class Hangup-1.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      response.Hangup();

      System.Console.WriteLine(response.ToString());
   }
}