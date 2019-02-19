Set<String> newParticipants = new HashSet<>();
newParticipants.add("charles");
newParticipants.add("dena");

/* See the "Create a Conversation" guide for instructions on configuring a
ConversationListener */
conversation.invite(newParticipants); 
/* Results in [newParticipants.size()] callbacks to
ConversationListener#onParticipantConnected and/or
ConversationListener#onFailedToConnectParticipant */
