// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using System;
using System.Net;
using Twilio.TwiML;
using Twilio.Rest.Taskrouter.V1.Workspace;

class Example
{
    public static HttpListenerResponse SendResponse(HttpListenerContext ctx)
    {
        HttpListenerRequest request = ctx.Request;
        HttpListenerResponse response = ctx.Response;

        response.StatusCode = (int)HttpStatusCode.OK;
        response.ContentType = "text/xml";

        var twiml = new VoiceResponse();

        twiml.Enqueue("{\"account_number\":\"12345abcdef\"}",
            "/post_bridge_survey", waitUrl: "/hold_music",
            workflowSid: "WW0123456789abcdef0123456789abcdef");

        response.StatusDescription = twiml.ToString();
        return response;
    }
}
