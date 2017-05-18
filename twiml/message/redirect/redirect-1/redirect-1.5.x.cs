using Twilio.TwiML;


public class Redirect-1.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      response.Redirect("http://www.foo.com/nextInstructions");
      
      System.Console.WriteLine(response.ToString());
   }
}