using System;
using System.Configuration;
using System.Web;
using System.Net;
using System.Web.Mvc;
using Twilio.Security;

namespace ValidateRequestExample.Filters
{
    [AttributeUsage(AttributeTargets.Method)]
    public class ValidateTwilioRequestAttribute : ActionFilterAttribute
    {
        private readonly RequestValidator _requestValidator;
        private static bool IsTestEnvironment =>
            bool.Parse(ConfigurationManager.AppSettings["IsTestEnvironment"]);

        public ValidateTwilioRequestAttribute()
        {
            var authToken = ConfigurationManager.AppSettings["TwilioAuthToken"];
            _requestValidator = new RequestValidator(authToken);
        }

        public override void OnActionExecuting(ActionExecutingContext actionContext)
        {
            var context = actionContext.HttpContext;
            if (!IsTestEnvironment && !IsValidRequest(context.Request))
            {
                actionContext.Result = new HttpStatusCodeResult(HttpStatusCode.Forbidden);
            }

            base.OnActionExecuting(actionContext);
        }

        private bool IsValidRequest(HttpRequestBase request) {
            var signature = request.Headers["X-Twilio-Signature"];
            var requestUrl = request.RawUrl;
            return _requestValidator.Validate(requestUrl, request.Form, signature);
        }
    }
}
