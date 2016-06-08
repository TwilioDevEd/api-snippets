// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AuthToken = "{{ auth_token }}";
    string WorkspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string TaskSid = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string ReservationSid = "{{ reservation_sid }}";
    var client = new TaskRouterClient(AccountSid, AuthToken);

    // reject a reservation
    Reservation reservation = client.UpdateReservation(WorkspaceSid, TaskSid, ReservationSid, "rejected", null);
    Console.WriteLine(reservation.ReservationStatus);
  }
}