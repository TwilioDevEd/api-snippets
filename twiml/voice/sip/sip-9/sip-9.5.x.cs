using Twilio.TwiML;
using Twilio.TwiML.Voice;
using Twilio.Http;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial(
            record: "record-from-answer",
            timeout: 10,
            hangupOnStar: true,
            callerId: "bob",
            method: HttpMethod.Post,
            action: new Uri("http://example.com/handle_post_dial")
        );

        var sip = new Sip(
            new Uri("http://example.com?customheader=foo"),
            "kate",
            url: new Uri("http://example.com/handle_screening_on_answer"),
            method: HttpMethod.Post
        );

        response.Append(sip);
        response.Append(dial);

        Console.WriteLine(response.ToString()); ;
    }
}
