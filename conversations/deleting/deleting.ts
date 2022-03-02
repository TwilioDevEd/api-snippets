/* Deleting Conversations/Messages/Participants */

/* Conversations */

// destroys the conversation, with all its messages and attached media and removes all participants
await conversation.delete();

/* Messages */

// remove a message from the conversation, destroying any attached media
await message.remove();

/* Participants */

// remove participant from the conversation
await participant.remove();
