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
 
    var message = twilio.SendMessage(
        "+14158141829", "+16518675309", 
        "Hey Jenny! Good luck on the bar exam!", 
        new string[] { "http://farm2.static.flickr.com/1075/1404618563_3ed9a44a3a.jpg" } , 
        null
    ); 
    Console.WriteLine(message.Sid); 
 } 
}