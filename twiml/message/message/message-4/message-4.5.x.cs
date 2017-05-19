using Twilio.TwiML;


public class Message-4.5.x
{
   public static void Main()
   {
      var response = new MessagingResponse();
      var message = new Message("Hello Jenny");
      message.Media("https://demo.twilio.com/owl.png");
      response.Message(message);

      System.Console.WriteLine(response.ToString());
   }
}