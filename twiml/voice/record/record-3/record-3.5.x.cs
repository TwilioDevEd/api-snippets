using Twilio.TwiML;
using Twilio.Http;
using System;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response
            .Say("Please leave a message at the beep.\nPress the star key when finished.");
        response.Record(action: new Uri("http://foo.edu/handleRecording.php"),
            method: HttpMethod.Get, maxLength: 20, finishOnKey: "*");
        response.Say("I did not receive a recording");

        Console.WriteLine(response.ToString());;
    }
}
