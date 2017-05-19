using Twilio.TwiML;


public class Gather-1.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      var gather = new Gather(timeout: 10, finishOnKey: "*");
      gather.Say("Please enter your pin number and then press star.");
      response.Gather(gather);

      System.Console.WriteLine(response.ToString());
   }
}