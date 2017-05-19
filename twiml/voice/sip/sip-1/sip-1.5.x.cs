using Twilio.TwiML;


public class Sip-1.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      var dial = new Dial();
      dial.Sip("sip:jack@example.com");
      response.Dial(dial);

      System.Console.WriteLine(response.ToString());
   }
}