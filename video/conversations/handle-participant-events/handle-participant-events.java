@Override
public void onParticipantConnected(Conversation conversation, Participant participant) {
    conversationStatusTextView.setText("onParticipantConnected " + participant.getIdentity());
    participant.setParticipantListener(participantListener());
}

@Override
public void onFailedToConnectParticipant(Conversation conversation, Participant participant, ConversationException e) {
    Log.e(TAG, e.getMessage());
    conversationStatusTextView.setText("onFailedToConnectParticipant " + participant.getIdentity());
}

@Override
public void onParticipantDisconnected(Conversation conversation, Participant participant) {
    conversationStatusTextView.setText("onParticipantDisconnected " + participant.getIdentity());
}
