// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System.Web.Mvc;
using RestSharp;
using Twilio;

public class ConfirmController : Controller
{
    // GET: Confirm
    public ActionResult Index(string id)
    {
        // Lookup variable `id` in a database to find messageSid
        var messageSid = "SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        // Find your Account Sid and Auth Token at twilio.com/console
        string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        string AuthToken = "your_auth_token";
        var twilio = new TwilioRestClient(AccountSid, AuthToken);

        // Send Feedback to Twilio
        var request = new RestRequest("Accounts/" + AccountSid + 
            "/Messages/" + messageSid + "/Feedback.json", Method.POST);
        request.AddParameter("Outcome", "confirmed");
        twilio.Execute(request);

        // Handle remaining request normally
        return View();
    }
}