@Override
public void onMemberJoined(Member member) {
  Log.d(TAG, "Member joined: " + member.getUserInfo().getIdentity());
}

@Override
public void onMemberUpdated(Member member) {
  Log.d(TAG, "Member changed: " + member.getUserInfo().getIdentity());
}

@Override
public void onMemberDeleted(Member member) {
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
public void onSynchronizationChanged(Channel channel) {

}