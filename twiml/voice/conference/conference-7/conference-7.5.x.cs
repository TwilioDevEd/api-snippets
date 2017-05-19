using Twilio.TwiML;


public class Conference-7.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      var dial = new Dial();
      dial.Conference("Customer Waiting Room", beep: "false");
      response.Dial(dial);

      System.Console.WriteLine(response.ToString());
   }
}