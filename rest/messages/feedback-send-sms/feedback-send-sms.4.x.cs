// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Newtonsoft.Json;
using RestSharp;
using Twilio;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        string AuthToken = "your_auth_token";
        var twilio = new TwilioRestClient(AccountSid, AuthToken);

        // Generate a random, unique code
        var uniqueCode = "1234567890";
        
        // Normally, we would call twilio.SendMessage() to send an SMS
        // But it doesn't support passing the ProvideFeedback parameter.
        var request = new RestRequest("Accounts/" + AccountSid + "/Messages.json", Method.POST);
        request.AddParameter("From", "+15017122661");
        request.AddParameter("To", "+15558675310");
        request.AddParameter("Body", "Open to confirm: http://yourserver.com/confirm?id=" + uniqueCode);
        request.AddParameter("ProvideFeedback", true);
        var response = twilio.Execute(request);

        var message = JsonConvert.DeserializeObject<Message>(response.Content, 
            new JsonSerializerSettings() { NullValueHandling = NullValueHandling.Ignore });

        Console.WriteLine("We should save this to a database:");
        Console.WriteLine("Unique Code = " + uniqueCode);
        Console.WriteLine("Message SID = " + message.Sid);
    }
}
