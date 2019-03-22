const Chat = require('twilio-chat');

// Make a secure request to your backend to retrieve an access token.
// Use an authentication mechanism to prevent token exposure to 3rd parties.

const accessToken = '<your accessToken>';

Chat.Client.create(accessToken)
  .then(client => {
    // Use Programmable Chat client
  });
