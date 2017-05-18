using Twilio.TwiML;


public class Record-1.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      response.Record(timeout: 10, transcribe: "true");
      
      System.Console.WriteLine(response.ToString());
   }
}