Message message = channel.getMessages().createMessage("test");
channel.getMessages().sendMessage(message, new StatusListener() {
    @Override
    public void onSuccess() {
      Log.d(TAG,"Message sent successfully");
    }

    @Override
    public void onError(ErrorInfo errorInfo) {
        Log.e(TAG,"Error sending message: " + errorInfo.getErrorText());
    }
});