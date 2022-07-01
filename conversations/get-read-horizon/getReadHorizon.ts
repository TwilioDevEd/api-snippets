/*
   Retrieving/checking Read Horizon for rendering
*/

// get last read message index of the conversation
conversation.lastReadMessageIndex();

// get last read message index of another participant in the conversation
participant.lastReadMessageIndex();

// check the index of a message
message.index;

// get unread messages count for the user, that is, count of all the messages after message
await conversation.getUnreadMessagesCount();