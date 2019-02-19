  channel.getMessages().getLastMessages(50, new CallbackListener<List<Message>>() {
    @Override
    public void onSuccess(List<Message> messages) {
      for (Message message : messages) {
        Log.d(TAG, "Message Body: " + message.getMessageBody());
      }
    }
  });