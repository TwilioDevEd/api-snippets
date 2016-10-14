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
    string WorkerSid = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    var client = new TaskRouterClient(AccountSid, AuthToken);

    ReservationResult reservationResult = client.ListReservationsForWorker(WorkspaceSid, WorkerSid);
    foreach(Reservation reservation in reservationResult.Reservations) {
        Console.WriteLine(reservation.ReservationStatus);
        Console.WriteLine(reservation.WorkerName);
    }
  }
}