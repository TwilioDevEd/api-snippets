// In Package Manager, run:
// Install-Package Twilio.AspNet.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.AspNet.Mvc;
using Twilio.TwiML;

public class HelloWorldController : TwilioController
{
  [HttpPost]
  public ActionResult Index()
  {
      var requestBody = Request.Form["Body"];
      var response = new MessagingResponse();
      if(requestBody == "hello")
      {
        response.Message("Hi!");
      }
      else if(requestBody == "bye")
      {
        response.Message("Goodbye");
      }

      return TwiML(response);
  }
}
