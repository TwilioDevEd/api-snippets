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
    var task = new Task("{\"account_number\":\"12345abcdef\"}", new {priority = "5", timeout = "200"});
    twiml.EnqueueTask (new { workflowSid = "WW0123456789abcdef0123456789abcdef" }, task);

    // alternatively
    twiml.Enqueue (new { workflowSid = "WW0123456789abcdef0123456789abcdef" }, "{\"account_number\":\"12345abcdef\"}",  new {priority = "5", timeout = "200"});

    response.StatusDescription = twiml.ToString();
    return response;
  }
}

