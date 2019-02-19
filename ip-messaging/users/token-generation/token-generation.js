function fetchAccessToken(handler) {
  // We use jQuery to make an Ajax request to the server to retrieve our
  // Access Token
  $.getJSON(
    '/token',
    {
      // we pass along a "device" query parameter to identify the device we
      // are connecting from. You would also pass along any other info needed for
      // your server to establish the identity of the client
      device: 'browser',
    },
    function(data) {
      // The data sent back from the server should contain a long string, which
      // is the token you'll need to initialize the SDK. This string is in a format
      // called JWT (JSON Web Token) - more at http://jwt.io
      console.log(data.token);

      // Since the starter app doesn't implement authentication, the server sends
      // back a randomly generated username for the current client, which is how
      // they will be identified while sending messages. If your app has a login
      // system, you should use the e-mail address or username that uniquely identifies
      // a user instead.
      console.log(data.identity);

      handler(data);
    }
  );
}
