using System;
using Twilio;
class TwilioAutoRespond {
    static void Main(string[] args) {
        Response.ContentType = "text/xml";
        var twiml = new Twilio.TwiML.TwilioResponse();
        var body = Request["Body"];
        if( body == "hello" ){
            twiml.Message("Hi!");
        }else if( body == "bye" ){
            twiml.Message("Goodbye");
        }
    }
}
