chatClient.updateToken(accessToken, new StatusListener {
  @Override public void onSuccess() {
    System.out.println("Token updated successfully");
  }
});
