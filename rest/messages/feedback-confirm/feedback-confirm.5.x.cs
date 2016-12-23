// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System.Web.Mvc;
using Twilio.Rest.Api.V2010.Account.Message;
using Twilio;

public class ConfirmController : Controller
{
    // GET: Confirm
    public ActionResult Index()
    {
        // Lookup variable `id` in a database to find messageSid
        const string messageSid = "SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        TwilioClient.Init(accountSid, authToken);

        // Send Feedback to Twilio
        FeedbackResource.Create(messageSid,
                                outcome: FeedbackResource.OutcomeEnum.Confirmed);

        // Handle remaining request normally
        return View();
    }
}
