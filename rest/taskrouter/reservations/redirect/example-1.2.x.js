// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var twilio = require('twilio');

var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var taskSid = 'WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var reservationSid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

var client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

// redirect using a reservation
client.workspace.tasks(taskSid).reservations(reservationSid).update({
  Instruction: 'Redirect',
  RedirectCallSid: 'CA123456789',
  RedirectUrl: 'http://example.com/assignment_redirect',
}, function(err, reservation) {
  console.log(reservation.reservation_status);
  console.log(reservation.worker_name);
});
