// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const workspaceSid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const taskSid = 'WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const reservationSid = 'WRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const client = require('twilio')(accountSid, authToken);

client.taskrouter.v1
  .workspaces(workspaceSid)
  .tasks(taskSid)
  .reservations(reservationSid)
  .fetch()
  .then((reservation) => {
    console.log(reservation.reservation_status);
    console.log(reservation.worker_name);
  });
