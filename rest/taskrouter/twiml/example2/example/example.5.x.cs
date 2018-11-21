// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using System;
using System.Net;
using Twilio.TwiML;

namespace project {
    class TwilioExample
    {
        static void Main(string[] args)
        {
            if (!HttpListener.IsSupported)
            {
                Console.WriteLine ("HttpListener NOT supported.");
                return;
            }
            string[] prefixes = {"http://*:8080/"};

            // URI prefixes are required,
            if (prefixes == null || prefixes.Length == 0)
              throw new ArgumentException("prefixes");

            // Create a listener.
            HttpListener listener = new HttpListener();
            // Add the prefixes.
            foreach (string s in prefixes)
            {
                listener.Prefixes.Add(s);
            }
            listener.Start();
            Console.WriteLine("Listening...");

            // Note: The GetContext method blocks while waiting for a request.
            HttpListenerContext context = listener.GetContext();
            HttpListenerRequest request = context.Request;

            // Obtain a response object.
            var result = SendResponse(context);
            HttpListenerResponse response = result.Item1;
            string xml = result.Item2;

            byte[] buffer = System.Text.Encoding.UTF8.GetBytes(xml);

            // Get a response stream and write the response to it.
            response.ContentLength64 = buffer.Length;
            System.IO.Stream output = response.OutputStream;
            output.Write(buffer,0,buffer.Length);

            // You must close the output stream.
            output.Close();
            listener.Stop();

            Console.WriteLine("Output: \n"+xml);
        }

        public static (HttpListenerResponse, string) SendResponse(HttpListenerContext ctx)
        {
            HttpListenerRequest request = ctx.Request;
            HttpListenerResponse response = ctx.Response;

            response.StatusCode = (int)HttpStatusCode.OK;
            response.ContentType = "text/xml";

            var twiml = new VoiceResponse();
            twiml.Enqueue("{\"account_number\":\"12345abcdef\"}",
                workflowSid: "WW0123456789abcdef0123456789abcdef");

            string xml = twiml.ToString();
            return (response, xml);
        }
    }
}
