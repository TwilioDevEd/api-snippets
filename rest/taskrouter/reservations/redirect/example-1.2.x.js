// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let twilio = require('twilio');

let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let taskSid = 'WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let reservationSid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

let client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

// redirect using a reservation
client.workspace.tasks(taskSid).reservations(reservationSid).update({
  Instruction: 'Redirect',
  RedirectCallSid: 'CA123456789',
  RedirectUrl: 'http://example.com/assignment_redirect',
}, function(err, reservation) {
  console.log(reservation.reservation_status);
  console.log(reservation.worker_name);
});
