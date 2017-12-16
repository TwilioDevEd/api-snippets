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
        gather
            .Say("Please enter your account number,\nfollowed by the pound sign");
        response.Append(gather);
        response.Say("We didn't receive any input. Goodbye!");

        Console.WriteLine(response.ToString());;
    }
}
