@Override
public void onMessageAdd(final Message message) {
  Log.d(TAG, "Message added: " + message.getMessageBody());
}

@Override
public void onMessageChange(Message message) {
  Log.d(TAG, "Message changed: " + message.getMessageBody());
}

@Override
public void onMessageDelete(Message message) {
  Log.d(TAG, "Message deleted");
}

