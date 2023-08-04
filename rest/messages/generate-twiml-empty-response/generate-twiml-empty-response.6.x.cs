// In Package Manager, run:
// Install-Package Twilio.AspNet.Mvc -DependencyVersion HighestMinor

using System.Web.Mvc;
using Twilio.AspNet.Mvc;
using Twilio.TwiML;

namespace YourNewWebProject.Controllers
{
    public class SmsController : TwilioController
    {
        [HttpPost]
        public TwiMLResult Index()
        {
            var messagingResponse = new MessagingResponse();

            return TwiML(messagingResponse);
        }
    }
}
