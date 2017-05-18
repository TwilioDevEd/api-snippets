using Twilio.TwiML;


public class Conference-9.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      var dial = new Dial(action: "handleLeaveConference.php", method: "POST", hangupOnStar: "true", timeLimit: 30);
      dial.Conference("LoveTwilio");
      response.Dial(dial);
      
      System.Console.WriteLine(response.ToString());
   }
}