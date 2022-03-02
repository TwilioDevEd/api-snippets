/*
   Setting Read Horizon (all forms, like setAllRead, setNoneRead, advanceIndex, etc)
   Retrieving/checking Read Horizon for rendering
*/

import {Message} from "@twilio/conversations";

// get last read message index of the conversation
conversation.lastReadMessageIndex();

// get a message from conversation
const message: Message = await conversation.getMessages().items[5];

// set last read message index of the conversation
await conversation.updateLastReadMessageIndex(message.index);

// Mark all messages read
await conversation.setAllMessagesRead();

// Mark all messages unread
await conversation.setAllMessagesUnread();

// advance the conversation's last read message index to the current read horizon
await conversation.advanceLastReadMessageIndex(message.index);

// get unread messages count for the user, that is, count of all the messages after message
await conversation.getUnreadMessagesCount();
