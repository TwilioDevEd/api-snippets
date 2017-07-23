// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const workerSid = 'WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const reservationSid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const client = require('twilio')(accountSid, authToken);

// dequeue a reservation
client.taskrouter.v1
  .workspaces(workspaceSid)
  .workers(workerSid)
  .reservations(reservationSid)
  .fetch()
  .then(reservation => {
    console.log(reservation.reservationStatus);
    console.log(reservation.workerName);
  });
