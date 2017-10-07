using System;
using System.Configuration;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using Twilio.AspNet.Mvc;

namespace ValidateRequestExample.Filters
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class ValidateTwilioRequestAttribute : ActionFilterAttribute
    {
        private readonly RequestValidationHelper _requestValidator;
        private readonly string _authToken;
        private readonly bool _isTestEnvironment;

        public ValidateTwilioRequestAttribute()
        {
            _requestValidator = new RequestValidationHelper();
            _authToken = ConfigurationManager.AppSettings["TwilioAuthToken"];
            _isTestEnvironment = bool.Parse(ConfigurationManager.AppSettings["IsTestEnvironment"]);
        }

        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            var context = (HttpContextBase)actionContext.Request.Properties["MS_HttpContext"];

            if (!_isTestEnvironment && !_requestValidator.IsValidRequest(context, _authToken))
            {
                actionContext.Response = actionContext.Request.CreateErrorResponse(
                    HttpStatusCode.Forbidden,
                    "The Twilio request is invalid"
                );
            }

            base.OnActionExecuting(actionContext);
        }
    }
}
