private ChannelListener mDefaultChannelListener = new ChannelListener() {
  @Override
  public void onMessageAdd(final Message message) {
    Log.d(TAG, "Message added: " + message.getMessageBody());
  }
}
