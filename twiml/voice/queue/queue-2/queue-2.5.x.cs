using Twilio.TwiML;


public class Queue-2.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      response.Say("You will now be connected to an agent.");
      
      System.Console.WriteLine(response.ToString());
   }
}