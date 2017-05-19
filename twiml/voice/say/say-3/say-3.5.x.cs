using Twilio.TwiML;


public class Say-3.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      response.Say("Hej!", language: "sv-SE");

      System.Console.WriteLine(response.ToString());
   }
}