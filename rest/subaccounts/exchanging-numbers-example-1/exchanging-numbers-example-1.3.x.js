// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

// In the case you want to transfer numbers between accounts, you need to know
// three things - the account SID of the phone number's current owner, the
// account SID of the account you'd like to transfer the number to, and the SID
// of the phone number you'd like to transfer
const currentNumberOwnerAccountSid = 'ACyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy';
const newNumberOwnerAccountSid = 'ACzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz';
const phoneNumberSid = 'PNyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy';

client.api
  .accounts(currentNumberOwnerAccountSid)
  .incomingPhoneNumbers(phoneNumberSid)
  .update({
    accountSid: newNumberOwnerAccountSid, // specify new account owner
  })
  .then(number => console.log(number));
