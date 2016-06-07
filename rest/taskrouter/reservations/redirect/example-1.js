// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var twilio = require('twilio');

var accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
var authToken = "{{ auth_token }}";
var workspaceSid = "{{ workspace_sid }}";
var taskSid = "{{ task_sid }}";
var reservationSid = "{{ reservation_sid }}";

var client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

// redirect using a reservation
client.workspace.tasks(taskSid).reservations(reservationSid).update({
    Instruction: 'Redirect',
    RedirectCallSid: 'CA123456789',
    RedirectUrl: 'http://example.com/assignment_redirect'
}, function(err, reservation) {
    console.log(reservation.reservation_status);
    console.log(reservation.worker_name);
});