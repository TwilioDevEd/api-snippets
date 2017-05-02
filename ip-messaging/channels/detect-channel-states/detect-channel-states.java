@Override
public void onMessageAdded(Message message) {
  Log.d(TAG, "Message added: " + message.getMessageBody());
}

@Override
public void onMessageUpdated(Message message) {
  Log.d(TAG, "Message changed: " + message.getMessageBody());
}

@Override
public void onMessageDeleted(Message message) {
  Log.d(TAG, "Message deleted");
}