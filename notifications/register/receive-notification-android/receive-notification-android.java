private static final String TAG = "MyFcmListenerService";
  @Override
  public void onMessageReceived(RemoteMessage message) {
    Map<String,String> data = message.getData();
    String body = data.get("twi_body");
    String title = data.get("twi_title");
    Log.d(TAG, "From: " + from);
    Log.d(TAG, "Body: " + body);
  }
}
