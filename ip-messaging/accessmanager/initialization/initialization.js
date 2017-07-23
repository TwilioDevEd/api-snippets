let token = generateToken();

let accessManager = new AccessManager(token);
let chatClient = new ChatClient(token);

accessManager.on('tokenUpdated', am => {
  // get new token from AccessManager and pass it to the library instance
  chatClient.updateToken(am.token);
});
