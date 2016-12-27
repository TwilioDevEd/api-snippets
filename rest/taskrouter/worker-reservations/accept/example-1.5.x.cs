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
        const string taskSid = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string reservationSid = "WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        
        TwilioClient.Init(accountSid, authToken);

        // accept a reservation
        var reservation = ReservationResource.Update(
            workspaceSid, taskSid, reservationSid,
            ReservationResource.StatusEnum.Accepted);

        Console.WriteLine(reservation.ReservationStatus);
    }
}
