using Twilio.TwiML;


public class Reject-2.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      response.Reject(reason: "busy");
      
      System.Console.WriteLine(response.ToString());
   }
}