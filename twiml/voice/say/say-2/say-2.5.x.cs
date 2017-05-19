using Twilio.TwiML;


public class Say-2.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      response.Say("Chapeau!", voice: "alice", language: "fr-FR");

      System.Console.WriteLine(response.ToString());
   }
}