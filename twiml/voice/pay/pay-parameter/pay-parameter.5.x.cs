using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;

class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var pay = new Pay(chargeAmount: "10.00", paymentConnector: "My_Generic_Pay_Connector", action: new Uri("https://your-callback-function-url.com/pay"));
        pay.Parameter(name: "card_type", value: "mastercard");
        response.Append(pay);

        Console.WriteLine(response.ToString());
    }
}