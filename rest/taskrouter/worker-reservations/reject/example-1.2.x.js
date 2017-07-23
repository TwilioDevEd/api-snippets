// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const twilio = require('twilio');

const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const workerSid = 'WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const reservationSid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

const client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

// reject a reservation
client.workspace.workers(workerSid).reservations(reservationSid).update({
  reservationStatus: 'rejected',
}, (err, reservation) => {
  console.log(reservation.reservation_status);
  console.log(reservation.worker_name);
});
