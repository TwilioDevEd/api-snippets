using Twilio.TwiML;


public class Leave-3.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      response.Leave();

      System.Console.WriteLine(response.ToString());
   }
}