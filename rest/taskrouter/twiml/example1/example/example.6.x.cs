// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using System;
using System.Net;
using Twilio.TwiML;

class Example
{
    public static HttpListenerResponse SendResponse(HttpListenerContext ctx)
    {
        HttpListenerRequest request = ctx.Request;
        HttpListenerResponse response = ctx.Response;

        response.StatusCode = (int)HttpStatusCode.OK;
        response.ContentType = "text/xml";

        var twiml = new VoiceResponse();
        twiml.Enqueue ("Sales", workflowSid: "WW0123456789abcdef0123456789abcdef");
        response.StatusDescription = twiml.ToString();
        return response;
    }
}
