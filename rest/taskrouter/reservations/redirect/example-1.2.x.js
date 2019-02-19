// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const twilio = require('twilio');

const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const taskSid = 'WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const reservationSid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

const client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

// redirect using a reservation
client.workspace.tasks(taskSid).reservations(reservationSid).update({
  Instruction: 'Redirect',
  RedirectCallSid: 'CA123456789',
  RedirectUrl: 'http://example.com/assignment_redirect',
}, (err, reservation) => {
  console.log(reservation.reservation_status);
  console.log(reservation.worker_name);
});
