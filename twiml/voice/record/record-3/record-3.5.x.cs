using Twilio.TwiML;


public class Record-3.5.x
{
    public static void Main()
    {
        var response = new VoiceResponse();
        response.Say("Please leave a message at the beep.\nPress the star key when finished.");
        response.Record(action: "http://foo.edu/handleRecording.php", method: "GET", maxLength: 20, finishOnKey: "*");
        response.Say("I did not receive a recording");

        System.Console.WriteLine(response.ToString());
    }
}
