using Twilio.TwiML;


public class Conference-10.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      var dial = new Dial();
      dial.Conference("LoveTwilio", record: "record-from-start", recordingStatusCallback: "www.myexample.com");
      response.Dial(dial);

      System.Console.WriteLine(response.ToString());
   }
}