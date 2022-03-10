using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        response.Pay(
            chargeAmount: "10.00", 
            paymentConnector: "My_Pay_Connector", 
            action: new Uri("https://your-callback-function-url.com/pay")
        );

        Console.WriteLine(response.ToString());
    }
}
