using Twilio.TwiML;


public class Your-response-1.5.x
{
   public static void Main()
   {
      var response = new MessagingResponse();
      response.Message("Hello World!");
      response.Redirect("https://demo.twilio.com/sms/welcome");
      
      System.Console.WriteLine(response.ToString());
   }
}