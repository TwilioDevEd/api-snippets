public class Listener
  implements
    AccessManager.Listener,
    AccessManager.TokenUpdateListener {

  // AccessManager.Listener - handle token lifecycle

  @Override
  public void onTokenWillExpire(AccessManager accessManager)
  {
    // Token will soon expire.
    // ...
    // Get new token here.
    // ...

    accessManager.updateToken(NEW_VALID_TOKEN);
    // accessManager will then update token and call onTokenUpdated()
  }

  @Override
  public void onTokenExpired(AccessManager accessManager)
  {
    // Token expired.
    // ...
    // Get new token here.
    // ...

    accessManager.updateToken(NEW_VALID_TOKEN);
  }

  @Override
  public void onError(AccessManager accessManager, String err)
  {
    // An error occured in the AccessManager
  }

  // AccessManager.TokenUpdateListener - update all components with new token
  // This is called by AccessManager when new token is available to update SDK
  // clients.

  @Override
  public void onTokenUpdated(String token)
  {
    // Update Twilio client(s) in this callback
    chatClient.updateToken(token, tokenUpdateListener);
  }

}
