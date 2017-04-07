// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const workerSid = 'WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const reservationSid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const client = require('twilio')(accountSid, authToken);

// call using a reservation
client.taskrouter.v1
  .workspaces(workspaceSid)
  .workers(workerSid)
  .reservations(reservationSid)
  .update({
    instruction: 'call',
    callFrom: '+15558675309',
    callUrl: 'http://example.com/agent_answer',
    callStatusCallbackUrl: 'http://example.com/agent_answer_status_callback',
    callAccept: 'true',
  })
  .then((reservation) => {
    console.log(reservation.reservationStatus);
    console.log(reservation.workerName);
  });
