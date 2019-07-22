using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var dial = new Dial(record: Dial.RecordEnum.RecordFromAnswer,
            timeout: 10, hangupOnStar: true, callerId: "bob", method: Twilio
            .Http.HttpMethod.Post, action: new Uri("/handle_post_dial"));
        dial.Sip(new Uri("sip:kate@example.com?x-customheader=foo"),
            method: Twilio.Http.HttpMethod.Post,
            url: new Uri("/handle_screening_on_answer"));
        response.Append(dial);

        Console.WriteLine(response.ToString());
    }
}
