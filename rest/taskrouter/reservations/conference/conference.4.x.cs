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

    // Update a Reservation with a Conference instruction
    Reservation reservation = client.GetReservation(WorkspaceSid, TaskSid, ReservationSid);
    Console.WriteLine(reservation.ReservationStatus);
    Console.WriteLine(reservation.WorkerName);

    client.UpdateReservation(WorkspaceSid, "Tasks", TaskSid, ReservationSid,
        instruction: "conference",
        from: "+18001231234",
        conferenceStatusCallback: "https://www.example.com/ConferenceEvents",
        conferenceStatusCallbackEvent: new string[] { "start", "end", "join", "leave", "mute", "hold" }
    );
  }
}
