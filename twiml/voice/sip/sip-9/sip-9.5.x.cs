using Twilio.TwiML;


public class Sip-9.5.x
{
   public static void Main()
   {
      var response = new VoiceResponse();
      var dial = new Dial(record: "true", timeout: 10, hangupOnStar: "true", callerId: "bob", method: "POST", action: "/handle_post_dial");
      dial.Sip("sip:kate@example.com?customheader=foo", method: "POST", url: "/handle_screening_on_answer");
      response.Dial(dial);

      System.Console.WriteLine(response.ToString());
   }
}