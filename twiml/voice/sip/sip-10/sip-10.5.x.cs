using Twilio.TwiML;


public class Sip-10.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      var dial = new Dial();
      dial.Sip("sip:kate@example.com", statusCallbackEvent: "initiated ringing answered completed", statusCallback: "https://myapp.com/calls/events", statusCallbackMethod: "POST");
      response.Dial(dial);
      
      System.Console.WriteLine(response.ToString());
   }
}