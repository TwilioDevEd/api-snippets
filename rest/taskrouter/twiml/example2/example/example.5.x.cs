// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using System;
using System.Net;
using Twilio.TwiML;
using Twilio.TwiML.Voice;

class Example
{
    public static void SendResponse(HttpListenerContext ctx)
    {
        HttpListenerRequest request = ctx.Request;
        HttpListenerResponse response = ctx.Response;

        response.StatusCode = (int)HttpStatusCode.OK;
        response.ContentType = "text/xml";

        // Generate TwiML
        var twiml = new VoiceResponse();
        var enqueue = new Enqueue(workflowSid: "WW0123456789abcdef0123456789abcdef");
        enqueue.Task("{\"account_number\": \"12345abcdef\"}");
        twiml.Append(enqueue);

        // Write the output and close the stream
        byte[] buffer = Encoding.UTF8.GetBytes(twiml.ToString());
        response.ContentLength64 = buffer.Length;
        response.OutputStream.Write(buffer,0, buffer.Length);
        response.OutputStream.Close();
    }
}
