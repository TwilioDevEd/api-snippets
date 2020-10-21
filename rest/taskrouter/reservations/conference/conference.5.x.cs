// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Taskrouter.V1.Workspace.Task;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        const string workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string taskSid = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string reservationSid = "WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        TwilioClient.Init(accountSid, authToken);

        // Update a Reservation with a Conference instruction
        var reservation = ReservationResource.Fetch(
                              workspaceSid, taskSid, reservationSid);

        Console.WriteLine(reservation.ReservationStatus);
        Console.WriteLine(reservation.WorkerName);

        ReservationResource.Update(
            workspaceSid, taskSid, reservationSid,
            instruction: "conference",
            from: "+18001231234",
            conferenceStatusCallback: "https://www.example.com/ConferenceEvents",
            conferenceStatusCallbackEvent: new List<ReservationResource.ConferenceEventEnum>
            {
                ReservationResource.ConferenceEventEnum.Start,
                ReservationResource.ConferenceEventEnum.End,
                ReservationResource.ConferenceEventEnum.Join,
                ReservationResource.ConferenceEventEnum.Leave,
                ReservationResource.ConferenceEventEnum.Mute,
                ReservationResource.ConferenceEventEnum.Hold
            }
        );
    }
}
