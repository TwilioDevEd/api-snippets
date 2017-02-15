// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using System;
using System.Net;
using Twilio;
using Twilio.Rest.Taskrouter.V1.Workspace.Worker;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string WorkerSid = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        TwilioClient.Init(accountSid, authToken);

        var reservations = ReservationResource.Read(workspaceSid, WorkerSid);
        foreach(var reservation in reservations) {
            Console.WriteLine(reservation.ReservationStatus);
            Console.WriteLine(reservation.WorkerName);
        }
    }
}
