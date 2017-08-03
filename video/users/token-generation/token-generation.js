// We use jQuery to make an Ajax request to the server to retrieve our
// Access Token
$.getJSON('/token', function(data) {
  // The data sent back from the server should contain a long string - this is
  // the JWT token you need to initialize the SDK. Read more about JWT
  // (JSON Web Token) at http://jwt.io
  console.log(data.token);

  // Since the quickstart app doesn't implement authentication, the server
  // sends back a randomly generated username for the current client, which is
  // how they will be identified when sending and receiving Conversation
  // invites. If your app has an existing authentication system, you can use
  // the e-mail address or username that uniquely identifies a user instead.
  console.log(data.identity);
});
