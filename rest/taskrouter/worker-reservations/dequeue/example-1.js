// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var twilio = require('twilio');

var accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
var authToken = "{{ auth_token }}";
var workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
var workerSid = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
var reservationSid = "{{ reservation_sid }}";

var client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

// dequeue a reservation
client.workspace.workers(workerSid).reservations(reservationSid).update({
    instruction: 'dequeue',
    dequeueFrom: '+18001231234'
}, function(err, reservation) {
    console.log(reservation.reservation_status);
    console.log(reservation.worker_name);
});