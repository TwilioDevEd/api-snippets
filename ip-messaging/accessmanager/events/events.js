accessManager.on('tokenExpired', () => {
  // generate new token here and set it to the accessManager
  const updatedToken = generateToken();
  accessManager.updateToken(updatedToken);
});
