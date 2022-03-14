using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;

class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var pay = new Pay(chargeAmount: "10.00", paymentConnector: "My_Generic_Pay_Connector", action: new Uri("https://your-callback-function-url.com/pay"));
        pay.Parameter(name: "custom_parameter_1", value: "custom_value_1");
        response.Append(pay);

        Console.WriteLine(response.ToString());
    }
}