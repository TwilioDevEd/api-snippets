using System;
using System.Configuration;
using System.Web;
using System.Net;
using System.Web.Mvc;
using Twilio;
using Twilio.TwiML;

namespace helloworldcsharp
{
	public class RequestValidatorFilterAttribute : ActionFilterAttribute
	{

		private static readonly Lazy<RequestValidator> TwilioRequestValidator
			= new Lazy<RequestValidator>(() => new RequestValidator());

		public override void OnActionExecuting(ActionExecutingContext filterContext)
		{
			var twilioAuthToken = ConfigurationManager.AppSettings["TwilioAuthToken"];
			var context = ((HttpApplication)filterContext.HttpContext.GetService(typeof(HttpApplication))).Context;
			var isValidRequest = TwilioRequestValidator.Value.IsValidRequest(context, twilioAuthToken);

			if (!isValidRequest)
			{
				filterContext.Result = new System.Web.Mvc.HttpStatusCodeResult(HttpStatusCode.Forbidden);
			}
			base.OnActionExecuting(filterContext);
		}
	}
}
