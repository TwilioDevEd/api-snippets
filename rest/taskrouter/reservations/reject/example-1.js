// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var twilio = require('twilio');

var accountSid = "{{ account_sid }}";
var authToken = "{{ auth_token }}";
var workspaceSid = "{{ workspace_sid }}";
var taskSid = "{{ task_sid }}";
var reservationSid = "{{ reservation_sid }}";

var client = new twilio.TaskRouterClient(accountSid, authToken, workspaceSid);

// reject a reservation
client.workspace.tasks(taskSid).reservations(reservationSid).update({
    reservationStatus: 'rejected'
}, function(err, reservation) {
    console.log(reservation.reservation_status);
    console.log(reservation.worker_name);
});