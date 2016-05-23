private static final String TAG = "MyGcmListenerService";
  @Override
  public void onMessageReceived(String from, Bundle data) {
    String body = "";
    if (notification != null) {
      body = notification.getString("body");
    }
    Log.d(TAG, "From: " + from);
    Log.d(TAG, "Body: " + body);
  }
}
