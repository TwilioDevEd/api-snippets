/*
   Setting Read Horizon (all forms, like setAllRead, setNoneRead, advanceIndex, etc)
*/

import {Message} from "@twilio/conversations";

// get a message from conversation
const message: Message = await conversation.getMessages().items[5];

// set last read message index of the conversation
await conversation.updateLastReadMessageIndex(message.index);

// Mark all messages read
await conversation.setAllMessagesRead();

// Mark all messages unread
await conversation.setAllMessagesUnread();

// advance the conversation's last read message index to the current read horizon - won't allow you to move the marker backwards
await conversation.advanceLastReadMessageIndex(message.index);