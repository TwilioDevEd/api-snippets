// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

const mediaSid = 'ME557ce644e5ab84fa21cc21112e22c485';

client.messages('MM800f449d0399ed014aae2bcc0cc2f2ec').media(mediaSid)
  .remove()
  .then(() => {
    console.log(`Sid ${mediaSid} deleted successfully.`);
  })
  .catch((err) => console.log(err));
