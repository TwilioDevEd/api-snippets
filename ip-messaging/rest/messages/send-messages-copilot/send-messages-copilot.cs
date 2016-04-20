// Download the twilio-csharp library from twilio.com/docs/csharp/install 
using System; 
using Twilio; 
class Example 
{ 
 static void Main(string[] args) 
 { 
    // Find your Account Sid and Auth Token at twilio.com/user/account 
    string AccountSid = "AC5ef872f6da5a21de157d80997a64bd33"; 
    string AuthToken = "[AuthToken]"; 
    var twilio = new TwilioRestClient(AccountSid, AuthToken); 
 
    var message = twilio.SendMessageWithService(
        "MG9752274e9e519418a7406176694466fa", "+16518675309", 
        "Phantom Menace was clearly the best of the prequel trilogy."
    ); 
    Console.WriteLine(message.Sid); 
 } 
}