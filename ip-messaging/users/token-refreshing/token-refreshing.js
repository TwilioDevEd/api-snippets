chatClient.on('tokenExpired', refreshToken);

function refreshToken() {
  fetchAccessToken(setNewToken);
}

function setNewToken(tokenResponse) {
  accessManager.updateToken(tokenResponse.token);
}
