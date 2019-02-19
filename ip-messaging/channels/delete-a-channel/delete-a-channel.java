channel.destroy(new StatusListener() {
  @Override
  public void onSuccess() {
    Log.d(TAG, "Successfully deleted channel");
  }
  
  @Override
  public void onError(ErrorInfo errorInfo) {
    Log.d(TAG, "Error deleting channel: " + errorInfo.getErrorText());
  }
});