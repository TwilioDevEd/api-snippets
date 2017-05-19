using Twilio.TwiML;


public class Your-response-2.5.x
{
   public static void Main()
   {
      var response = new MessagingResponse();
      response.Message("This is message 1 of 2.");
      response.Message("This is message 2 of 2.");

      System.Console.WriteLine(response.ToString());
   }
}