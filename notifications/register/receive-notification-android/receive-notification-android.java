private static final String TAG = "MyGcmListenerService";
  @Override
  public void onMessageReceived(String from, Bundle data) {
     String body = data.getString("twi_body");
     Log.d(TAG, "From: " + from);
     Log.d(TAG, "Body: " + body);
  }
}
