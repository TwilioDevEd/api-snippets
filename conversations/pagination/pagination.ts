/* Paginating through Conversation and Message lists */
import {Conversation, Message, Paginator} from "@twilio/conversations";

// get the conversations paginator
let conversationsPaginator: Paginator<Conversation> = await client.getSubscribedConversations();

// get conversations
const conversations: Conversation[] = conversationsPaginator.items;

// get the next page
if (conversationsPaginator.hasNextPage) {
    conversationsPaginator = await conversationsPaginator.nextPage();
}

// get the previous page
if (conversationsPaginator.hasPrevPage) {
    conversationsPaginator = await conversationsPaginator.prevPage();
}

/* get the latest messages of the conversation. optional arguments:
  pageSize | 30,
  anchor | "end",
  direction | "backwards"
 */

// get the messages paginator with latest 30 messages
let messagesPaginator: Paginator<Message> = await conversation.getMessages(30, 0, "backwards");

// get messages amount of the conversation
const messagesCount: number = await conversation.getMessagesCount();

// get messages
const messages: Message[] = messagesPaginator.items;

// get the next page
if (messagesPaginator.hasNextPage) {
    messagesPaginator = await messagesPaginator.nextPage();
}

// get the previous page
if (messagesPaginator.hasPrevPage) {
    messagesPaginator = await messagesPaginator.prevPage();
}
