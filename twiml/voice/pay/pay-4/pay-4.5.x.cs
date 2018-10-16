using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Pay(paymentConnector: "Stripe_Connector_1");

        System.Console.WriteLine(response.ToString());
    }
}
