using System;
using Twilio.TwiML;
using Twilio.TwiML.Messaging;


class Example
{
    static void Main()
    {
        var response = new MessagingResponse();
        response.Message("Store Location: 123 Easy St.",
            action: new Uri("/SmsHandler.php"), method: Twilio.Http.HttpMethod
            .Post);

        Console.WriteLine(response.ToString());
    }
}
