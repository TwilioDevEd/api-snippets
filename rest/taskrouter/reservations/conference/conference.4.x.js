// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const taskSid = 'WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const reservationSid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const client = require('twilio')(accountSid, authToken);

// Update a Reservation with a Conference instruction
client.taskrouter.v1
  .workspaces(workspaceSid)
  .tasks(taskSid)
  .reservations(reservationSid)
  .update({
    instruction: 'conference',
    from: '+18001231234',
    conferenceStatusCallback: 'https://www.example.com/ConferenceEvents',
    conferenceStatusCallbackEvent: [
      'start',
      'end',
      'join',
      'leave',
      'mute',
      'hold'
    ]})
  .then(reservation => {
    console.log(reservation.reservationStatus);
    console.log(reservation.workerName);
  });
