// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
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
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        TwilioClient.Init(accountSid, authToken);

        // Send Feedback to Twilio
        FeedbackResource.Create(messageSid,
                                outcome: FeedbackResource.OutcomeEnum.Confirmed);

        // Handle remaining request normally
        return View();
    }
}
