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
        const string taskSid = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string reservationSid = "WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        TwilioClient.Init(accountSid, authToken);

        // Update a Reservation with a Redirect instruction
        var reservation = ReservationResource.Fetch(workspaceSid, taskSid, reservationSid);
        Console.WriteLine(reservation.ReservationStatus);
        Console.WriteLine(reservation.WorkerName);

        ReservationResource.Update(workspaceSid, taskSid, reservationSid,
            instruction: "Redirect",
            redirectCallSid: "CA123456789",
            redirectUrl: new Uri("http://example.com/assignment_redirect"));
    }
}
