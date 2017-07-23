// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let twilio = require('twilio');

let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let workerSid = 'WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let reservationSid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

let client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

client.workspace
  .workers(workerSid)
  .reservations(reservationSid)
  .get(function(err, reservation) {
    console.log(reservation.reservation_status);
    console.log(reservation.worker_name);
  });
