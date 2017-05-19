using Twilio.TwiML;


public class Record-2.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      response.Record();

      System.Console.WriteLine(response.ToString());
   }
}