using Twilio.TwiML;


public class Say-1.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      response.Say("Chapeau!", voice: "woman", language: "fr");
      
      System.Console.WriteLine(response.ToString());
   }
}