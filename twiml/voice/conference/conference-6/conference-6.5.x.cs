using Twilio.TwiML;


public class Conference-6.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      var dial = new Dial();
      dial.Conference("NoMusicNoBeepRoom", beep: "false", waitUrl: "", startConferenceOnEnter: "true", endConferenceOnExit: "true");
      response.Dial(dial);
      
      System.Console.WriteLine(response.ToString());
   }
}