using Twilio.TwiML;


public class Message-1.5.x
{
   public static void Main()
   {
      var response = new MessagingResponse();
      response.Message("Store Location: 123 Easy St.");

      System.Console.WriteLine(response.ToString());
   }
}