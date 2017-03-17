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

@Override
public void onMemberJoin(Member member) {
  Log.d(TAG, "Member joined: " + member.getUserInfo().getIdentity());
}

@Override
public void onMemberChange(Member member) {
  Log.d(TAG, "Member changed: " + member.getUserInfo().getIdentity());
}

@Override
public void onMemberDelete(Member member) {
  Log.d(TAG, "Member deleted: " + member.getUserInfo().getIdentity());
}

@Override
public void onTypingStarted(Member member) {
  Log.d(TAG, "Started Typing: " + member.getUserInfo().getIdentity());
}

@Override
public void onTypingEnded(Member member) {
  Log.d(TAG, "Ended Typing: " + member.getUserInfo().getIdentity());
}

@Override
public void onSynchronizationChange(Channel channel) {

}