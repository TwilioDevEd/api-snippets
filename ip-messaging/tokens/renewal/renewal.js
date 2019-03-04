chatClient.on('tokenAboutToExpire', function() {
  // Make a secure request to your backend to retrieve a refreshed access token.
  // Use an authentication mechanism to prevent token exposure to 3rd parties.
  const updatedToken = await fetchToken();

  chatClient.updateToken(updatedToken);
});
