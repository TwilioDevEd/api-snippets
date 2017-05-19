using Twilio.TwiML;


public class Client-2.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      var dial = new Dial(callerId: "+1888XXXXXXX");
      dial.Number("858-987-6543");
      dial.Client("jenny");
      dial.Client("tommy");
      response.Dial(dial);

      System.Console.WriteLine(response.ToString());
   }
}