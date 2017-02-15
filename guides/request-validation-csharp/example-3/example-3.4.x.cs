using System;
using System.Configuration;
using System.Web;
using System.Net;
using System.Web.Mvc;
using Twilio.TwiML;

namespace ValidateRequestExample.Filters
{
    [AttributeUsage(AttributeTargets.Method)]
    public class ValidateTwilioRequestAttribute : ActionFilterAttribute
    {
        private readonly RequestValidator _requestValidator = new RequestValidator();
        private readonly bool _isTestEnvironment;
        private readonly string _twilioAuthTokenKey;

        public ValidateTwilioRequestAttribute(string twilioAuthTokenKey, string isTestEnvironmentKey)
        {
            _twilioAuthTokenKey = twilioAuthTokenKey;
            _isTestEnvironment = bool.Parse(ConfigurationManager.AppSettings[isTestEnvironmentKey]);
        }

        public ValidateTwilioRequestAttribute()
        {
            _twilioAuthTokenKey = "TwilioAuthToken";
            _isTestEnvironment = bool.Parse(ConfigurationManager.AppSettings["IsTestEnvironment"]);
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var twilioAuthToken = ConfigurationManager.AppSettings[_twilioAuthTokenKey];
            var context = ((HttpApplication)filterContext.HttpContext.GetService(typeof(HttpApplication))).Context;
            var isValidRequest = _requestValidator.IsValidRequest(context, twilioAuthToken);

            if(!isValidRequest && !_isTestEnvironment)
            {
                filterContext.Result = new HttpStatusCodeResult(HttpStatusCode.Forbidden);
            }

            base.OnActionExecuting(filterContext);
        }
    }
}
