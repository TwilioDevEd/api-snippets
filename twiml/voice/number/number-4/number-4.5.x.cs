using Twilio.TwiML;


public class Number-4.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      var dial = new Dial();
      dial.Number("+14155555555", statusCallbackEvent: "initiated ringing answered completed", statusCallback: "https://myapp.com/calls/events", statusCallbackMethod: "POST");
      dial.Number("+14153333333", statusCallbackEvent: "initiated ringing answered completed", statusCallback: "https://example.com/events", statusCallbackMethod: "POST");
      response.Dial(dial);
      
      System.Console.WriteLine(response.ToString());
   }
}