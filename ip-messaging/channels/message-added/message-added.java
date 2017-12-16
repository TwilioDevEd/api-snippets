private ChannelListener mDefaultChannelListener = new ChannelListener() {
  @Override
  public void onMessageAdded(final Message message) {
    Log.d(TAG, "Message added: " + message.getMessageBody());
  }
}
