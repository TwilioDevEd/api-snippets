// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.TaskRouter;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    string AccountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string AuthToken = "your_auth_token";
    string WorkspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string TaskSid = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    string ReservationSid = "WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    var client = new TaskRouterClient(AccountSid, AuthToken);

    Reservation reservation = client.GetReservation(WorkspaceSid, TaskSid, ReservationSid);
    Console.WriteLine(reservation.ReservationStatus);
    Console.WriteLine(reservation.WorkerName);
  }
}