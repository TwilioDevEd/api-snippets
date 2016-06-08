// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var twilio = require('twilio');

var accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
var authToken = "{{ auth_token }}";
var workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
var workerSid = "{{ worker_sid }}";
var reservationSid = "{{ reservation_sid }}";

var client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

// call using a reservation
client.workspace.workers(workerSid).reservations(reservationSid).update({
    instruction: 'call',
    callFrom: '+15558675309',
    callUrl: 'http://example.com/agent_answer',
    callStatusCallbackUrl: 'http://example.com/agent_answer_status_callback',
    callAccept: 'true'
}, function(err, reservation) {
    console.log(reservation.reservation_status);
    console.log(reservation.worker_name);
});