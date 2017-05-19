using Twilio.TwiML;


public class Number-1.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      var dial = new Dial();
      dial.Number("415-123-4567", sendDigits: "wwww1928");
      response.Dial(dial);

      System.Console.WriteLine(response.ToString());
   }
}