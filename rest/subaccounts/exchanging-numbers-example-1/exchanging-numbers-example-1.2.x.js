// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
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

const phoneNumber = client
  .accounts(currentNumberOwnerAccountSid)
  .incomingPhoneNumbers(phoneNumberSid);

phoneNumber.update(
  {
    accountSid: newNumberOwnerAccountSid, // Specify a new account as owner
  },
  (err, number) => {
    console.log(number);
  }
);
