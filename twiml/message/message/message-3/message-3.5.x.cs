using Twilio.TwiML;
using Twilio.Http;
using System;


class Example
{
    static void Main()
    {
        var response = new MessagingResponse();
        response.Message("Store Location: 123 Easy St.",
            action: new Uri("/SmsHandler.php"), method: HttpMethod.Post);

        Console.WriteLine(response.ToString());;
    }
}
