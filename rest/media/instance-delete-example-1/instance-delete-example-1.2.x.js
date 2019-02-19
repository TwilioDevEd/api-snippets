// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client
  .messages('MM800f449d0399ed014aae2bcc0cc2f2ec')
  .media('ME557ce644e5ab84fa21cc21112e22c485')
  .delete((err, data) => {
    if (err) {
      console.log(err.status);
      throw err.message;
    } else {
      console.log(
        'Sid ME557ce644e5ab84fa21cc21112e22c485 deleted successfully.'
      );
    }
  });
