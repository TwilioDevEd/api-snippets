using System.Web.Mvc;
using Twilio.TwiML;

public class HelloWorldController : Controller
{
  [HttpPost]
  public ActionResult Index()
  {
      const string requestBody = Request.Form["Body"];
      var response = new MessagingResponse();
      if(requestBody == "hello")
      {
        response.Message("Hi!");
      }
      else if(requestBody == "bye")
      {
        response.Message("Goodbye");
      }
      return Content(response.ToString(), "text/xml");
  }
}
