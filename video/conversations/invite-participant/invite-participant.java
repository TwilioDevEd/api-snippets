Set<String> newParticipants = new HashSet<>();
newParticipants.add("charles");

/* See the "Create a Conversation" guide for instructions on configuring a
ConversationListener */
conversation.invite(newParticipants); 
/* Results in a callback to ConversationListener#onParticipantConnected or
ConversationListener#onFailedToConnectParticipant */
