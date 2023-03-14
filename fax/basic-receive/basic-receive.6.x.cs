using System.Web.Mvc;

namespace TwilioFax.Web.Controllers
{
    public class FaxController : Controller
    {
        // Define a handler for when the fax is initially sent
        [HttpPost]
        public ActionResult Sent()
        {
            // Let's manually build some TwiML. We can choose to receive the
            // fax with <Receive>, or reject with <Reject>.
            const string xmlString = "<Response>" +
                                        "<Receive action =\"/fax/received\"/>" +
                                      "</Response>";

            return this.Content(xmlString, "text/xml");
        }

        // Define a handler for when the fax is finished sending to us - if successful,
        // We will have a URL to the contents of the fax at this point
        [HttpPost]
        public ActionResult Received()
        {
            // log the URL of the PDF received in the fax
            System.Diagnostics.Debug.WriteLine(Request["MediaUrl"]);

            // Respond with empty 200/OK to Twilio
            return new EmptyResult();
        }
    }
}
