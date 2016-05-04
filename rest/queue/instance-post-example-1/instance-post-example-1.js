// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = '{{ account_sid }}';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.queues("QU32a3c49700934481addd5ce1659f04d2").update({
    maxSize: "123"
}, function(err, queue) {
    console.log(queue.averageWaitTime);
});