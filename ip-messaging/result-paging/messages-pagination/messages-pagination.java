// Fetch the initial messages
messagesObject.getLastMessages(BATCH_SIZE, new CallbackListener<List<Message>>()
{
  @Override
  public void onSuccess(List<Message> messagesArray) {
    // Display initial messages in your UI
  }
});

// ... user scrolls through messages list

// Fetch next set of messages when you get close to the
// end of your local messages
messagesObject.getMessagesBefore(firstMessage.getMessageIndex(), BATCH_SIZE,
                                 new CallbackListener<List<Message>>()
{
  @Override
  public void onSuccess(List<Message> messagesArray) {
    // Display latest messages in your UI
  }
});