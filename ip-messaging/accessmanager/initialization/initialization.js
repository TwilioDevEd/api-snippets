const token = generateToken();

const accessManager = new AccessManager(token);
const chatClient = new ChatClient(token);

accessManager.on('tokenUpdated', am => {
  // get new token from AccessManager and pass it to the library instance
  chatClient.updateToken(am.token);
});
