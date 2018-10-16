using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var pay = new Pay();
        var prompt = new Prompt(for_: "payment-card-number");
        prompt.Say("Please enter your 15 digit visa or master card number.");
        pay.Append(prompt);
        response.Append(pay);

        System.Console.WriteLine(response.ToString());
    }
}
