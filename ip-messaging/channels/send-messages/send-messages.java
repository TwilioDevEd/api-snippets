channel.getMessages().sendMessage("test", new StatusListener() {
    @Override
    public void onSuccess() {
      Log.d(TAG,"Message sent successfully");
    }

    @Override
    public void onError(ErrorInfo errorInfo) {
        Log.e(TAG,"Error sending message: " + errorInfo.toString());
    }
});