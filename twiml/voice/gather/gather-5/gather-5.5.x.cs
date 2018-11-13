using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var gather = new Gather(action: new Uri("/process_gather.php"),
            method: Twilio.Http.HttpMethod.Get);
        gather.Say("Enter something, or not");
        response.Append(gather);
        response.Redirect(method: Twilio.Http.HttpMethod.Get,
            url: new Uri("/process_gather.php?Digits=TIMEOUT"));

        Console.WriteLine(response.ToString());
    }
}
