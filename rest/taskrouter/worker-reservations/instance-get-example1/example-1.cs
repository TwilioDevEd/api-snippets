// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
class Example 
{
  static void Main(string[] args) 
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "{{ account_sid }}";
    string AuthToken = "{{ auth_token }}";
    string WorkspaceSid = "{{ workspace_sid }}";
    string TaskSid = "{{ task_sid }}";
    string ReservationSid = "{{ reservation_sid }}";

    var client = new TaskRouterClient(AccountSid, AuthToken);

    Reservation reservation = client.GetReservation(WorkspaceSid, TaskSid, ReservationSid);
    Console.WriteLine(reservation.ReservationStatus);
    Console.WriteLine(reservation.WorkerName);
  }
}