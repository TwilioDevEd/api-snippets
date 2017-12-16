using System;
using System.Configuration;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using Twilio.Security;

namespace ValidateRequestExample.Filters
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class ValidateTwilioRequestAttribute : ActionFilterAttribute
    {
        private readonly RequestValidator _requestValidator;

        public ValidateTwilioRequestAttribute()
        {
            var authToken = ConfigurationManager.AppSettings["TwilioAuthToken"];
            _requestValidator = new RequestValidator(authToken);
        }

        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            var context = (HttpContextBase)actionContext.Request.Properties["MS_HttpContext"];
            if (!IsValidRequest(context.Request))
            {
                actionContext.Response = actionContext.Request.CreateErrorResponse(
                    HttpStatusCode.Forbidden,
                    "The Twilio request is invalid"
                );
            }

            base.OnActionExecuting(actionContext);
        }

        private bool IsValidRequest(HttpRequestBase request)
        {
            var signature = request.Headers["X-Twilio-Signature"];
            var requestUrl = request.RawUrl;
            return _requestValidator.Validate(requestUrl, request.Form, signature);
        }
    }
}
