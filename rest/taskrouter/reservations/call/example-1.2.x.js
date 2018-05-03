// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const twilio = require('twilio');

const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const taskSid = 'WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const reservationSid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

const client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

// call using a reservation
client.workspace.tasks(taskSid).reservations(reservationSid).update({
  instruction: 'call',
  callFrom: '+15558675310',
  callUrl: 'http://example.com/agent_answer',
  callStatusCallbackUrl: 'http://example.com/agent_answer_status_callback',
  callAccept: 'true',
}, (err, reservation) => {
  console.log(reservation.reservation_status);
  console.log(reservation.worker_name);
});
