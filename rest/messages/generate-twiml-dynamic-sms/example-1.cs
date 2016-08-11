// In Package Manager, run:
// Install-Package Twilio.Mvc -DependencyVersion HighestMinor

using Twilio.Mvc;
using Twilio.TwiML;
using Twilio.TwiML.Mvc;

public class HelloWorldController : TwilioController
{
  [HttpPost]
  public ActionResult Index(SmsRequest request)
  {
      var response = new TwilioResponse();
      if(request.body == "hello")
      {
        response.Message("Hi!");
      }
      else if(request.body == "bye")
      {
        response.Message("Goodbye");
      }
      return TwiML(response);
  }
}