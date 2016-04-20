// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACdc5f132a3c49700934481addd5ce1659';
var authToken = "{{ auth_token }}";
var client = require('twilio')(accountSid, authToken);

client.addresses.create({
    friendlyName: "Billing - Customer 123",
    customerName: "Customer 123",
    street: "1 Hasselhoff Lane",
    city: "Berlin",
    region: "Berlin",
    postalCode: "10875",
    isoCountry: "DE"
}, function(err, address) {
    console.log(address.customerName);
});
