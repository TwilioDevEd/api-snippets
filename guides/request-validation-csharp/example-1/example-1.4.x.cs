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
        private readonly string _twilioAuthTokenKey;

        public ValidateTwilioRequestAttribute(string twilioAuthTokenKey)
        {
            _twilioAuthTokenKey = twilioAuthTokenKey;
        }

        public ValidateTwilioRequestAttribute()
        {
            _twilioAuthTokenKey = "TwilioAuthToken";
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var twilioAuthToken = ConfigurationManager.AppSettings[_twilioAuthTokenKey];
            var context = ((HttpApplication)filterContext.HttpContext.GetService(typeof(HttpApplication))).Context;
            var isValidRequest = _requestValidator.IsValidRequest(context, twilioAuthToken);

            if(!isValidRequest)
            {
                filterContext.Result = new System.Web.Mvc.HttpStatusCodeResult(HttpStatusCode.Forbidden);
            }

            base.OnActionExecuting(filterContext);
        }
    }
}
