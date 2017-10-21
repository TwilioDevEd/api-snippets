using Twilio.TwiML;
using Twilio.Http;
using Twilio.TwiML.Voice;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var gather = new Gather(action: new Uri("/process_gather.php"), method: HttpMethod.Get);
        gather.Say("Enter something, or not");
        response.Append(gather);
        response.Redirect(new Uri("/process_gather.php?Digits=TIMEOUT"), method: HttpMethod.Get);

        Console.WriteLine(response.ToString());;
    }
}
