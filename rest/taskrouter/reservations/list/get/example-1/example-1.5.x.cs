// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using System;
using Twilio;
using Twilio.Rest.Taskrouter.V1.Workspace.Task;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string TaskSid = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        TwilioClient.Init(accountSid, authToken);

        var reservations = ReservationResource.Read(workspaceSid, TaskSid);

        foreach(ReservationResource reservation in reservations) {
            Console.WriteLine(reservation.ReservationStatus);
            Console.WriteLine(reservation.WorkerName);
        }
    }
}
