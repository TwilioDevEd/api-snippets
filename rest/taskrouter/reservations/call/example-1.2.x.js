// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let twilio = require('twilio');

let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let taskSid = 'WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let reservationSid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

let client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

// call using a reservation
client.workspace.tasks(taskSid).reservations(reservationSid).update({
  instruction: 'call',
  callFrom: '+15558675309',
  callUrl: 'http://example.com/agent_answer',
  callStatusCallbackUrl: 'http://example.com/agent_answer_status_callback',
  callAccept: 'true',
}, function(err, reservation) {
  console.log(reservation.reservation_status);
  console.log(reservation.worker_name);
});
