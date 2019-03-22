public class Listener implements ChatClientListener {
  @Override public void onTokenAboutToExpire()
  {
    // Implement fetchToken() to make a secure request to your backend to retrieve a refreshed access token.
    // Use an authentication mechanism to prevent token exposure to 3rd parties.
    fetchToken((String updatedToken) -> {
      chatClient.updateToken(updatedToken, new StatusListener {
        @Override public void onSuccess() {
          System.out.println("Token renewed successfully");
        }
      });
    });
  }
}
