using Twilio.TwiML;


public class Dial-4.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      var dial = new Dial(callerId: "+15551112222");
      dial.Number("+15558675309");
      response.Dial(dial);

      System.Console.WriteLine(response.ToString());
   }
}