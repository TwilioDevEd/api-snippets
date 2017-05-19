using Twilio.TwiML;


public class Redirect-1.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      response.Redirect("http://pigeons.com/twiml.xml", method: "POST");

      System.Console.WriteLine(response.ToString());
   }
}