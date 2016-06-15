// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using System.Net;
using Twilio.TaskRouter;
class Example
{
  public static HttpListenerResponse SendResponse(HttpListenerContext ctx)
  {
    HttpListenerRequest request = ctx.Request;
    HttpListenerResponse response = ctx.Response;

    response.StatusCode = (int)HttpStatusCode.OK;
    response.ContentType = "application/xml";

    var twiml = new Twilio.TwiML.TwilioResponse();
    twiml.Enqueue (new { workflowSid = "WW0123456789abcdef0123456789abcdef" }, "{\"account_number\":\"12345abcdef\"}");
    response.StatusDescription = twiml.ToString();
    return response;
  }
}

